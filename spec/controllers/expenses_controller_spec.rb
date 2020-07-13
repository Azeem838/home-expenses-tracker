require 'rails_helper'

RSpec.describe ExpensesController, type: :controller do
  before { sign_in FactoryBot.create(:user) }
  before { @expense = FactoryBot.create(:expense) }

  describe 'GET #all_expenses' do
    it 'Renders all_expenses page' do
      get :all_expenses
      expect(response).to be_successful
      expect(response).to render_template(:all_expenses)
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #all_external_expenses' do
    it 'Renders all_external_expenses page' do
      get :all_external_expenses
      expect(response).to be_successful
      expect(response).to render_template(:all_external_expenses)
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #show' do
    it 'Renders expense show page' do
      get :show, params: { id: @expense.id }
      expect(response).to be_successful
      expect(response).to render_template(:show)
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #new' do
    it 'Renders expense new page' do
      get :new
      expect(response).to be_successful
      expect(response).to render_template(:new)
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #edit' do
    it 'Renders expense edit page' do
      get :edit, params: { id: @expense.id }
      expect(response).to be_successful
      expect(response).to render_template(:edit)
      expect(response).to have_http_status(200)
    end
  end

  describe 'Create #create' do
    context 'with invalid params' do
      it 'does not save the expense and renders new template' do
        post :create, params: { expense: { name: '' } }
        expect(response).to render_template('new')
      end
    end

    context 'with valid params' do
      it 'redirects to the all_expenses page' do
        post :create, params: { expense: { name: @expense.name, amount: @expense.amount } }
        expect(response).to redirect_to(all_expenses_path)
      end
    end
  end

  describe 'Update #update' do
    context 'with invalid params' do
      it 'does not save the expense and renders edit template' do
        patch :update, params: { id: @expense.id, expense: { name: '' } }
        expect(response).to render_template('edit')
      end
    end

    context 'with valid params' do
      it 'redirects to the expense show page' do
        patch :update, params: { id: @expense.id, expense: { name: @expense.name, amount: @expense.amount } }
        expect(response).to redirect_to(all_expenses_path)
      end
    end
  end

  describe 'Destroy #destroy' do
    context 'with valid params' do
      it 'redirects to the all_expenses page' do
        delete :destroy, params: { id: @expense.id, group: { name: @expense.name, amount: @expense.amount } }
        expect(response).to redirect_to(all_expenses_path)
      end
    end
  end
end

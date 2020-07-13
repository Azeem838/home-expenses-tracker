require 'rails_helper'

RSpec.describe ExpenseGroupsController, type: :controller do
  before { sign_in FactoryBot.create(:user) }
  before { @expense = FactoryBot.create(:expense) }
  before { @group = FactoryBot.create(:group) }
  before { @eg = FactoryBot.create(:expense_group) }

  describe 'Create #create' do
    context 'with valid params' do
      it 'redirects to the current group page' do
        post :create, params: { expense: @expense.id, group: @group.id }
        expect(response).to redirect_to(@group)
      end
    end
  end

  describe 'Destroy #destroy' do
    context 'with valid params' do
      it 'redirects to the current group page' do
        delete :destroy, params: { id: @eg.id, expense: @expense.id, group: @group.id }
        expect(response).to redirect_to(@group)
      end
    end
  end
end

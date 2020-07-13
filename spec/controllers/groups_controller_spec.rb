require 'rails_helper'

RSpec.describe GroupsController, type: :controller do
  before { sign_in FactoryBot.create(:user) }
  before { @group = FactoryBot.create(:group) }

  describe 'GET #index' do
    it 'Renders group index page' do
      get :index
      expect(response).to be_successful
      expect(response).to render_template(:index)
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #show' do
    it 'Renders group show page' do
      get :show, params: { id: @group.id }
      expect(response).to be_successful
      expect(response).to render_template(:show)
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #new' do
    it 'Renders group new page' do
      get :new
      expect(response).to be_successful
      expect(response).to render_template(:new)
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #edit' do
    it 'Renders group edit page' do
      get :edit, params: { id: @group.id }
      expect(response).to be_successful
      expect(response).to render_template(:edit)
      expect(response).to have_http_status(200)
    end
  end

  describe 'Create #create' do
    context 'with invalid params' do
      it 'does not save the group and renders new template' do
        post :create, params: { group: { name: '' } }
        expect(response).to render_template('new')
      end
    end

    context 'with valid params' do
      it 'redirects to the group show page' do
        post :create, params: { group: { name: @group.name } }
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'Update #update' do
    context 'with invalid params' do
      it 'does not save the group and renders edit template' do
        patch :update, params: { id: @group.id, group: { name: '' } }
        expect(response).to render_template('edit')
      end
    end

    context 'with valid params' do
      it 'redirects to the group show page' do
        patch :update, params: { id: @group.id, group: { name: @group.name } }
        expect(response).to redirect_to(@group)
      end
    end
  end

  describe 'Destroy #destroy' do
    context 'with valid params' do
      it 'redirects to the all_groups page' do
        delete :destroy, params: { id: @group.id, group: { name: @group.name } }
        expect(response).to redirect_to(all_groups_path)
      end
    end
  end
end

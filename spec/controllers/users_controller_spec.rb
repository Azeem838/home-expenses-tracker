require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before { sign_in FactoryBot.create(:user) }

  describe 'GET #show' do
    it 'Renders user show page' do
      get :show
      expect(response).to be_successful
      expect(response).to render_template(:show)
      expect(response).to have_http_status(200)
    end
  end
end

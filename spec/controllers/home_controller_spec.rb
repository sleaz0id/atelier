require 'rails_helper'

RSpec.describe ::HomeController, type: :controller do
  describe 'GET #index' do

    context 'user not authenticated' do
      it 'returns http success' do
        get :index
        expect(response).to have_http_status(302)
      end
    end

    context 'user authenticated' do
      login_user
      it 'returns http success' do
        get :index
        expect(response).to have_http_status(200)
      end
    end
  end
end

require 'rails_helper'
require 'faker'

RSpec.describe 'ShoppingLists', type: :request do
  before(:each) do
    @fake_user = User.create!(name: Faker::Name.unique.name,
                              email: Faker::Internet.email,
                              password: '123456', password_confirmation: '123456')

    sign_in @fake_user
  end
  describe 'GET /index' do
    it 'returns http success' do
      get '/general_shopping_list'
      expect(response).to have_http_status(:success)
    end
  end
end

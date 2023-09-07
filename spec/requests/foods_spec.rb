require 'rails_helper'
require 'faker'

RSpec.describe 'Foods', type: :request do
  before(:each) do
    @fake_user = User.create!(name: Faker::Name.unique.name,
                              email: Faker::Internet.email,
                              password: '123456', password_confirmation: '123456')

    @food = Food.create(name: 'Carrot', measurement_unit: 'KG', price: 10, quantity: 2, user: @fake_user)
  end
  describe 'GET /index' do
    it 'returns http success' do
      sign_in @fake_user
      get '/foods'
      expect(response).to have_http_status(:success)
    end
    it 'should render the food index action correctly' do
      sign_in @fake_user
      get '/foods'
      expect(response).to be_successful
      expect(response.body).to include('Carrot')
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      sign_in @fake_user
      get '/foods/new'
      expect(response).to have_http_status(:success)
    end
    it 'should alow users to create foods' do
      sign_in @fake_user
      get '/foods'
      expect(response).to be_successful
      expect(response.body).to include('Add Food')
    end
  end
end

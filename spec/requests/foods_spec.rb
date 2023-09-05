require 'rails_helper'

RSpec.describe 'Foods', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/foods/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/foods/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /delete' do
    it 'returns http success' do
      get '/foods/delete'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /update' do
    it 'returns http success' do
      get '/foods/update'
      expect(response).to have_http_status(:success)
    end
  end
end

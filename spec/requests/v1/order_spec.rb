require 'rails_helper'

RSpec.describe Api::V1::OrdersController, type: :request do
  describe 'POST /v1/orders' do
    it 'should add a dish to order' do
      FactoryGirl.create(:dish)
      post '/api/v1/orders'
      expect(response_json['message']).to eq "Successfully added Pizza"
      expect(response.status).to eq 200
    end
  end
end
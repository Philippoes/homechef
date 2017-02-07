require 'rails_helper'

RSpec.describe Api::V1::OrdersController, type: :request do
  describe 'GET /v1/dishes' do
    it 'should add a dish to order' do
      FactoryGirl.create(:dish)
      get '/api/v1/add_to_order'
      expect(response.status).to eq 200
      expect(response_json['message'].to eq "Successfully added #{:dish} to order"
    end
  end
end
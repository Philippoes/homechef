require 'rails_helper'

RSpec.describe Api::V1::OrdersController, type: :request do
  describe 'POST /v1/orders' do
    it 'should add a dish to order' do
      dish = FactoryGirl.create(:dish)
      post '/api/v1/orders', params: {
        dish_id: dish.id }
      expect(response_json['message']).to eq "Successfully added Pizza"
      expect(response.status).to eq 200
    end

    it 'should give error if dish_id is invalid' do
      dish = FactoryGirl.create(:dish)
      post '/api/v1/orders', params: {
          dish_id: dish.name }
      expect(response_json['message']).to eq "Something went wrong, you did not add a dish to your order"
      expect(response.status).to eq 422
    end
  end
end
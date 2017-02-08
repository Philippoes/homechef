require 'rails_helper'

RSpec.describe Api::V1::OrdersController, type: :request do
  let(:user) { FactoryGirl.create(:user) }
  let(:credentials) { user.create_new_auth_token }
  let(:headers) { {HTTP_ACCEPT: 'application/json'}.merge!(credentials) }

  describe 'POST /v1/orders' do
    it 'should add a dish to order' do
      dish = FactoryGirl.create(:dish)
      post '/api/v1/orders', params: {
        dish_id: dish.id }, headers: headers
      expect(response_json['message']).to eq "Successfully added Pizza"
      expect(response.status).to eq 200
    end

    it 'should give error if dish is missing or invalid' do
      dish = FactoryGirl.create(:dish)
      post '/api/v1/orders', params: {
          dish_id: dish.name }, headers: headers
      expect(response_json['message']).to eq "Something went wrong, you did not add a dish to your order"
      expect(response.status).to eq 422
    end
  end
end
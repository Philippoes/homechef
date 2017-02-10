require 'rails_helper'

RSpec.describe Api::V1::CheckoutController, type: :request do
    let(:user) { FactoryGirl.create(:user) }
    let (:dish) { FactoryGirl.create(:dish) }
    let (:order) { FactoryGirl.create(:order, user: user) }
    let(:credentials) { user.create_new_auth_token }
    let(:headers) { { HTTP_ACCEPT: 'application/json' }.merge!(credentials) }

    describe 'GET /v1/checkout' do
        it 'should display dishes in order that are not payed' do
            order.add(dish, dish.price)
            get '/api/v1/checkout', headers: headers
            expect(response_json['order_items']).to eq [{ 'name' => 'Pizza', 'price' => 1.0, 'quantity' => 1, 'ready_time' => '10 Jan 16:32' }]
            expect(response.status).to eq 200
        end

        it 'send error message if no dishes exist in order' do
            get '/api/v1/checkout', headers: headers
            expect(response_json['message']).to eq "You have no dishes in your order"
            expect(response.status).to eq 500
        end
    end
end

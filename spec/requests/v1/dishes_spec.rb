require 'rails_helper'

RSpec.describe Api::V1::ProjectApiController, type: :request do
  describe 'GET /v1/dishes' do
    it 'should return all the dishes' do
      get '/api/v1/dishes'

      expect(response.status).to eq 200
      expect(response_json['message']).to eq 'Pong'
    end
  end
end
require 'rails_helper'

RSpec.describe VisitsController do
  describe '#index' do
    it 'does return status 200 OK' do
      get :index

      expect(response).to have_http_status(200)
    end
  end

  describe '#create' do
    let(:valid_payload) {
      {
        guid: SecureRandom.uuid,
        url: 'http://localhost:3000/',
        accessed_at: 1.day.ago.beginning_of_day.to_s
      }
    }

    context 'when the request is valid' do
      it 'does return status 200 OK' do
        allow_any_instance_of(VisitCreateForm).to receive(:save) { true }

        post :create, params: valid_payload

        expect(response).to have_http_status(200)
      end
    end

    context 'when the request is invalid' do
      it 'returns status 422' do
        allow_any_instance_of(VisitCreateForm).to receive(:save) { false }

        post :create, params: valid_payload

        expect(response).to have_http_status(422)
      end
    end
  end
end
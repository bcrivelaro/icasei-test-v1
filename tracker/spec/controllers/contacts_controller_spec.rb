require 'rails_helper'

RSpec.describe ContactsController do
  describe '#create' do
    let(:valid_payload) {
      {
        email: 'email@example.com',
        name: 'John Doe'
      }
    }

    context 'when the request is valid' do
      it 'does return status 200 OK' do
        allow_any_instance_of(ContactCreateForm).to receive(:save) { true }

        post :create, params: valid_payload

        expect(response).to have_http_status(200)
      end
    end

    context 'when the request is invalid' do
      it 'returns status 422' do
        allow_any_instance_of(ContactCreateForm).to receive(:save) { false }

        post :create, params: {}

        expect(response).to have_http_status(422)
      end
    end
  end
end
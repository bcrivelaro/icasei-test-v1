require 'rails_helper'

RSpec.describe VisitCreateForm, type: :model do
  let(:valid_params) {
    {
      guid: SecureRandom.uuid,
      url: 'http://localhost:3000/',
      accessed_at: 1.day.ago.beginning_of_day.to_s
    }
  }

  context 'Validations' do
    subject { VisitCreateForm.new(valid_params) }

    it { should validate_presence_of(:guid) }
    it { should validate_presence_of(:url) }
    it { should validate_presence_of(:accessed_at) }

    it 'should validate that :accessed_at cannot be invalid' do
      form = VisitCreateForm.new accessed_at: 'invalid'
      form.valid?

      expect(form.errors[:accessed_at][0]).to eql('invalid')
    end
  end

  context 'when creating a valid visit' do
    it 'should persist the object in database' do
      form = VisitCreateForm.new(valid_params)

      expect { form.save }.to change { Visit.count }.from(0).to(1)
    end

    it 'should have the correct attributes' do
      form = VisitCreateForm.new(valid_params)

      form.save

      attributes = form.visit.slice(:url, :accessed_at)
      expect(attributes[:url]).to eq('http://localhost:3000/')
      expect(attributes[:accessed_at].to_s.to_datetime).to eq(DateTime.parse(1.day.ago.beginning_of_day.to_s))
    end
  end
end

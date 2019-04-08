require 'rails_helper'

RSpec.describe ContactCreateForm, type: :model do
  let(:valid_params) {
      {
        email: 'email@example.com',
        name: 'John Doe'
      }
    }

  context 'Validations' do
    subject { ContactCreateForm.new(valid_params) }

    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:name) }

    it 'should validate that :email cannot be invalid' do
      form = ContactCreateForm.new email: 'invalid'
      form.valid?

      expect(form.errors[:email][0]).to eql('is invalid')
    end
  end

  context 'when creating a valid contact' do
    it 'should persist the object in database' do
      form = ContactCreateForm.new(valid_params)

      expect { form.save }.to change { Contact.count }.from(0).to(1)
    end

    it 'should have the correct attributes' do
      form = ContactCreateForm.new(valid_params)

      form.save

      attributes = form.contact.slice(:email, :name)

      expect(attributes[:email]).to eq('email@example.com')
      expect(attributes[:name]).to eq('John Doe')
    end
  end

  context 'when contact whith given email is already registered' do
    it 'does return true' do
      contact = create(:contact, email: 'email@example.com')

      form = ContactCreateForm.new(valid_params)

      expect(form.save).to eq(true)
    end
  end
end

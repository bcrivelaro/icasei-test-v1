require 'rails_helper'

RSpec.describe Contact, type: :model do
  context 'Validations' do
    subject { build(:contact, email: 'email@example.com', name: 'John Doe') }

    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:email) }
  end
end

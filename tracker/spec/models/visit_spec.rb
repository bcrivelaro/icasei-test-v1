require 'rails_helper'

RSpec.describe Visit, type: :model do
  context 'Validations' do
    subject { build(:visit, guid: '7e97aa6f-f94e-40ad-ae92-83547e986b40',
                            url: 'http://localhost:3000/',
                            accessed_at: 1.day.ago) }

    it { should validate_presence_of(:guid) }
    it { should validate_presence_of(:url) }
    it { should validate_presence_of(:accessed_at) }
  end
end

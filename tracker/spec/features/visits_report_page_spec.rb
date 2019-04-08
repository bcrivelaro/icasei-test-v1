require 'rails_helper'

RSpec.describe '/visits', type: :feature do
  it 'does display the visits table in correct order' do
    time = 1.hour.ago
    create_list(:visit, 100, guid: '000-000', created_at: time)
    visit_1 = create(:visit, guid: '111-111')

    visit '/'

    expect(page).to have_table 'visits'
    first_tr_text = page.find(:css, 'table > tr', match: :first).text
    expect(first_tr_text).to have_text('111-111')

    visit_2 = create(:visit, guid: '222-222', created_at: 1.day.ago)

    visit '/'

    first_tr_text = page.find(:css, 'table > tr', match: :first).text
    expect(first_tr_text).to have_text('111-111')

    visit_3 = create(:visit, guid: '333-333')

    visit '/'

    first_tr_text = page.find(:css, 'table > tr', match: :first).text
    expect(first_tr_text).to have_text('333-333')
  end
end
require 'rails_helper'

RSpec.describe Visits::IndexPresenter do
  describe '#visits' do
    it 'does load last 50 records ordered by created_at datetime' do
      expect(Visit).to receive_message_chain(:order, :limit).with(created_at: :desc).with(50)
      presenter = Visits::IndexPresenter.new

      presenter.visits
    end
  end

  describe '#page_title' do
    it 'does return the expected page title' do
      presenter = Visits::IndexPresenter.new

      expect(presenter.page_title).to eq('Visits')
    end
  end
end
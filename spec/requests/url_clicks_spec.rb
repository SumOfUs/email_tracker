require 'rails_helper'

describe 'Url clicks' do
  context 'campaign does not exist' do
    before do
      @campaign = Campaign.create(name: 'demo')

      get '/clicks', params: { campaign_id: @campaign.uid, recipient_id: 1, url: 'http://example.com' }
    end

    it 'tracks opens' do
      expect(@campaign.reload.url_clicks.count).to eq(1)
    end

    it 'redirects to passed url' do
      expect(response).to redirect_to('http://example.com')
    end
  end

  context 'campaign does not exist' do
    it 'raises not found' do
      expect{
        get '/track', params: { recipient_id: 1, url: 'http://example.com' }
      }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end

require 'rails_helper'

describe 'Opens tracking' do
  before do
    @campaign = Campaign.create(name: 'demo')
  end

  it 'tracks opens' do
    get '/track', params: { campaign_id: @campaign.uid, recipient_id: 1 }

    expect(@campaign.reload.opens_count).to eq(1)
  end


  context 'campaign does not exist' do
    it 'raises not found' do
      expect{
        get '/track', params: { recipient_id: 1 }
      }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end

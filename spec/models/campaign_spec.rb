require 'rails_helper'

describe Campaign do
  it 'has UID' do
    campaign = Campaign.create(name: 'foo bar')
    expect(campaign.uid).to match(/\s*/)
    expect(campaign.uid.length).to eq(32)
  end

  it 'requires a name' do
    expect{
      Campaign.create!
    }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'counts opens' do
    campaign = Campaign.create(name: 'foo bar')
    [1, 1, 2, 3].each do |id|
      Open.track(campaign, recipient_id: id)
    end

    expect(campaign.reload.opens_count).to eq(3)
  end
end

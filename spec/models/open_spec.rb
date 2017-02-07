require 'rails_helper'

describe Open do
  let(:campaign) { Campaign.create(name: 'example') }
  subject { Open.track(campaign, recipient_id: 'abc') }

  context 'first open' do
    it 'sets dates' do
      Timecop.freeze do
        expect(subject.first_opened_at).to eq(Time.now)
        expect(subject.last_opened_at).to eq(Time.now)
      end
    end

    it 'updates counter' do
      expect(subject.opens_count).to eq(1)
    end
  end

  context 'subsequent opens' do
    before do
      Timecop.travel('2017/01/01') do
        Open.track(campaign, recipient_id: 'abc')
      end
    end

    it 'sets dates' do
      Timecop.travel('2017/02/01') do
        expect(subject.first_opened_at.month).to eq(1)
        expect(subject.last_opened_at.month).to eq(2)
      end
    end

    it 'updates counter' do
      expect(subject.opens_count).to eq(2)
    end
  end

  describe 'validations' do
    describe 'required presence' do
      it 'campaign_id' do
        expect{
          Open.create!(recipient_id: nil, campaign_id: '1')
        }.to raise_error(ActiveRecord::RecordInvalid)
      end

      it 'member_id' do
        expect{
          Open.create!(recipient_id: '1', campaign_id: nil)
        }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end
end

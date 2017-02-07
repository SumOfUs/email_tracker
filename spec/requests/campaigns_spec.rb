require 'rails_helper'

describe 'Campaigns' do
  describe 'creating' do
    context 'valid' do
      it 'tracks opens' do
        post '/campaigns', params: { name: 'Example' }

        expect(response.body).to eq(Campaign.first.to_json)
      end
    end

    context 'invalid' do
      it 'tracks opens' do
        post '/campaigns'

        expect(response.status).to eq(422)
        expect(JSON.parse(response.body)).to include('name' => ["can't be blank"])
      end
    end
  end
end

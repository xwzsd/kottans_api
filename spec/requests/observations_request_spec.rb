require 'rails_helper'

RSpec.describe 'Observations API' do
  let(:user) { FactoryGirl.create(:user) }

  describe 'GET /api/observations' do
    before do
      FactoryGirl.create_list(:observation, 5)
      get_user '/api/observations'
    end

    it 'response all observations' do
      expect(response).to be_redirect
    end

    it 'check observations' do
      expect json = JSON.parse(Observation.all.to_json)
      expect(json.count).to eq(5)
    end
  end
end

require 'rails_helper'

RSpec.describe GetWeatherService, :vcr do
  it 'save data into db' do
    expect { GetWeatherService.() }.to change{ Observation.count }.by(1)
  end
end

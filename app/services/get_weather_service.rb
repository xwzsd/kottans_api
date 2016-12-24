class GetWeatherService < ApplicationService
  require 'oj'

  def executing
    make_request && save_response
  end

  private

  def make_request
    @conn = Faraday.new(url: ENV['HOSTNAME']) do |f|
      f.request :url_encoded
      f.params['appid'] = ENV['API_KEY']
      f.params['q'] = ENV['CITY_NAME']
      f.adapter  Faraday.default_adapter
      f.use Faraday::Response::Logger
    end
  end

  def save_response
    response = @conn.get
    response.body
    json = Oj.load(response.body)
    @observation = Observation.new
    @observation.temp = json['main']['temp'].round - ENV['K_TO_C'].to_i
    @observation.pressure = json['main']['pressure']
    @observation.humidity = json['main']['humidity']
    @observation.save
  end
end

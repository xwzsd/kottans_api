class GetWeatherService < ApplicationService
  require 'oj'
  def initialize(temp:, humidity:, pressure:, params:, conn:, response:)
    @temp = temp
    @humidity = humidity
    @pressure = pressure
    @params = params
    @conn = conn
    @response = response
    super
  end

  def executing
    make_request && save_response
  end

  private

  def make_request
    conn = Faraday.new(url: ENV['HOSTNAME']) do |f|
      f.request :url_encoded
      f.params['appid'] = ENV['API_KEY']
      f.params['q'] = ENV['CITY_NAME']
      f.adapter  Faraday.default_adapter
      f.use Faraday::Response::Logger
    end
      response = conn.get
      response.body
      json = Oj.dump(response.body)
  end

  def save_response

  end

end

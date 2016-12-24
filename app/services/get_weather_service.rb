class GetWeatherService < ApplicationService
  attr_accessor :temp, :pressure, :humidity
  require 'oj'
  def initialize(observations_params)
    @city = observations_params[:city] if observations_params[:city].present?
    @user_id = observations_params[:user_id]
    super
  end

  def executing
    make_request && save_response
  end

  private

  def make_request
    @conn = Faraday.new(url: ENV['HOSTNAME']) do |f|
      f.request :url_encoded
      f.params['appid'] = ENV['API_KEY']
      f.params['q'] = @city
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
    @observation.user_id = @user_id
    @observation.save
  end
end

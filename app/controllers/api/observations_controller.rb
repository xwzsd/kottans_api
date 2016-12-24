class Api::ObservationsController < ApplicationController
attr_accessor :city
before_action :doorkeeper_authorize!
  def index
    @observations = Observation.all
    respond_to do |format|
      format.html
      format.json { render json: @observations }
    end

  def create
    @service = GetWeatherService.(observations_params)
      if @service.errors.empty?
        redirect_to root_path
      else
        render :new
      end
    end
  end

  def destroy
    if @observation = Observation.find(observations_params[:id])
       @observation.destroy
      respond_to do |format|
        format.json { render json: { status: "success" } }
      end
    else
      respond_to do |format|
        format.json { render json: { status: @observation.errors.messages } }
      end
    end
  end

  def observations_params
    params.each do |key,value|
      Rails.logger.warn "Param #{key}: #{value}"
    end
  end
end

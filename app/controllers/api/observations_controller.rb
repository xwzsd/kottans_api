class Api::ObservationsController < ApplicationController
  before_action :doorkeeper_authorize!, if: :api_request?
    def index
      render json: SortService.(observations_params, Observation).result, adapter: :json_api
    end

    def create
      @service = GetWeatherService.(observations_params)
        if @service.errors.empty?
          redirect_to root_path
        else
          render :new
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

    private

    def observations_params
      params.each do |key,value|
        Rails.logger.warn "Param #{key}: #{value}"
      end
    end
end

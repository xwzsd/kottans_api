class ObservationsController < ApplicationController
  def index
    @observstions = Observation.all
    respond_to do |format|
      format.html
      format.json { render json: @observstions }
    end
  end
end

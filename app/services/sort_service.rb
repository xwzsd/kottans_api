class SortService < ApplicationService

  attr_accessor :observation, :result

  def initialize(params, observation)
    @observation = observation
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    super
  end

  def executing
    validate && filtered
  end

  def validate
    return @result = observation.all if observation.count == 0
    @start_date = @start_date ? Time.zone.at(@start_date.to_i) : observation.first.created_at
    @end_date = @end_date ? Time.zone.at(@end_date.to_i) : observation.last.created_at
  end

  def filtered
    @result = observation.where(created_at: @start_date..@end_date)
  end
end

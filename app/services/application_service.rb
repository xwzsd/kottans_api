class ApplicationService
  attr_reader :temp, :humidity, :pressure, :errors

  def self.call(*arguments)
    new(*arguments).tap(&:perform)
  end

  def perform
    ActiveRecord::Base.transaction do
      return true if executing

      errors[:service] << 'unknown error' if errors.empty?
      raise ActiveRecord::Rollback
    end
  end

  def success?
    @errors.empty?
  end

  private

  def initialize(*_arguments)
    @errors = ServiceErrors.new
  end

  def executing
    raise 'not implemented'
  end

  def failure_callback
  end
end

class ApplicationService
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
    @errors = ErrorsService.new
  end

  def executing
    raise 'not implemented'
  end

  def failure_callback
    nil
  end
end

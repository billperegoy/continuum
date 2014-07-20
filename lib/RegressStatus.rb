# This class is a container for holding regression status
# information.
#
class RegressStatus
  attr_reader :state, :start_time, :end_time

  def initialize(regression)
    @regression = regression
    @state = :pending
    @start_time = nil
    @end_time = nil
  end

  def start
    @state = :running
    @start_time = Time.now
  end

  def stop
    if running
      @state = :done
     @end_time = Time.now
    end
  end

  private
  def running
    @state == :running
  end
end

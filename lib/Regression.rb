# The Regression class represents a single regression run.
# (1 Project, 1 Stage, 1 Release)
class Regression
  attr_reader :project, :stage, :status

  def initialize(opts)
    @scheduler = opts[:scheduler]
    @project = opts[:project]
    @release = opts[:release]
    @stage = opts[:stage]
    @status = RegressStatus.new(self)

    @observers = []
  end

  def run
    @status.start
    notify_observers(@status)

    # This should spawn the job and wait for it to return.
    #
    #sleep 60

    # Now we need to run the command and report when we are done.
    #@status.stop
    #notify_observers(@status)
  end

  def running?
    @status.state == :running
  end

  def add_observer(observer)
    @observers << observer
  end

  def notify_observers(status)
    @observers.each do |observer|
      observer.update(status)
    end
  end
end

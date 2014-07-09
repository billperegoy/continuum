# The Regression class represents a single regression run.
# (1 Project, 1 Stage, 1 Release)
class Regression
  def initialize(opts)
    @scheduler = opts[:scheduler]
    @project = opts[:project]
    @release = opts[:release]
    @stage = opts[:stage]
  end

  def run
    puts "[Info] Running regression"
    puts "[Info] CMD: #{@stage.command}"
    # Need to set up an observer on the scheduler
    # so it can send results.
  end
end

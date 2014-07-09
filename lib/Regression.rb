# The Regression class represents a single regression run.
# (1 Project, 1 Stage, 1 Release)
class Regression
  def initialize(opts)
    @project = opts[:project]
    @release = opts[:release]
    @stage = opts[:stage]
  end
end

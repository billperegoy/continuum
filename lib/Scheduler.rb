# The scheduler is the central processor for the entire engine.
# It decides when to launch regression jobs and is informed
# of ther results.
#
class Scheduler
  def initialize
    @regressions = []
  end

  def add_project(project)
  end

  def register_release(release)
    project = release.get_project
    regression = Regression.new(scheduler: self,
                                project: project,
                                stage: project.stages[0],
                                release: release)

    @regressions << regression
    # We need to run the regression and set up an observer to
    # tell us when it is done.
    regression.add_observer(self)
    regression.run
  end

  def update(status)
    puts "[Info] Received update of type: #{status}"
  end

  def active_job_count
    @regressions.length
  end
end

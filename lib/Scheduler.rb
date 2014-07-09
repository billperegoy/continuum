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
    # TODO
    project = release.get_project
    regression = Regression.new(project: project,
                                stage: project.stages[0],
                                release: release)

    @regressions << regression
  end

  def active_job_count
    @regressions.length
  end
end

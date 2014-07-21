# The scheduler is the central processor for the entire engine.
# It decides when to launch regression jobs and is informed
# of ther results.
#
class Scheduler
  def initialize
    @regressions = []
    @current_regression = 0
    @procs = []
  end

  def register_release(release)
    project = release.get_project
    regression = Regression.new(id: @current_regression,
                                scheduler: self,
                                project: project,
                                stage: project.stages[0],
                                release: release)
    @current_regression += 1

    @regressions << regression
    regression.add_observer(self)

    if active_regressions(project, 0) == 0
      proc = Thread.new { regression.run }
      @procs << proc

      # FIXME - This is blocking. Need better threading mechanism.
      wait_for_all_done
    end
  end

  def update(status)
    puts "[Info] Received update of type: #{status.state}"
    # Need to remove regressions from the list when they are done.
    # How do I identify it?
    # Should I switch this to rails and use the db id?
  end

  def active_job_count
    @regressions.length
  end

  def active_regressions(project, level)
    active_regressions = @regressions.select do |regr|
      regr.project.name == project.name &&
      regr.stage.level == level &&
      regr.running?
    end
    active_regressions.count
  end

  def wait_for_all_done
    @procs.each do |t|
      t.join
    end
  end
end

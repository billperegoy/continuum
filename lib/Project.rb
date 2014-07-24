# A Project is a sinhle prepresenttaion of a project being
# tested with continuum.
#
class Project
  attr_reader :name, :stages   

  def initialize(opts)
    @name = opts[:name]
    @scheduler = opts[:scheduler]
    @stages = []
    @releases = []
  end

  def add_stage(stage)
    @stages << stage
  end

  def add_release(release)
    @releases << release
    # Tell the scheduler about this new release
    @scheduler.register_release(release)
  end

  def stage_count
    @stages.length
  end

  def release_count
    @releases.length
  end
end

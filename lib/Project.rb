# A Project is a sinhle prepresenttaion of a project being
# tested with continuum.
#
class Project
  attr_reader :name

  def initialize(opts)
    @name = opts[:name]
    @stages = []
    @releases = []
  end

  def add_stage(stage)
    @stages << stage
  end

  def add_release(release)
    @releases << release
  end

  def stage_count
    @stages.length
  end

  def release_count
    @releases.length
  end
end

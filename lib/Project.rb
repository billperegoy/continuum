# A Project is a sinhle prepresenttaion of a project being
# tested with continuum.
#
class Project
  attr_reader :name

  def initialize(opts)
    @name = opts[:name]
  end
end

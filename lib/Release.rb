# The Release class represents a particular release label
# for a project. The id field is the git hash ID.
#
class Release
  def initialize(opts)
    @project = opts[:project]
    @id = opts[:id]
  end
end

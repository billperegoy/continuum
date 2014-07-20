# A stage represnts te steps required to run a specific
# regression for a project. There will be a number of stages
# describing differengt lavels of test.
#
class Stage
  attr_reader :command, :level

  def initialize(opts)
    @level = opts[:level]
    @command = opts[:command]
  end
end

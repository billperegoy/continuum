require_relative 'spec_helper'

describe Scheduler do
  it "starts a level 0 regression as soon as it's informed of a new release" do
    scheduler = Scheduler.new
    project = Project.new(name: 'my_proj')
    scheduler.add_project(project)
    stage_0 = Stage.new
    project.add_stage(stage_0)
    expect(scheduler.active_job_count).to eq(0)

    release = Release.new(project: project, id: 'release_id')
    project.add_release(release)

    # TODO - Add logic to make this pass
    # expect(scheduler.active_job_count).to eq(1)
  end
end

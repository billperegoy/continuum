require_relative 'spec_helper'

describe Scheduler do
  it "starts a level 0 regression as soon as it's informed of a new release" do
    scheduler = Scheduler.new
    project = Project.new(name: 'my_proj', scheduler: scheduler)
    scheduler.add_project(project)
    stage_0 = Stage.new(level: 0, command: 'sleep 60')
    project.add_stage(stage_0)
    expect(scheduler.active_job_count).to eq(0)

    release = Release.new(project: project, id: 'release_id')
    project.add_release(release)

    active_regressions = scheduler.active_regressions(project, 0)
    expect(active_regressions).to eq(1)
  end

  it "should not start a level 0 regression if one is already running" do
    scheduler = Scheduler.new
    project = Project.new(name: 'my_proj', scheduler: scheduler)
    scheduler.add_project(project)
    stage_0 = Stage.new(level: 0, command: 'sleep 60')
    project.add_stage(stage_0)
    expect(scheduler.active_job_count).to eq(0)

    release1 = Release.new(project: project, id: 'release_id1')
    project.add_release(release1)

    release2 = Release.new(project: project, id: 'release_id1')
    project.add_release(release2)

    active_regressions = scheduler.active_regressions(project, 0)
    expect(active_regressions).to eq(1)
  end


  it "starts a level 1 regression when a level 0 regresion is done " +
     "and nothing else is running" do
    pending
    expect(true).to eq(false)
  end
end

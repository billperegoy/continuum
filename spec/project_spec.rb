require_relative 'spec_helper'

describe Project do
  it "should have a name" do
    proj = Project.new(name: 'my_proj')
    expect(proj.name).to eq('my_proj')
  end

  it "initializes with empty stage list" do
    proj = Project.new(name: 'my_proj')
    expect(proj.stage_count).to eq(0)
  end

  it "initializes with empty release list" do
    proj = Project.new(name: 'my_proj')
    expect(proj.release_count).to eq(0)
  end
end

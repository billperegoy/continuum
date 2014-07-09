require_relative 'spec_helper'

describe Project do
  it "should have a name" do
    proj = Project.new(name: 'my_proj')
    expect(proj.name).to eq('my_proj')
  end
end

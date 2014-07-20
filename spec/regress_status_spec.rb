describe RegressStatus do

  it "should initailze properly" do
    status = RegressStatus.new(nil)
    expect(status.state).to eq(:pending)
    expect(status.start_time).to eq(nil)
    expect(status.end_time).to eq(nil)
  end

  it "should accept a start command" do
    status = RegressStatus.new(nil)
    status.start
    expect(status.start_time).to_not eq(nil)
    expect(status.end_time).to eq(nil)
    expect(status.state).to eq(:running)
  end

  it "should accept a stop command" do
    status = RegressStatus.new(nil)
    status.start
    status.stop
    expect(status.start_time).to_not eq(nil)
    expect(status.end_time).to_not eq(nil)
    expect(status.state).to eq(:done)
  end

  it "ahould do nothing if stop command is sent before start" do
    status = RegressStatus.new(nil)
    status.stop
    expect(status.start_time).to eq(nil)
    expect(status.end_time).to eq(nil)
    expect(status.state).to eq(:pending)
  end
end

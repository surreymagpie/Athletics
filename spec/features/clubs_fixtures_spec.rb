require "rails_helper"

describe "A Fixture" do
  let(:fixture) { create :fixture }
  let(:ran) { create(:club) }
  let(:kp) { create(:club, name: "Kingston", abbr: "KP") }

  it "can exist with no hosts" do
    expect(fixture.clubs.size).to eq(0)
  end

  it "accept a club as its host" do
    fixture.clubs << ran
    expect(fixture.clubs.size).to eq(1)
  end

  it "can have multiple hosts" do
    fixture.clubs << ran
    fixture.clubs << kp
    expect(fixture.clubs.size).to eq(2)
  end
end


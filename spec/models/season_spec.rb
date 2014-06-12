require 'rails_helper'

describe "A Season" do
  subject(:season) { Season.new(name: name) }
  let(:name) { "2013/4 Season" }

  
  it { expect(subject).to respond_to(:name) }

  context "without a name" do
    let(:name) { "" }
    it { expect(subject).to be_invalid }
  end
end

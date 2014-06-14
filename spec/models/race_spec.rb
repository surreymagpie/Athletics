require 'rails_helper'

describe Race do
  subject(:race) { Race.new(classification: classification, fixture_id: fixture_id) }
  let(:classification) { "Seniors" }
  let(:fixture_id) { 1 }

  it { expect(subject).to respond_to(:classification)}
  it { expect(subject).to respond_to(:fixture) }
  it { expect(subject).to respond_to(:season) }

  describe "validations" do
    context 'when no fixture_id' do
      let(:fixture_id) { nil }
      it { expect(race).to be_invalid }
    end
    context 'when no classification' do
      let(:classification) { "" }
      it { expect(race).to be_invalid }
    end
  end
end
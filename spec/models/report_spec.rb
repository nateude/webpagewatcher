require 'rails_helper'

describe Report do
  let(:report_params) { FactoryBot.attributes_for(:report) }

  it 'is valid with website_id, profile_id, wpt_id, status, data, status_code' do
    report = described_class.new(report_params)
    expect(report).to be_valid
  end

  it 'is invalid without profile' do
    report_params[:profile] = nil
    report = described_class.new(report_params)
    report.valid?
    expect(report.errors[:profile_id]).to include("can't be blank")
  end
end

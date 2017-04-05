require 'rails_helper'

describe Report do

  it "is valid with website_id, profile_id, wpt_id, status, data, status_code" do
    Website.create(name: 'sample', url: 'http://www.sample.com/')
    Profile.create( name: 'sample', website_id: '1', wpt_settings: 'empty', wpt_code: 'empty', interval: '100', url: 'http://www.sample.com')
    report = Report.new(website_id:'1', profile_id: '1', wpt_id: '1', status: '100', data: 'null', status_code: '1')
    expect(report).to be_valid
  end
  it "is invalid without website_id" do
    report = Report.new(website_id:nil)
    report.valid?
    expect(report.errors[:website_id]).to include("can't be blank")
  end
  it "is invalid without a valid website" do
    report = Report.new(website_id:'1')
    report.valid?
    expect(report.errors[:website]).to include("must exist")
  end
  it "is invalid without profile_id" do
    report = Report.new(profile_id: nil)
    report.valid?
    expect(report.errors[:profile_id]).to include("can't be blank")
  end
  it "is invalid without a valid profile" do
    report = Report.new(profile_id: '1')
    report.valid?
    expect(report.errors[:website]).to include("must exist")
  end
  it "is invalid without wpt_id" do
    report = Report.new(wpt_id: nil)
    report.valid?
    expect(report.errors[:wpt_id]).to include("can't be blank")
  end
  it "is invalid without status_code" do
    report = Report.new(status_code: nil)
    report.valid?
    expect(report.errors[:status_code]).to include("can't be blank")
  end

end

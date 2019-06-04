require 'rails_helper'

describe Profile do
  it 'is valid with name, website id, settings, code, interval and url' do
    Website.create(name: 'sample', url: 'http://www.sample.com/')
    profile = described_class.new(name: 'sample', website_id: '1', wpt_settings: 'empty', wpt_code: 'empty', interval: '100', url: 'http://www.sample.com')
    expect(profile).to be_valid
  end

  it 'is invalid without a name' do
    profile = described_class.new(name: nil)
    profile.valid?
    expect(profile.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without a website id' do
    profile = described_class.new(website_id: nil)
    profile.valid?
    expect(profile.errors[:website_id]).to include("can't be blank")
  end

  it 'is invalid with a non existant website id' do
    profile = described_class.new(website_id: '1')
    profile.valid?
    expect(profile.errors[:website]).to include('must exist')
  end

  it 'is invalid without a url' do
    profile = described_class.new(url: nil)
    profile.valid?
    expect(profile.errors[:url]).to include("can't be blank")
  end

  it 'is invalid with a duplicate name' do
    Website.create(name: 'sample', url: 'http://www.sample.com/')
    described_class.create(name: 'sample', website_id: '1', wpt_settings: 'empty', wpt_code: 'empty', interval: '100', url: 'http://www.sample.com')
    profile = described_class.new(name: 'sample', website_id: '1', wpt_settings: 'empty', wpt_code: 'empty', interval: '100', url: 'http://www.sample.com')
    profile.valid?
    expect(profile.errors[:name]).to include('has already been taken')
  end
end

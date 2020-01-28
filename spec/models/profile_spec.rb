require 'rails_helper'

describe Profile do
  let(:website_attrs) { { name: 'sample', url: 'http://www.sample.com/' } }
  let(:website) { Website.create(website_attrs) }
  let(:profile_attrs) { { name: 'sample', website_id: website.id, wpt_settings: 'empty', wpt_code: 'empty', interval: '100', url: 'http://www.sample.com' } }

  it 'is valid with name, website id, settings, code, interval and url' do
    profile = described_class.new(profile_attrs)
    binding.pry
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

  # it 'is invalid with a duplicate name' do
  #   profile = described_class.new(profile_attrs)
  #   profile.valid?
  #   expect(profile.errors[:name]).to include('has already been taken')
  # end
end

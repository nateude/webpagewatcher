require 'rails_helper'

describe Website do
  it 'is valid with name and url' do
    website = described_class.new(name: 'sample', url: 'http:://www.sample.com')
    expect(website).to be_valid
  end

  it 'is invalid without a name' do
    website = described_class.new(name: nil)
    website.valid?
    expect(website.errors[:name]).to include("can't be blank")
  end
  it 'is invalid without a url' do
    website = described_class.new(url: nil)
    website.valid?
    expect(website.errors[:url]).to include("can't be blank")
  end
  it 'is invalid with a duplicate name' do
    described_class.create(name: 'sample', url: 'http:://www.sample.com')
    website = described_class.new(name: 'sample', url: 'http:://www.sample_new.com')
    website.valid?
    expect(website.errors[:name]).to include('has already been taken')
  end
  it 'is invalid with a duplicate url' do
    described_class.create(name: 'sample', url: 'http:://www.sample.com')
    website = described_class.new(name: 'sample_new', url: 'http:://www.sample.com')
    website.valid?
    expect(website.errors[:url]).to include('has already been taken')
  end
end

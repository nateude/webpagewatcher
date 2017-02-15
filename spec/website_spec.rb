require 'rails_helper'

describe Website do

  it "is valid with name and url" do
    website = Website.new(name: 'sample', url: 'http://www.sample.com')
    expect(website).to be_valid
  end

  it "is invalid without a name" do
    website = Website.new(name: nil)
    website.valid?
    expect(website.errors[:name]).to include("cant't be blank")
  end
  it "is invalid without a url" do
    website = Website.new(url: nil)
    website.valid?
    expect(website.errors[:url]).to include("cant't be blank")
  end
  it "is invalid with a duplicate name" do
    Website.new(name: 'sample', url: 'http:://www.sample.com')
    website = Website.new(name: 'sample', url: 'http:://www.sample_new.com')
    website.valid?
    expect(website.errors[:name]).to include("has already been taken")
  end
  it "is invalid with a duplicate url" do
    Website.new(name: 'sample', url: 'http:://www.sample.com')
    website = Website.new(name: 'sample_new', url: 'http:://www.sample.com')
    website.valid?
    expect(website.errors[:url]).to include("has already been taken")
  end
end

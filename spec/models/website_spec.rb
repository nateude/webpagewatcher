require 'rails_helper'

describe Website do
  let(:website_params) { FactoryBot.attributes_for(:website) }

  it 'is valid with params' do
    website = described_class.new(website_params)
    expect(website).to be_valid
  end

  it 'is invalid without a name' do
    website_params[:name] = nil
    website = described_class.new(website_params)
    website.valid?
    expect(website.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without a url' do
    website_params[:url] = nil
    website = described_class.new(website_params)
    website.valid?
    expect(website.errors[:url]).to include("can't be blank")
  end

  it 'is invalid without a user' do
    website_params[:user] = nil
    website = described_class.new(website_params)
    website.valid?
    expect(website.errors[:user]).to include("can't be blank")
  end
end

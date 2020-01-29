require 'rails_helper'

describe Profile do
  let(:profile_params) { FactoryBot.attributes_for(:profile) }

  it 'is valid with params' do
    profile = described_class.new(profile_params)
    expect(profile).to be_valid
  end

  it 'is invalid without a name' do
    profile_params[:name] = nil
    profile = described_class.new(profile_params)
    profile.valid?
    expect(profile.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without a website id' do
    profile_params[:website] = nil
    profile = described_class.new(profile_params)
    profile.valid?
    expect(profile.errors[:website_id]).to include("can't be blank")
  end

  it 'is invalid without a url' do
    profile_params[:url] = nil
    profile = described_class.new(profile_params)
    profile.valid?
    expect(profile.errors[:url]).to include("can't be blank")
  end

  # it 'is invalid with a duplicate name' do
  #   profile = described_class.new(profile_attrs)
  #   profile.valid?
  #   expect(profile.errors[:name]).to include('has already been taken')
  # end
end

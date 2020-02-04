require 'rails_helper'

describe ReportsController, :controller do
  include AuthHelper

  before do
    login_user
  end

  describe '#run_all' do
    let(:profiles) { FactoryBot.create_list(:profile, 5) }

    it 'init a test for each profile' do
      binding.pry
      expect(Report.all.count).to equal 0

      get :run_all

      expect(Profile.all.sample.report.count).to equal 1
    end

    # it 'redirect to reports index' do
    #   expect(profiles.sample.report.count).to equal 0
    #
    #   get :run_all
    #
    #   expect(profiles.sample.report.count).to equal 1
    # end

  end
end

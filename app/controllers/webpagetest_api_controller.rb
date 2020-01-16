class WebpagetestApiController < AuthenticatedController
  def init
    @test = InitTest.new(url: report.profile.url, wpt_key: current_user.wpt_key).run
  end
end

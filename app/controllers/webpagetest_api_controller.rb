class WebpagetestApiController < AuthenticatedController
  def init
    @test = InitTest.new(url: report.profile.url, current_user.wpt_key).run
  end
end

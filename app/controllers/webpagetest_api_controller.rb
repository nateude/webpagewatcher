class WebpagetestApiController < AuthenticatedController
  def init
    @test = InitTest.new(profile: Profile.find(params[:id])).run
  end
end

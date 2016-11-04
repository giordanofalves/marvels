require "rails_helper"

RSpec.describe Marvel::Service::Comic do
  before do
    @comics_service = Marvel::Service::Comic.new
    Timecop.freeze "2016-01-01T00:00:24+00:00"
  end

  after do
    Timecop.return
  end

  describe "#service" do
    it "return response hash", :vcr do
      VCR.use_cassette("comics_controller/comic") do
        response  = @comics_service.comics

        expect(response["code"]).to eq(200)
        expect(response).to         be_a(Hash)
        expect(response.keys).to    contain_exactly("code", "status",
                                      "copyright", "attributionText",
                                      "attributionHTML", "etag", "data")
      end
    end
  end
end

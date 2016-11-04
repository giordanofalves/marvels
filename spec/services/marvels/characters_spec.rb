require "rails_helper"

RSpec.describe Marvel::Service::Character do
  before do
    @characters_service = Marvel::Service::Character.new
    Timecop.freeze "2016-01-01T00:00:24+00:00"
  end

  after do
    Timecop.return
  end

  describe "#service" do
    it "return response hash", :vcr do
      VCR.use_cassette("characters_controller/characters") do
        response  = @characters_service.characters

        expect(response["code"]).to eq(200)
        expect(response).to         be_a(Hash)
        expect(response.keys).to    contain_exactly("code", "status",
                                      "copyright", "attributionText",
                                      "attributionHTML", "etag", "data")
      end
    end
  end
end

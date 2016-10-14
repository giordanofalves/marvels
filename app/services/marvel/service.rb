module Marvel
  class Service
    require "open-uri"

    def response(params)
      JSON.load(open(hash_url(params)))
    end

    private

    def hash_url(params)
      base_url    = Rails.application.secrets.marvel_api["address"]
      public_key  = Rails.application.secrets.marvel_api["public_key"]
      private_key = Rails.application.secrets.marvel_api["private_key"]
      timestamp   = Time.now.to_i.to_s
      digest      = Digest::MD5.hexdigest(timestamp + private_key + public_key)
      letter      = params[:letter]

      base_url + "#{params[:service]}?ts=#{timestamp}&apikey=#{public_key}&hash=#{digest}&nameStartsWith=#{letter}&limit=100"
    end
  end
end

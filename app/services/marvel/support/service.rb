module Marvel
  module Support
    class Service
      require "open-uri"

      def response(params)
        JSON.load(open(hash_url(params)))
      end

      private

      def service
        Marvel::Support::Service.new
      end

      def hash_url(params)
        base_url    = "http://gateway.marvel.com/v1/public/"
        public_key  = ENV["MARVEL_API_PUBLIC"]
        private_key = ENV["MARVEL_API_PRIVATE"]
        timestamp   = Time.now.to_i.to_s
        digest      = Digest::MD5.hexdigest(timestamp + private_key + public_key)
        offset      = params[:offset]
        starts_with = "&nameStartsWith=#{params[:letter]}" if params[:letter]

        base_url + "#{params[:service]}?ts=#{timestamp}&apikey=#{public_key}&hash=#{digest}&limit=100&offset=#{offset}#{starts_with}"
      end
    end
  end
end

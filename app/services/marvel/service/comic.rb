module Marvel
  module Service
    class Comic < Marvel::Support::Service
      def comics
        service.response(service: "comics")
      end
    end
  end
end

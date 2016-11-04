module Marvel
  module Service
    class Comic < Marvel::Support::Service
      def comics(offset=nil)
        service.response(service: "comics", offset: offset)
      end
    end
  end
end

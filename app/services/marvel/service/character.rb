module Marvel
  module Service
    class Character
      def characters(letter="A", offset=0)
        service.response(service: "characters", letter: letter, offset: offset)
      end

      private

      def service
        Marvel::Support::Service.new
      end
    end
  end
end

module Marvel
  module Service
    class Character < Marvel::Support::Service
      def characters(letter="A", offset=0)
        service.response(service: "characters", letter: letter, offset: offset)
      end

      def character(id)
        service.response(service: "characters/#{id}")
      end
    end
  end
end

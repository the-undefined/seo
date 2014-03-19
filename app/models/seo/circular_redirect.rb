module Seo
  module CircularRedirect
    def valid_redirect?(origin, destination, record_klass)
      return false if record_klass.exists?(origin_id: destination, destination_id: origin)
      return false if chain_has_no_end?(origin, destination, record_klass)
      return true
    end

    private

    def chain_has_no_end?(origin, destination, record_klass)
      @destination_id = destination.to_i

      circular = loop do
        chain_link = record_klass.where(origin_id: @destination_id)
        break false if chain_link.empty?

        @destination_id = chain_link[0].destination_id.to_i
        break true if origin.to_i == @destination_id
      end

      !!circular
    end
  end
end

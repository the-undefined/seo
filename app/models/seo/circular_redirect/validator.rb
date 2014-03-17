module Seo
  module CircularRedirect
    class Validator < ActiveModel::Validator
      include CircularRedirect

      def validate(record)
        unless valid_redirect?(record.origin_id, record.destination_id, PermanentRedirect)
          record.errors.add(:base, "This redirect is circular, it links to another redirect, creating an infinite redirection, please address.")
        end
      end
    end
  end
end

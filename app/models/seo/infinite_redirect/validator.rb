module Seo
  module InfiniteRedirect
    class Validator < ActiveModel::Validator
      include InfiniteRedirect

      def validate(record)
        unless valid_redirect?(record.origin_id, record.destination_id)
          record.errors.add(:destination_id, "must be different from the origin")
        end
      end
    end
  end
end

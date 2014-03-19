module Seo
  class PermanentRedirect < ActiveRecord::Base
    include ActiveModel::Validations

    attr_accessible :destination_id, :origin_id

    validates :origin_id, uniqueness: true, presence: true
    validates :destination_id, uniqueness: true, presence: true
    validates_with InfiniteRedirect::Validator
    validates_with CircularRedirect::Validator
  end
end

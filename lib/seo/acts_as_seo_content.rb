module Seo
  module ActsAsSeoContent
    extend ActiveSupport::Concern

    mattr_accessor :registered_models

    def self.registered_models
      @@registered_models ||= []
    end

    included do
      after_destroy -> do
        MetaContent.where(resource_type: self.class.to_s, resource_id: self.id).
          delete_all
      end
    end

    module ClassMethods
      def acts_as_seo_content
        unless Seo::ActsAsSeoContent.registered_models.include?(self.to_s)
          Seo::ActsAsSeoContent.registered_models << self.to_s
        end
      end
    end
  end
end

ActiveRecord::Base.send :include, Seo::ActsAsSeoContent

module Seo
  module ActsAsSeoContent
    extend ActiveSupport::Concern

    mattr_accessor :registered_models

    def self.registered_models
      @@registered_models ||= []
    end

    included do
      after_destroy -> do
        return unless Seo::ActsAsSeoContent.registered_models.include?(self.class.to_s)
        MetaContent.where(resource_type: self.class.to_s, resource_id: self.id).
          delete_all
      end
    end

    module ClassMethods
      def acts_as_seo_content(options={})
        unless Seo::ActsAsSeoContent.registered_models.include?(self.to_s)
          Seo::ActsAsSeoContent.registered_models << self.to_s
        end

        cattr_accessor :seo_resource_title
        self.seo_resource_title = (options[:seo_resource_title] || :title)
      end
    end
  end
end

ActiveRecord::Base.send :include, Seo::ActsAsSeoContent

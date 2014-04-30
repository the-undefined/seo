module Seo
  class MetaContent < ActiveRecord::Base
    attr_accessible :meta_description, :meta_keywords, :meta_title, :resource_id, :resource_type

    validates_presence_of :resource_id, :resource_type
    validates_uniqueness_of :resource_id, scope: :resource_type, message: "has already been used"

    def resource_title
      resource = resource_type.constantize.find(resource_id)
      resource.send(resource.seo_resource_title)
    end
  end
end

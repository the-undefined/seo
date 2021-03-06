module Seo
  module MetaContentsHelper
    def resource_type_select_options
      registered_models
    end

    def resource_select_options_by_type
      collections = {}
      registered_models.each do |model_klass|
        collections[model_klass.to_sym] = model_records(model_klass)
      end
      collections
    end

    private

    def registered_models
      ::Seo::ActsAsSeoContent.registered_models
    end

    def model_records(model_klass)
      model_klass.constantize.all.map do |instance|
        title_attr = instance.seo_resource_title
        [instance.send(title_attr), instance.id]
      end
    end
  end
end

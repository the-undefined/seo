module Seo
  module MetaTags
    mattr_accessor :default_title
    extend ActiveSupport::Concern

    included do
      before_filter :set_seo_tags

      protected

      def set_seo_tags
        _set_title_tag
        _set_meta_description_tag
        _set_meta_keywords_tag
      end

      def meta_content
        @meta_content ||=
          MetaContent.where(resource_type: _resource_model_for_meta_tags,
                            resource_id: _resource_id_for_meta_tags).first
      end


      def meta_tags_error_policy(e)
        # NOOP
        nil
      end

      private

      def _set_title_tag
        @title = _resource_meta_title || Seo::MetaTags.default_title
      end

      def _set_meta_description_tag
        @meta_description = meta_content.meta_description
      rescue Exception => e
        meta_tags_error_policy(e)
      end

      def _set_meta_keywords_tag
        @meta_keywords = meta_content.meta_keywords
      rescue Exception => e
        meta_tags_error_policy(e)
      end

      def _resource_meta_title
        raise if meta_content.meta_title.strip.blank?
        meta_content.meta_title
      rescue Exception => e
        meta_tags_error_policy(e)
      end

      def _resource_model_for_meta_tags
        # i.e. 'press_releases' becomes 'PressRelease'
        controller_name.singularize.split('_').map(&:capitalize).join
      end

      def _resource_id_for_meta_tags
        params[:id]
      end
    end
  end
end

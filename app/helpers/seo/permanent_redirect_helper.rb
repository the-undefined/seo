module Seo
  module PermanentRedirectHelper
    def page_select_options
      ::Seo.page_class.order(:title).all.map {|p| [p.title, p.id] }
    end

    def page_title(id)
      ::Seo.page_class.find(id).title
    end
  end
end

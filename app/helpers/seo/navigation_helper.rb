module Seo
  module NavigationHelper
    # Usage:
    #
    # nav_item(:resource_path)
    # nav_item(:resource_path, "Custom Title")
    #
    def nav_item(path, title=false)
      path_name = path.to_s.gsub('_path', '')

      content_tag :li, class: nav_css_class(path_name) do
        content_tag :a, href: public_send(path) do
          title || path_name.titleize
        end
      end
    end

    private

    def nav_css_class(path)
      'active' if resolves_to_current_controller?(path)
    end

    def resolves_to_current_controller?(path)
      controller.url_options[:_path_segments][:controller] == named_route_controller(path.to_s.gsub('_path', ''))
    end

    def named_route_controller(named_route)
      ::Seo::Engine.routes.named_routes.routes[named_route.to_sym].defaults[:controller]
    end
  end
end

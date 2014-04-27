module Seo
  module Redirects
    extend ActiveSupport::Concern 

    included do
      before_filter :handle_301_redirects, only: :show

      def handle_301_redirects
        page_id = fetch_page_id(params)
        three_oh_one = permanent_redirect(page_id)

        if three_oh_one
          url = url_for_destination(redirect_destination(three_oh_one))
          redirect_to(url, status: 301) and return
        end
      rescue
        # NOOP - leave to main app to handle gracefully
      end

      private

      def fetch_page_id(params)
        params.fetch(:id).to_i
      end

      def permanent_redirect(origin)
        ::Seo::PermanentRedirect.where(origin_id: origin)[0]
      end

      def url_for_destination(page)
        main_app.url_for(page)
      end

      def redirect_destination(redirect)
        ::Seo.page_class.find(redirect.destination_id)
      end
    end
  end
end

require "spec_helper"

module Seo
  describe PermanentRedirectsController do
    routes { ::Seo::Engine.routes }
    describe "routing" do
  
      it "routes to #index" do
        expect(get: "permanent_redirects", use_route: :seo).to route_to("seo/permanent_redirects#index")
      end
  
      it "routes to #new" do
        expect(get: "permanent_redirects/new", use_route: :seo).to route_to("seo/permanent_redirects#new")
      end
  
      it "routes to #show" do
        expect(get: "permanent_redirects/1", use_route: :seo).to route_to("seo/permanent_redirects#show", id: "1")
      end
  
      it "routes to #edit" do
        expect(get: "permanent_redirects/1/edit", use_route: :seo).to route_to("seo/permanent_redirects#edit", id: "1")
      end
  
      it "routes to #create" do
        expect(post: "permanent_redirects", use_route: :seo).to route_to("seo/permanent_redirects#create")
      end
  
      it "routes to #update" do
        expect(put: "permanent_redirects/1", use_route: :seo).to route_to("seo/permanent_redirects#update", id: "1")
      end
  
      it "routes to #destroy" do
        expect(delete: "permanent_redirects/1", use_route: :seo).to route_to("seo/permanent_redirects#destroy", id: "1")
      end
    end
  end
end

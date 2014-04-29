require "spec_helper"

module Seo
  describe MetaContentsController do
    routes { Engine.routes }

    describe "routing" do
  
      it "routes to #index" do
        get("/meta_contents").should route_to("seo/meta_contents#index")
      end
  
      it "routes to #new" do
        get("/meta_contents/new").should route_to("seo/meta_contents#new")
      end
  
      it "routes to #show" do
        get("/meta_contents/1").should route_to("seo/meta_contents#show", :id => "1")
      end
  
      it "routes to #edit" do
        get("/meta_contents/1/edit").should route_to("seo/meta_contents#edit", :id => "1")
      end
  
      it "routes to #create" do
        post("/meta_contents").should route_to("seo/meta_contents#create")
      end
  
      it "routes to #update" do
        put("/meta_contents/1").should route_to("seo/meta_contents#update", :id => "1")
      end
  
      it "routes to #destroy" do
        delete("/meta_contents/1").should route_to("seo/meta_contents#destroy", :id => "1")
      end
  
    end
  end
end

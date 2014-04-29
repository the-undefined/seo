require 'spec_helper'

module Seo
  describe ActsAsSeoContent do
    let(:page_klass) { Seo.page_class }
    before do
      page_klass.class_eval { acts_as_seo_content }
    end

    describe "allowing models to register themselves" do
      it "stores a list of model names" do
        ::Seo::ActsAsSeoContent.registered_models.should include 'Page'
      end
    end

    describe "destroying a resource that acts_as_seo_content" do
      let(:page_one) { page_klass.create!(title: "Page One") }
      let(:meta_content) { MetaContent.create(resource_type: page_klass.to_s, resource_id: page_one.id) }
      before { meta_content }
      it "also removes the associated seo content" do
        expect{ page_one.destroy }.to change{ MetaContent.count }.by(-1)
      end
    end
  end
end

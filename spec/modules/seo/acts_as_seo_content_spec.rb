require 'spec_helper'

module Seo
  describe ActsAsSeoContent do
    let(:page_klass) { Seo.page_class }
    let(:page_one) { page_klass.create!(title: "Page One") }

    context "with default options" do
      before do
        page_klass.class_eval { acts_as_seo_content }
      end

      describe "allowing models to register themselves" do
        it "stores a list of model names" do
          ::Seo::ActsAsSeoContent.registered_models.should include 'Page'
        end
      end

      describe "destroying a resource that acts_as_seo_content" do
        let(:meta_content) { MetaContent.create(resource_type: page_klass.to_s, resource_id: page_one.id) }
        before { meta_content }
        it "also removes the associated seo content" do
          expect{ page_one.destroy }.to change{ MetaContent.count }.by(-1)
        end
      end

      it "uses the default title field" do
        expect(page_one.seo_resource_title).to eq(:title)
      end
    end

    describe "setting a custom title field" do
      let(:article) { Article.create }
      before do
        Article.class_eval do
          attr_reader :author
          acts_as_seo_content seo_resource_title: :author
        end
      end

      it "overrides the default" do
        expect(article.seo_resource_title).to eq(:author)
      end
    end
  end
end

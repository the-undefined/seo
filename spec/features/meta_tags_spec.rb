require 'spec_helper'

feature %[
  As a SEO Administrator
  I want to be able to manage all the meta tags in one place
  So that I can make updates from my SEO audit without hunting down the right place in a disparate admin CMS
], js: true do

  let(:page_one) { Page.create(title: "Page One") }
  let(:meta_title) { "Crawling space for bots" }
  let(:meta_description) { "Seo blurb to the rescue!"}
  let(:meta_keywords) { "snail, pompous, catridge" }

  background do
    page_one # eager load to populate the database

    visit '/seo/meta_contents'

    click_link "New"

    select "Page", from: "Resource type"
    select page_one.title, from: "page_resource_resource_ids"

    fill_in "meta_content_meta_title", with: meta_title
    fill_in "meta_content_meta_description", with: meta_description
    fill_in "meta_content_meta_keywords", with: meta_keywords

    click_on "Create Meta content"
  end

  scenario "addind a meta title, description and keywords" do
    visit page_path(page_one)
    expect(html).to include(meta_title)
    expect(html).to include(meta_description)
    expect(html).to include(meta_keywords)
  end
end

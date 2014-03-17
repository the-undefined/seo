require 'spec_helper'

feature %{
  As a SEO administrator
  I want to be able to utilize 301 redirects
  So that I can prevent loosing google rankings from expiring pages
} do

  let(:page_one) { Seo.page_class.create(title: "Page One") }
  let(:page_two) { Seo.page_class.create(title: "Page Two") }

  background do
    # touch to persist
    page_one; page_two;

    visit '/seo/permanent_redirects'

    click_link "New"

    select     page_one.title, from: "Origin"
    select     page_two.title, from: "Destination"
    click_on   "Create Permanent redirect"
  end

  scenario "following a custom redirect" do
    visit page_path(page_one)
    expect(current_path).to eq(page_path(page_two))
  end
end

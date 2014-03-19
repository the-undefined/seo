require 'spec_helper'

describe PagesController do
  let(:page_one) { Page.create! }
  let(:page_two) { Page.create! }

  before do
    # touch let to persist
    page_one
  end

  it "should check for 301 redirects" do
    controller.stub(:handle_301_redirects)
    get :show, { id: page_one.id }, {}
    expect(controller).to have_received(:handle_301_redirects)
  end

  it "should render the main apps page" do
    get :show, { id: page_one.id }, {}
    expect(response).to be_success
  end

  context "permanent redirect in place" do
    before do
      # touch to persist them
      page_two;

      Seo::PermanentRedirect.create!(origin_id: page_one.id, destination_id: page_two.id)

      get :show, { id: page_one.id }, {}
    end

    it "should redirect from the origin to the destination page" do
      expect(response).to redirect_to(page_path(page_two))
    end

    specify "a 301 status is returned" do
      expect(response.code).to eq("301")
    end
  end

  context "no redirections setup" do
    it "should render the page as usual" do
      get :show, { id: page_one.id }, {}
      expect(response).to render_template("show")
    end
  end
end

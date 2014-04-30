class ApplicationController < ActionController::Base
  protect_from_forgery

  include Seo::MetaTags
  Seo::MetaTags.default_title = "Dummy"
end

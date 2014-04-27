require "seo/engine"
require 'seo/acts_as_seo_content'

module Seo
  mattr_accessor :page_class

  def self.page_class
    @@page_class.constantize
  end
end

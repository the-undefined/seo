require "seo/engine"

module Seo
  mattr_accessor :page_class

  def self.page_class
    @@page_class.constantize
  end
end

class Article < ActiveRecord::Base
  attr_accessible :body, :title

  acts_as_seo_content
end

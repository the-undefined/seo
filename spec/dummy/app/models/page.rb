class Page < ActiveRecord::Base
  attr_accessible :slug, :title

  acts_as_seo_content
end

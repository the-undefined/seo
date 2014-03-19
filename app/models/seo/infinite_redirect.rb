module Seo
  module InfiniteRedirect
    def valid_redirect?(origin, destination)
      origin.to_s != destination.to_s
    end
  end
end

SEO
===

Rails engine with mounted UI to instigate activites to assist SEO personel.

## 301 Redirects

These relate to SEO in the sense of forwarding on search engine rankings that you have built up.

### Usage

Follow the steps to install the engine first, and then include the `Seo::Redirects` module in the controller that handles the pages that you would like to set up 301 redirects for:

```ruby
class PagesController < ApplicationController
  include Seo::Redirects

  # ...
end
```

Now set up a redirect using the engine Web UI: [localhost:3000/seo/permanent_redirects](http://localhost:3000/seo/permanent_redirects). The fields correspond to:

- **Origin**: The page that you would like to redirect from
- **Destination**: The page you would like to redirect to

Go and hit your origin page in the browser and you'll be redirected to the destination with a status code of 301.

### Edge Cases

If your application uses methods other than generated scaffolding for finding or visiting pages then you may need to override some of the `Seo::Redirect` methods in your controller.

#### Resource Retrieval

As an example this is how you could set up the redirects to work with the [friendly_id](https://github.com/norman/friendly_id/tree/4.0-stable) gem (< Rails 4.0):

```ruby
class PagesController < ApplicationController
  include Seo::Redirects

  # ...

  private

  def fetch_page_id(params)
    id = params.fetch(:id)

    unless id =~ /d+/ # friendly_id gem compatability
      id = Seo.page_class.find(id).id
    end

    id.to_i
  end
end
```

The `friendly_id` gem overrides the find method to work with slugs.

#### URL's

If you desire to use something other than the `url_for` method to determine where to redirect to, perhaps you have a catchall route (`get '/*path', to: "..."`), then you can override the `url_for_destination(page)` method:

```ruby
class PagesController < ApplicationController
  include Seo::Redirects

  private

  def url_for_destination(page)
    link_generator_for(page.slug)
  end
end
```

## License

This project uses MIT-LICENSE.

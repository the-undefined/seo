# due to models registering themselves with `acts_as_seo_content`
# if these have not being loaded (like in development mode) then
# they do not appear as options as a resource for meta_contents
# CRUD actions.
#
# This is a development workaround for the time being.
#
Page
Article

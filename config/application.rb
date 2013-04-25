require File.expand_path('../boot', __FILE__)

require 'rails/all'

if defined?(Bundler)
  Bundler.require(*Rails.groups(:assets => %w(development test)))
end

module ReadyBlog
  class Application < Rails::Application
    config.active_record.whitelist_attributes = true

    config.active_support.escape_html_entities_in_json = true

    config.assets.enabled = true
    config.assets.inialize_on_precompile = false
    config.assets.version = '1.0'

    config.encoding = "utf-8"

    config.filter_parameters += [:password]
  end
end

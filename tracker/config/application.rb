require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Tracker
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Config rspec generators
    config.generators do |g|
      g.test_framework :rspec
      g.helper_specs false
      g.controller_specs false
      g.view_specs false
      g.routing_specs false
      g.request_specs false
    end

    # Set uuid as primary key
    config.generators do |g|
      g.orm :active_record, primary_key_type: :uuid
      g.orm :active_record, force_foreign_key_type: :uuid
    end

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'http://localhost:3002'
        resource '*', headers: :any, methods: [:post], credentials: true
      end
    end
  end
end

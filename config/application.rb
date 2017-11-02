# frozen_string_literal: true

require_relative 'boot'
require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ADS
  class Application < Rails::Application
    config.generators do |g|
      g.test_framework  false
      g.test_unit       false
      g.assets          false
      g.helper          false
      g.jbuilder        false
    end

    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :ru

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end

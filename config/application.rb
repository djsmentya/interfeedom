# -*- encoding : utf-8 -*-
require File.expand_path('../boot', __FILE__)

require "./lib/extension_initializer"
require 'rails/all'
require 'sprockets/railtie'

if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
  Bundler.require *Rails.groups(:assets => %w(development test))
  # If you want your assets lazily compiled in production, use this line
  # Bundler.require(:default, :assets, Rails.env)
end

module Interfreedom
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    $extension_list = []

    config.generators do |g|
      g.template_engine :haml
      #g.fixture_replacement :factory_girl, :dir => "spec/factories"
    end

    #declarative authorization
    config.gem "declarative_authorization", :source => "http://gemcutter.org"
    config.gem "paperclip"
    config.session_store = :active_record_store

    config.before_configuration do
      I18n.load_path += Dir[Rails.root.join('config', 'locales', '*.{rb,yml}').to_s]
      I18n.locale = :ua
      I18n.default_locale = :ua
      config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '*.{rb,yml}').to_s]
      config.i18n.locale = :ua
      # bypasses rails bug with i18n in production\
      I18n.reload!
      config.i18n.reload!
    end

    config.i18n.locale = :ua
    config.i18n.default_locale = :ua

    # Custom directories with classes and modules you want to be autoloadable.
    # config.autoload_paths += %W(#{config.root}/extras)

    # Only load the plugins named here, in the order given (default is alphabetical).
    # :all can be used as a placeholder for all plugins not explicitly named.
    # config.plugins = [ :exception_notification, :ssl_requirement, :all ]
   
    # Activate observers that should always be running.
    # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    #config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :ua
    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"
    
    config.i18n.fallbacks = true
    
    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password]

    # Enable the asset pipeline
    config.assets.enabled = true

    # Version of your assets, change this if you want to expire all your assets
    config.assets.version = '1.0'
  end
end

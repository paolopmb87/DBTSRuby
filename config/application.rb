require_relative 'boot'

require 'socket'
require 'ipaddr'

require 'rails/all'
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
# require "action_mailer/railtie"
require "action_view/railtie"
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
Bundler.require(:default, Rails.env)

module DBTSRuby
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    #
    config.web_console.whitelisted_ips = Socket.ip_address_list.reduce([]) do |res, addrinfo|
        addrinfo.ipv4? ? res << IPAddr.new(addrinfo.ip_address).mask(24) : res
    end
  end

  # config.api_only = true
end

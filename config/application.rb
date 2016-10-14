require File.expand_path("../boot", __FILE__)

require "rails/all"

Bundler.require(*Rails.groups)

module Marvels
  class Application < Rails::Application
    config.time_zone                        = "Brasilia"
    config.active_record.default_timezone   = :local
    config.i18n.default_locale              = :"pt-BR"
    config.i18n.available_locales           = %w(pt-BR)
  end
end

require 'socket'

module Datumfactory
  class Config
    class Boolean; end

    DEVELOPMENT_ENVIRONMENTS = %w[development test].map(&:freeze).freeze

    DEFAULT_PATHS = ['config/datumfactory.yml'].map(&:freeze).freeze

    OPTIONS = {
      api_key: {
        description: 'The API key for your Datumfactory container.',
        default: nil,
        type: String
      }
    }.freeze

    DEFAULTS = Hash[OPTIONS.map{|k,v| [k, v[:default]] }].freeze
  end
end

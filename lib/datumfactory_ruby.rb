# frozen_string_literal: true

require "datumfactory_ruby/version"
require "httparty"

module DatumfactoryRuby
  class Events
    include HTTParty

    attr_reader :auth_token

    format :json
    base_uri "http://lvh.me:3000"

    def initialize(site, email, password)
      self.class.base_uri "http://#{site}.lvh.me:3000"
      @site = site
      @email = email
      @password = password
      @options = {
        headers: {
          "Content-Type" => "application/json"
        }
      }
    end

    def login
      result = self.class.post("/api/login", @options.merge(
        query: {
          "email": @email,
          "password": @password
        }))
      @auth_token = result["auth_token"]
    end

    def events
      self.class.get("/api/v1/events", @options.merge({ headers: { "Authorization" => "Bearer #{@auth_token}" } }))
    end

  end
end


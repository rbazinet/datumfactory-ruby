# frozen_string_literal: true

require "datumfactory/version"
require "httparty"
require "json"

module Datumfactory
  class Events
    include HTTParty

    attr_reader :auth_token

    format :json
    base_uri "localtest.me:3000"

    def initialize(site, email, password)
      self.class.base_uri "localtest.me:3000"
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

    def get(id)
      self.class.get("/api/v1/events/#{id}", @options.merge({ headers: { "Authorization" => "Bearer #{@auth_token}" } })).parsed_response
    end

    def all
      self.class.get("/api/v1/events", @options.merge({ headers: { "Authorization" => "Bearer #{@auth_token}" } })).parsed_response
    end

    def destroy(id)
      self.class.delete("/api/v1/events/#{id}", @options.merge({ headers: { "Authorization" => "Bearer #{@auth_token}" } }))
    end

    def by_slug(id)
      self.class.get("/api/v1/events/by-slug/#{id}", @options.merge({ headers: { "Authorization" => "Bearer #{@auth_token}" } })).parsed_response
    end

    def create(data, title, slug, description = nil)
      body = {
        query: {
          event: {
            data: data,
            title: title,
            description: description,
            slug: slug
          }
        }
      }

      @options.merge!({ headers: { "Authorization" => "Bearer #{@auth_token}" } })
      @options.merge!(body)
      self.class.post("/api/v1/events", @options).parsed_response
    end
  end
end


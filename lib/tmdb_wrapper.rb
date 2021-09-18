# frozen_string_literal: true

require "faraday"
require "faraday_middleware"
require "tmdb_wrapper/version"

module TmdbWrapper
  autoload :Client, "tmdb_wrapper/client"
  autoload :Collection, "tmdb_wrapper/collection"
  autoload :Error, "tmdb_wrapper/error"
  autoload :Object, "tmdb_wrapper/object"
  autoload :Resource, "tmdb_wrapper/resource"

  # Objects
  autoload :Instance, "tmdb_wrapper/objects/instance"
  autoload :Movie, "tmdb_wrapper/objects/movie"

  # Resources
  autoload :MovieResource, "tmdb_wrapper/resources/movie"
end

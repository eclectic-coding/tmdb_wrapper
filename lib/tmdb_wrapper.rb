# frozen_string_literal: true

require "faraday"
require "faraday_middleware"
require "tmdb_wrapper/version"

module TmdbWrapper
  autoload :Client, 'tmdb_wrapper/client'
  autoload :Error, 'tmdb_wrapper/error'
end

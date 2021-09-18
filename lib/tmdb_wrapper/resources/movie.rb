module TmdbWrapper
  class MovieResource < Resource
    def popular
      Movie.new get_request("movie/popular").body
    end
  end
end

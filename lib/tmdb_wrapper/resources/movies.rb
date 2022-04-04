module TmdbWrapper
  class MoviesResource < Resource
    def popular
      response = get_request("movie/popular").body
    end
  end
end

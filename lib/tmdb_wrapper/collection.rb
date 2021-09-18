module TmdbWrapper
  attr_reader :data, :page, :total_results, :total_pages

  class Collection
    def self.from_response(response)
      body = response.body
      new(
        data: body,
        page: body.dig("page"),
        total_results: body.dig("total_results"),
        total_pages: body.dig("total_pages")
      )
    end

    def initialize(data:, page:, total_results:, total_pages:)
      @data = data
      @page = page
      @total_results = total_results
      @total_pages = total_pages
    end
  end
end

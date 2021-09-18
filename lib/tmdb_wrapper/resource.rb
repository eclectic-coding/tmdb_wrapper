module TmdbWrapper
  class Resource
    attr_reader :client

    def initialize(client)
      @client = client
    end

    def get_request(url, headers: {})
      handle_response client.connection.get(url, default_headers.merge(headers))
    end

    def default_headers
      {api_key: client.api_key}
    end

    private

    def handle_response(response)
      case response.status
      when 400
        raise Error, "Your request was malformed. #{response.body["error"]}"
      when 401
        raise Error, "You did not supply valid authentication credentials. #{response.body["error"]}"
      when 403
        raise Error, "You are not allowed to perform that action. #{response.body["error"]}"
      when 404
        raise Error, "No results were found for your request. #{response.body["error"]}"
      when 429
        raise Error, "Your request exceeded the API rate limit. #{response.body["error"]}"
      when 500
        raise Error, "We were unable to perform the request due to server-side problems. #{response.body["error"]}"
      when 503
        raise Error, "You have been rate limited for sending more than 20 requests per second. #{response.body["error"]}"
      end

      response
    end
  end
end

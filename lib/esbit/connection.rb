module Esbit
  class Connection
    def initialize(campfire)
      @campfire = campfire
    end

    def get(path, params = {})
      make_request do
        RestClient.get request_url(path), params
      end
    end

    def post(path, params = {})
      make_request do
        RestClient.post request_url(path), params
      end
    end

    private
    def make_request
      raw_response = yield
      handle_response(raw_response)
    end

    def handle_response(raw_response)
      JSON.parse raw_response
    end

    def base_url
      "https://#{@campfire.token}@#{@campfire.subdomain}.campfirenow.com"
    end

    def request_url(path)
      "#{URI.join(base_url, path)}.json"
    end
  end
end

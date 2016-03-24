require 'faraday'
require 'json'

module PunkAPI
  class Client
    attr_reader :api_key

    DEFAULT_API_URL = 'https://punkapi.com/api/v1'

    def initialize(api_key)
      @api_key = api_key
    end

    def beer(id)
      request('beers', id)
    end

    def beers(params = {})
      request('beers', params)
    end

    def random_beer
      request('beers/random')
    end

    def request(url, params = {})
      url += "/#{params.delete(:id)}" if params[:id]
      res = connection.get url, params
      parse(res)
    end

    def parse(res)
      response = JSON.parse(res.body, object_class: PunkAPI::Entity)
      response.code = res.status unless res.success?
      response
    end

    def connection
      @connection ||= Faraday.new(DEFAULT_API_URL, ssl: { verify: false })
      @connection.basic_auth(@api_key, '')
      @connection
    end
  end
end

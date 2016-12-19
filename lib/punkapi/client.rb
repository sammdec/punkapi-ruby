require 'faraday'
require 'json'

module PunkAPI
  class Client
    DEFAULT_API_URL = 'https://api.punkapi.com/v2'.freeze

    def initialize
    end

    def beer(id)
      beer = request('beers', id: id)
      beer[0]
    end

    def beers(params = {})
      request('beers', params)
    end

    def random_beer
      beer = request('beers/random')
      beer[0]
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
      @connection
    end
  end
end

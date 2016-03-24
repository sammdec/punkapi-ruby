require 'spec_helper'

describe PunkAPI::Client do
  let(:client) { PunkAPI::Client.new(ENV['API_KEY']) }

  it 'has a version number' do
    expect(PunkAPI::VERSION).not_to be nil
  end

  describe '#beer' do
    it 'given an id, returns a PunkAPI::Entity object' do
      beer = client.beer(1)
      expect(beer).to be_a PunkAPI::Entity
      expect(beer.name).to eq('Buzz')
    end
  end

  describe '#random_beer' do
    it 'returns a random PunkAPI::Entity object' do
      beer = client.random_beer
      expect(beer).to be_a PunkAPI::Entity
      expect(beer.id).to be_between(1, 215)
    end
  end

  describe '#beers' do
    it 'returns a PunkAPI::Entity object with an abv greater than 10' do
      beers = client.beers(abv_gt: 10)
      expect(beers[0]).to be_a PunkAPI::Entity
      expect(beers[0].abv).to be > 10
    end

    it 'returns a PunkAPI::Entity object with a name matching Punk' do
      beers = client.beers(beer_name: 'Punk')
      expect(beers[0]).to be_a PunkAPI::Entity
      expect(beers[0].name).to include('Punk')
    end

    it 'returns 25 PunkAPI::Entity objects' do
      beers = client.beers
      expect(beers[0]).to be_a PunkAPI::Entity
      expect(beers.count).to eq(25)
    end

    context 'incorrect api_key' do
      it 'returns an error status of 401' do
        client = PunkAPI::Client.new('fake')
        resp = client.beers
        expect(resp.code).to eq(401)
      end
    end
  end
end

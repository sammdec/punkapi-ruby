require 'spec_helper'

describe PunkAPI::Client do
  let(:client) { PunkAPI::Client.new }

  it 'has a version number' do
    expect(PunkAPI::VERSION).not_to be nil
  end

  describe '#beer' do
    it 'given an id, returns a PunkAPI::Entity object' do
      beer = client.beer(1)
      puts beer
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
      puts beers
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
  end
end

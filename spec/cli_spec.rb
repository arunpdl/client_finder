require_relative 'spec_helper'

RSpec.describe ClientFinder::CLI do
  describe '.start' do
    let(:clients) { create_test_clients }

    before do
      allow(ClientFinder::Loader).to receive(:load).and_return(clients)
    end

    describe 'with no arguments' do
      it 'displays usage information' do
        expect { ClientFinder::CLI.start([]) }.to output(/Usage:/).to_stdout.and raise_error(SystemExit)
      end
    end

    describe 'with search command' do
      it 'calls Searcher.search with query' do
        expect(ClientFinder::Searcher).to receive(:search).with(clients, 'John')
        ClientFinder::CLI.start(['search', 'John'])
      end

      it 'handles empty search query' do
        expect { ClientFinder::CLI.start(['search', '']) }.to output(/Please provide a search query/).to_stdout
      end

      it 'handles nil search query' do
        expect { ClientFinder::CLI.start(['search']) }.to output(/Please provide a search query/).to_stdout
      end
    end

    describe 'with duplicates command' do
      it 'calls DuplicateFinder.check' do
        expect(ClientFinder::DuplicateFinder).to receive(:check).with(clients)
        ClientFinder::CLI.start(['duplicates'])
      end
    end

    describe 'with unknown command' do
      it 'displays error message' do
        expect { ClientFinder::CLI.start(['unknown']) }.to output(/Unknown command/).to_stdout
      end
    end
  end
end
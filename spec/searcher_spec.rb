require_relative "spec_helper"

RSpec.describe ClientFinder::Searcher do

  let(:clients) {create_test_clients}

  describe 'search with provided term' do
      it "finds clients by full name" do
        expect { described_class.search(clients, "Arun Poudel")}.to output(/Arun Poudel/).to_stdout
      end
      
      it "finds clients by partial name" do
        expect { described_class.search(clients, "Harry") }.to output(/Harry Potter/).to_stdout
        expect { described_class.search(clients, "Harry") }.to output(/Harry Osborne/).to_stdout
      end

      it "handles case-insensitive search term" do
        expect {described_class.search(clients, "ARUN")}.to output(/Arun Poudel/).to_stdout
        expect {described_class.search(clients, "arun")}.to output(/Arun +Poudel/).to_stdout
      end

      it "handles no match" do
        expect { described_class.search(clients, "Ram") }.to output(/No clients found/).to_stdout
      end

      it "handles empty search term" do
        expect { described_class.search(clients, "") }.to output(/No clients found/).to_stdout
      end

      it "handles special characters in search term" do
        expect { described_class.search(clients, "+Poudel") }.to_not raise_error
      end
  end
end
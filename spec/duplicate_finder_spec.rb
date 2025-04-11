require_relative "spec_helper"

RSpec.describe ClientFinder::DuplicateFinder do
  let (:clients) { create_test_clients }

  describe "check for duplicates" do
    it "detects duplicates based on email" do
      expect { described_class.check(clients) }.to output(/Duplicate clients found/).to_stdout
    end

    it "handles case-insensitive duplicates" do
      expect { described_class.check(clients) }.to output(/mary jane/).to_stdout
    end

    it "handles empty email field" do
      expect { described_class.check(clients) }.to output(/Empty Email/).to_stdout
    end

    it "handles nil email field" do
      expect { described_class.check(clients) }.to output(/No Email/).to_stdout
    end

    it "handles special characters in email" do
      expect { described_class.check(clients) }.to_not raise_error
    end

    it "handles no duplicates" do
      unique_clients = [
        { "id" => 1, "full_name" => "Unique Client", "email" => "unique@gmail.com" },
        { "id" => 1, "full_name" => "Unique Client2", "email" => "unique-user@gmail.com" }
        ]
      expect { described_class.check(unique_clients) }.to output(/No duplicate emails found/).to_stdout
    end
  end

  it "handles empty client list" do
    empty_clients = []
    expect { described_class.check(empty_clients) }.to output(/No duplicate emails found/).to_stdout
  end

end
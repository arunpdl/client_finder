require_relative "spec_helper"
require "tempfile"

RSpec.describe ClientFinder::Loader do
  describe "load function" do
    it "loads and parses JSON file correctly" do
      temp_file = Tempfile.new(["clients", ".json"])
      test_data = create_test_clients
      temp_file.write(JSON.generate(test_data))
      temp_file.close

      result = described_class.load(temp_file.path)
      expect(result).to eq(test_data)

      temp_file.unlink
    end

    it "gives error if file path is invalid" do
      invalid_path = "invalid_path.json"
      expect { described_class.load(invalid_path) }.to output(/File not found/).to_stdout.and raise_error(SystemExit)
    end

    it "gives error if JSON is invalid" do
      temp_file = Tempfile.new(["invalid", ".json"])
      temp_file.write("invalid json")
      temp_file.close

      expect { described_class.load(temp_file.path) }.to output(/Error parsing JSON from file/).to_stdout.and raise_error(SystemExit)

      temp_file.unlink
    end

    it "handles empty JSON file" do
      temp_file = Tempfile.new(["empty", ".json"])
      temp_file.write([])
      temp_file.close

      result = described_class.load(temp_file.path)
      expect(result).to eq([])

      temp_file.unlink
    end
  end
end

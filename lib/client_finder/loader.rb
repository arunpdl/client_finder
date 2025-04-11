require 'json'

module ClientFinder
  class Loader
    def self.load(file_path)
      JSON.parse(File.read(file_path))
    rescue Errno::ENOENT
      puts "File not found: #{file_path}"
      exit
    rescue JSON::ParserError
      puts "Error parsing JSON from file: #{file_path}"
      exit
    end
  end
end
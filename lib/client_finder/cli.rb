require_relative 'loader'
require_relative 'searcher'
require_relative 'duplicate_finder'

module ClientFinder
  class CLI
    def self.start(args)
      if args.empty?
        puts "Usage:\n  client_finder search <query>\n  client_finder duplicates"
        exit
      end

      command = args[0]
      file_path = "clients.json"
      clients = Loader.load(file_path)

      case command
      when "search"
        query = args[1]
        if query.nil? || query.empty?
          puts "Please provide a search query."
          puts "Usage:\n  client_finder search <query>"
        else
          Searcher.search(clients, query)
        end
      when "duplicates"
        DuplicateFinder.check(clients)
      else
        puts "Unknown command: #{command}"
      end
    end
  end
end

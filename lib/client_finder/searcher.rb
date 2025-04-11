module ClientFinder
  class Searcher
    def self.search(clients, query)
      results = clients.select { |client| client['full_name'].to_s.downcase.include?(query.downcase) }
      if results.empty? || query.empty?
        puts "No clients found matching '#{query}'."
      else
        results.each { |result| puts "#{result['id']}: #{result['full_name']} (#{result['email']})"}
      end
    end
  end
end
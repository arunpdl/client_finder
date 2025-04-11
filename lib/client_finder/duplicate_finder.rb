module ClientFinder
  class DuplicateFinder
    def self.check(clients)
      grouped = clients.group_by { |client| client['email'].to_s.downcase}
      duplicates = grouped.select { |_email, list| list.size > 1 }

      if duplicates.empty?
        puts "No duplicate emails found."
      else
        puts "Duplicate clients found:"
        duplicates.each do |email, users|
          puts "Email: #{email}"
          users.each { |user| puts " #{user["id"]}: #{user['full_name']}" }
        end
      end
    end
  end
end
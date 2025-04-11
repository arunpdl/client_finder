require 'json'
require_relative '../lib/client_finder/cli'
require_relative '../lib/client_finder/loader'
require_relative '../lib/client_finder/searcher'
require_relative '../lib/client_finder/duplicate_finder'

def create_test_clients
  [
    { "id" => 1, "full_name" => "Arun Poudel", "email" => "arunpdl013@gmail.com" },
    { "id" => 2, "full_name" => "Harry Potter", "email" => "harry.potter@hogwarts.com" },
    { "id" => 3, "full_name" => "Harry Osborne", "email" => "harry@oscorp.com" },
    { "id" => 4, "full_name" => "Peter Parker", "email" => "peter.parker@oscorp.com" },
    { "id" => 5, "full_name" => "Peter Parker", "email" => "peter.parker@avengers.com" },
    { "id" => 6, "full_name" => "mary jane", "email" => "MARY@oscorp.com" },
    { "id" => 6, "full_name" => "mary jane", "email" => "mary@OSCORP.com" },
    { "id" => 7, "full_name" => "Hermoine granger", "email" => "hermoine@HOGWARTS.com" },
    { "id" => 8, "full_name" => "Arun +Poudel", "email" => "arunpdl@gmail.com" },
    { "id" => 9, "full_name" => nil, "email" => "no.name@gmail.com" },
    { "id" => 10, "full_name" => "No Email", "email" => nil },
    { "id" => 11, "full_name" => "Empty Email", "email" => "" }
  ]
end
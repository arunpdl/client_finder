## Client Finder

A command-line Ruby application that allows you to search for clients in a JSON file and find duplicate emails.

## Features

- Search for clients by name
- Find duplicate emails

## Setup

### Requirements

- Ruby
- Bundler

### Installation

1. Clone the repository:

   `git clone `

   `cd client_finder`

2. Install dependencies:

   `bundle install`

3. Make the app executable:

   `chmod +x bin/client_finder`

### Usage

#### Search clients by name:

    bin/client_finder search <name>

Example: `bin/client_finder search John`

#### Find duplicate emails:

    bin/client_finder duplicates

Example: `bin/client_finder duplicates`

### Development

#### Run tests

To run the tests, use the following command:

    bundle exec rspec

## Assumptions and Decisions

- The JSON file named `clients.json` is assumed to be in the same directory as the script.
- The JSON file is assumed to be well-formed and contain an array of client objects with fields `id`, `full_name` and `email`.
- The search is case-insensitive.
- The duplicate email check is case-insensitive.
- The project is separated into different classes for different functionalities:
  - `Loader`: Handles file loading and parsing the JSON file
  - `Searcher`: Handles filtering clients based on search term
  - `DuplicateFinder`: Handles finding duplicate emails in the client list
  - `CLI`: Handles command-line interface interaction and argument parsing

## Known Limitations

- The application does not support dynamic file names or paths for the JSON file. It is hardcoded to look for `clients.json` in the current directory.
- The search functionality is limited to the `full_name` field of the client objects. It does not support searching by other fields like `email` or `id`.
- The JSON data is assumed to be well-formed. If the JSON file is malformed, the application raises an error.

## Future Improvements

- Add support for searching by other fields (e.g., `email`, `id`).
- Add support for dynamic file names or paths for the JSON file.
- Add support for larger datasets (e.g., using a database).
- Improve error handling for malformed JSON files.
- Add REST API support for searching clients and finding duplicates.

# Erudito API

This is the backend app that powers Erudito's learning platform.
It is build with Rails 6

## Prerequisites

This project requires:

- Ruby 2.6.3, preferably managed using [rbenv][]
- PostgreSQL must be installed and accepting connections


## Getting started

### bin/setup

Run the `bin/setup` script. This script will:

- Check you have the required Ruby version
- Install gems using Bundler
- Create, migrate, and seed the database

### Environment variables

- Create local copies of the required environment variables - `cp .example.env .env`

### Run it!

1. Run `bundle exec rspec` to make sure everything works.
4. Run `bin/rails server`

## API Documentation
The API documentation is generated with rspec_api_documention using the slate format.
- To generate / update the API documentation:

```bash
rspec spec/acceptance --format RspecApiDocumentation::ApiFormatter
```

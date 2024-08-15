# config/initializers/vcr.rb
require 'vcr'
require 'webmock'

VCR.configure do |config|
  config.cassette_library_dir = "spec/vcr_cassettes"
  config.hook_into :webmock
  config.configure_rspec_metadata! if defined?(RSpec)
  config.filter_sensitive_data('<ITERABLE_API_KEY>') { ENV['ITERABLE_API_KEY'] || 'fake_api_key' }
  config.allow_http_connections_when_no_cassette = true # Allow real requests if no cassette is found

  # Optionally, limit VCR to certain environments
  config.ignore_localhost = true # Ignore localhost requests unless you're testing APIs running locally

  config.default_cassette_options = { 
    record: ENV['VCR_MODE'] == 'all' ? :all : :once
  }
end

if Rails.env.development?
  VCR.turn_on!
end
VCR.configure do |config|
  config.cassette_library_dir = Rails.root.join("spec", "vcr")
  config.hook_into :webmock
  config.ignore_hosts "codeclimate.com"
end

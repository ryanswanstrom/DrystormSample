require 'capybara/poltergeist'

Capybara.javascript_driver = :poltergeist
Capybara.default_driver = :poltergeist
Capybara.register_driver :poltergeist do |app|
  options = {
    :js_errors => true,
    :timeout => 10,
    :debug => false,
    :phantomjs_options => ['--load-images=no', '--disk-cache=false'],
    :inspector => true,
  }
  Capybara::Poltergeist::Driver.new(app, options)
end

DatabaseCleaner.clean_with :truncation
DatabaseCleaner[:active_record].strategy = :transaction

Before do
  DatabaseCleaner.clean
  DatabaseCleaner.start
  load Rails.root + "db/seeds.rb"
end

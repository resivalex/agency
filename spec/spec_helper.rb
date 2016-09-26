ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

# RSpec
RSpec.configure do |config|
  config.use_transactional_fixtures = true # with ActiveRecord
  config.infer_base_class_for_anonymous_controllers = false # rspec-rails option

  config.order = 'random' # debug: --seed 1234
  config.infer_spec_type_from_file_location!
  config.raise_errors_for_deprecations!
  config.expect_with(:rspec) { |c| c.syntax = :expect } # disable 'should'
  config.profile_examples = 3
  config.fail_fast = true # stop arfter first fail
end

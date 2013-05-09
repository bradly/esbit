require 'esbit'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'
end

MOCK_ROOMS_API_RESPONSE = "{\"rooms\":[{\"updated_at\":\"2012/10/09 23:57:53 +0000\",\"topic\":\"Chat Room 1\",\"name\":\"Chat Room 1\",\"membership_limit\":25,\"created_at\":\"2012/01/26 06:25:58 +0000\",\"locked\":false,\"id\":1},{\"updated_at\":\"2012/06/13 13:25:52 +0000\",\"topic\":\"Chat Room 2\",\"name\":\"Chat Room 2\",\"membership_limit\":25,\"created_at\":\"2012/01/26 06:40:14 +0000\",\"locked\":false,\"id\":2}]}"

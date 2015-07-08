require "rspec_json_schema_matcher/version"

require 'rspec'
require 'rspec/expectations'
require 'json-schema'

# Validates JSON responses against a schema
RSpec::Matchers.define :match_schema do |schema|
  match do |body|
    schema_directory = "#{Dir.pwd}/spec/support/schemas"
    schema_path = "#{schema_directory}/#{schema}.json"
    opts = { validate_schema: true }

    begin
      @result = JSON::Validator.fully_validate_json(schema_path, body, opts)
    rescue JSON::Schema::ValidationError => e
      @result = "Schema '#{schema}' did not pass validation:\n\n- #{e.message}"
    end

    expect(@result).to eq []
  end

  failure_message do |body|
    "#{messages}\n\n#{body}"
  end

  description do
    "match the JSON schema '#{schema}'"
  end

private

  def messages
    if @result.respond_to?(:join)
      @result.join("\n")
    else
      @result
    end
  end
end


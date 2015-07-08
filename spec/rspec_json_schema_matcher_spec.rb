require "spec_helper"

describe RSpecJSONSchemaMatcher do
  it "has a version number" do
    expect(RSpecJSONSchemaMatcher::VERSION).to be
  end
end

describe "match_schema" do
  subject { ->{ expect(json).to match_schema(schema) } }

  let(:json)   { File.read("#{Dir.pwd}/spec/support/fixtures/#{data}.json") }

  let(:data)   { "valid_data" }
  let(:schema) { "valid_schema" }

  context "when given a valid schema" do
    context "and conforming data" do
      it { should_not raise_error }
    end

    context "and non-conforming data" do
      let(:data) { "invalid_data" }
      it { should raise_error.with_message /did not match.+in schema/ }
    end
  end

  context "when given an invalid schema" do
    let(:schema) { "invalid_schema" }
    it { should raise_error.with_message /Schema.+did not pass/ }
  end

  context "when given a missing schema" do
    let(:schema) { "non_existing_schema" }
    it { should raise_error Errno::ENOENT }
  end
end

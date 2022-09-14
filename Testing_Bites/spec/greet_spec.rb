require 'greet'

RSpec.describe "greet method" do
  it "greets a given user" do
    result = greet("Kate")
    expect(result).to eq "Hello, Kate!"
  end
end

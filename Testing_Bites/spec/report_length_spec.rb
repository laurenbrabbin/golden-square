require 'report_length'

RSpec.describe "report_length method" do
  it "returns the length of the short string" do
    result = report_length("yellow")
    expect(result).to eq "This string was 6 characters long."
  end
  it "returns the length of the long string" do
    result = report_length("Hello! What is your name?")
    expect(result).to eq "This string was 25 characters long."
  end
  it "returns the length of the short string" do
    string = "dog"
    result = report_length(string)
    expect(result).to eq "This string was #{string.length} characters long."
  end
end


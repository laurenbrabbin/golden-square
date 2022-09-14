require 'check_codeword'

RSpec.describe "check_codeword method" do
  it "returns correct message with correct word" do
    result = check_codeword("horse")
    expect(result).to eq "Correct! Come in."
  end
  it "returns wrong message with wrong word" do
    result = check_codeword("mop")
    expect(result).to eq "WRONG!"
  end
  it "returns close message with close word" do
    result = check_codeword("house")
    expect(result).to eq "Close, but nope."
  end
  it "returns wrong message with just right first letter" do
    result = check_codeword("holiday")
    expect(result).to eq "WRONG!"
  end
  it "returns wrong message with wrong word" do
    result = check_codeword("pope")
    expect(result).to eq "WRONG!"
  end
end
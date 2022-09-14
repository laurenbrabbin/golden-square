require 'add_five' #require the file
#test suite
RSpec.describe "add_five method" do #describing the unit we're testing
  it "adds 5 to 3 to return 8" do #describing the example
    result = add_five(3) #run method with the example argument
    expect(result).to eq 8
  end
end
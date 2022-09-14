require "password_checker"

RSpec.describe PasswordChecker do
  it "returns true if password is greater or equal to 8" do
    password_checker = PasswordChecker.new
    expect(password_checker.check("password")).to eq true
  end
  it "fails if password is less than 8 characters" do 
    password_checker = PasswordChecker.new
    expect { password_checker.check("pass") }.to raise_error "Invalid password, must be 8+ characters."
  end
end 

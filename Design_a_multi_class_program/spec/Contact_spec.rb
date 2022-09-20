require "contact"

RSpec.describe Contact do
  describe "#name" do
    it "returns the name of the contact" do
      contact1 = Contact.new("lauren", "1234")
      expect(contact1.name).to eq "lauren"
    end
  end
  describe "#number" do
    it "returns the number of the contact" do
      contact1 = Contact.new("lauren", "1234")
      expect(contact1.number).to eq "1234"
    end
  end 
  context "no name entered" do
    it "returns error" do
      expect{ lauren = Contact.new("", "0789898") }.to raise_error "Please ensure both name and number have been submitted"
    end
  end
  context "no number entered" do
    it "returns error" do
      expect{ lauren = Contact.new("lauren", "") }.to raise_error "Please ensure both name and number have been submitted"
    end
  end
end


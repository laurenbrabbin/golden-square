require 'present'

RSpec.describe Present do
  context 'without error' do
    it 'wraps and unwraps presents' do
      present = Present.new
      present.wrap(1)
      expect(present.unwrap).to eq 1
    end
  end

  context 'no contents' do
    it 'fails to be unwrapped' do
      present = Present.new
      expect { present.unwrap() }.to raise_error "No contents have been wrapped."
    end
  end

  context 'there are contents' do
    it 'fails to be wrapped' do
      present = Present.new
      present.wrap(1)
      expect { present.wrap(6) }.to raise_error "A contents has already been wrapped."
    end
  end
end


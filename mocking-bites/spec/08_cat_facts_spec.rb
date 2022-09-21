require "08_cat_facts"

RSpec.describe CatFacts do
  it "calls an API to get a cat fact" do
    fake_fact = double  :cat_fact
    expect(fake_fact).to receive(:get).with(URI("https://catfact.ninja/fact")).and_return('{"fact":"A cat will tremble or shiver when it is extreme pain.","length":53}')
    cat_fact = CatFacts.new(fake_fact)
    expect(cat_fact.provide_fact).to eq "Cat fact: A cat will tremble or shiver when it is extreme pain."
  end
  it "calls an API to get a cat fact" do
    fake_fact = double  :cat_fact
    expect(fake_fact).to receive(:get).with(URI("https://catfact.ninja/fact")).and_return('{"fact":"In 1987, cats overtook dogs as the number one pet in America (about 50 million cats resided in 24 million homes in 1986). About 37% of American homes today have at least one cat.","length":178}')
    cat_fact = CatFacts.new(fake_fact)
    expect(cat_fact.provide_fact).to eq "Cat fact: In 1987, cats overtook dogs as the number one pet in America (about 50 million cats resided in 24 million homes in 1986). About 37% of American homes today have at least one cat."
  end
  it "calls an API to get length" do
    fake_fact = double  :cat_fact
    expect(fake_fact).to receive(:get).with(URI("https://catfact.ninja/fact")).and_return('{"fact":"A cat named Dusty, aged 1 7, living in Bonham, Texas, USA, gave birth to her 420th kitten on June 23, 1952.","length":107}')
    cat_fact = CatFacts.new(fake_fact)
    expect(cat_fact.provide_length).to eq "length: 107"
  end
end

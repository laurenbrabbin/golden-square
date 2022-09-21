require 'json'
require 'net/http'

class CatFacts
  def initialize(provider)
    @provider = provider
  end

  def provide_fact
    return "Cat fact: #{get_cat_fact["fact"]}" #use ["fact"] as it is a hash and this will pull the fact value rather than length value
  end

  def provide_length
    return "length: #{get_cat_fact["length"]}"
  end
  private

  def get_cat_fact
    text_response = @provider.get(URI("https://catfact.ninja/fact"))
    return JSON.parse(text_response)
  end
end

require 'net/http'
cat_fact = CatFacts.new(Net::HTTP)
p cat_fact.provide_fact
p cat_fact.provide_length
def encode(plaintext, key)
  cipher = key.chars.uniq + (('a'...'z').to_a - key.chars) #cipher = [s,c,r,t,k,y,a,b,d,f,g,h,i,j,l,m,n,o,p,q,u,v,w,x,z]
  ciphertext_chars = plaintext.chars.map do |char|
    p "ciper.find_index(char) is ..."
    p cipher.find_index(char).to_i
    (65 + cipher.find_index(char).to_i).chr
  end
  return ciphertext_chars.join
end

def decode(ciphertext, key)
  cipher = key.chars.uniq + (('a'...'z').to_a - key.chars)
  plaintext_chars = ciphertext.chars.map do |char| 
    cipher[char.ord - 65] 
  end 
  return plaintext_chars.join
end

p encode("theswiftfoxjumpedoverthelazydog", "secretkey")
p "EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL" #so we can compare

p decode("EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL", "secretkey")
p "theswiftfoxjumpedoverthelazydog"

# Intended output:
#
# > encode("theswiftfoxjumpedoverthelazydog", "secretkey")
# => "EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL"
#
# > decode("EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL", "secretkey")
# => "theswiftfoxjumpedoverthelazydog"
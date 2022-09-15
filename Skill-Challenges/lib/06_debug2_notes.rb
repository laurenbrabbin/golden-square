def encode(plaintext, key)
  cipher = key.chars.uniq + (('a'...'z').to_a - key.chars)
  #key.chars.uniq = [s,c,r,t,k,y]
  #(('a'...'z').to_a = [a,b,c, d, e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z]
  #key.chars = [s,e,c,r,e,t,k,e,y]
  #('a'...'z').to_a - key.chars = [a,b,c, d, e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z] - [s,e,c,r,e,t,k,e,y] --> [a,b,d,f,g,h,i,j,l,m,n,o,p,q,u,v,w,x,z]
  #key.chars.uniq + (('a'...'z').to_a - key.chars) = [s,c,r,t,k,y] + [a,b,d,f,g,h,i,j,l,m,n,o,p,q,u,v,w,x,z]
  #cipher = [s,c,r,t,k,y,a,b,d,f,g,h,i,j,l,m,n,o,p,q,u,v,w,x,z]
  
  # "theswiftfoxjumpedoverthelazydog"
  ciphertext_chars = plaintext.chars.map do |char|
    (65 + cipher.find_index(char).to_i).chr

  return ciphertext_chars.join
end

def decode(ciphertext, key) #ciphertex = "EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL"
  cipher = key.chars.uniq + (('a'...'z').to_a - key.chars) # = [s,c,r,t,k,y,a,b,d,f,g,h,i,j,l,m,n,o,p,q,u,v,w,x,z]
  plaintext_chars = ciphertext.chars.map do |char|
    cipher[65 - cipher.find_index(char).to_i].chr
  end
  return plaintext_chars.join
end

puts decode("EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL", "secretkey")
# Intended output:
#
# > encode("theswiftfoxjumpedoverthelazydog", "secretkey")
# => "EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL"
#
# > decode("EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL", "secretkey")
# => "theswiftfoxjumpedoverthelazydog"
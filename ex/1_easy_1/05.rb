ENCRYPTED_PIONEERS = [
  'Nqn Ybirynpr',
  'Tenpr Ubccre',
  'Nqryr Tbyqfgvar',
  'Nyna Ghevat',
  'Puneyrf Onoontr',
  'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
  'Wbua Ngnanfbss',
  'Ybvf Unvog',
  'Pynhqr Funaaba',
  'Fgrir Wbof',
  'Ovyy Tngrf',
  'Gvz Orearef-Yrr',
  'Fgrir Jbmavnx',
  'Xbaenq Mhfr',
  'Fve Nagbal Ubner',
  'Zneiva Zvafxl',
  'Lhxvuveb Zngfhzbgb',
  'Unllvz Fybavzfxv',
  'Tregehqr Oynapu'
].freeze

ALPHABET = ('a'..'z').to_a

def decrypt(names)
  result = []

  names.each do |name|
    new_name = ''

    name.each_char do |char|
      new_name << if ALPHABET.include?(char)
                    find_decrypted(char)
                  elsif ALPHABET.include?(char.downcase)
                    find_decrypted(char.downcase).upcase
                  else
                    char
                  end
    end
    result << new_name
  end

  result
end

def find_decrypted(char)
  ALPHABET[ALPHABET.index(char) - 13]
end

p decrypt(ENCRYPTED_PIONEERS)

# ---- With reduce ----

def decipher(char)
  case char
  when /[a-z]/ then find_decrypted(char)
  when /[A-Z]/ then find_decrypted(char.downcase).upcase
  else char
  end
end

def decrypted(name)
  name.each_char.inject('') do |result, char|
    result + decipher(char)
  end
end

ENCRYPTED_PIONEERS.each { |pioneer| puts decrypted(pioneer) }

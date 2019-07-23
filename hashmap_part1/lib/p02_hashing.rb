class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    hashed = 0

    self.each_with_index do |num, i|
      if i == 2
        hashed += num.hash / 2
      else
        hashed += num.hash
      end
    end
    hashed
  end
end

class String
  def hash
    
    alphabet = ("a".."z").to_a
    hashed = 0
    self.each_char.with_index do |char, i|
      hashed += (i + alphabet.index(char)).hash
    end
    hashed
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end

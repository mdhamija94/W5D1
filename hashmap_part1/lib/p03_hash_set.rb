require "byebug"

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    @store[self[key.hash]] << key
    @count += 1
    resize! if @count > num_buckets
  end
  

  def include?(key)
    # debugger
    @store[self[key.hash]].include?(key)
  end

  def remove(key)
    if self.include?(key)
      @store[self[key.hash]].delete(key)
      @count -= 1
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    index = num % num_buckets
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(num_buckets * 2) {Array.new}
    old_store = @store.flatten

    old_store.each do |key|
      # idx = key % new_store.length
      new_store[self[key.hash]] << key 
    end

    @store = new_store
  end
end

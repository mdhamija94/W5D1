class MaxIntSet
  attr_accessor :store
  def initialize(max)
    @max = max
    @store = Array.new(max, false)

  end

  def insert(num)
    raise "Out of bounds" if num > @max || num < 0
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num] == true
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store.each do |bucket|
      if bucket.empty?
        bucket << num
        break
      end
    end
  end

  def remove(num)
    @store.each do |bucket|
        bucket.delete(num)
    end
  end

  def include?(num)
    @store.each do |bucket|
      return true if bucket.include?(num)
    end
    false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count
  # attr_accessor :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    index = num % num_buckets
    if !self.include?(num)
      @store[index] << num
      @count += 1
      resize! if @count > num_buckets 
    end
  end


  def remove(num)
    if self.include?(num)
      @store[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    index = num % num_buckets
    @store[index].include?(num)
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
      # num_buckets *= 2 
      old_store.each do |ele|
        idx = ele % new_store.length
         new_store[idx] << ele
      end
      @store = new_store
  end
end

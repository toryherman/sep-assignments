require_relative 'hash_item'

class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    i = index(key, @items.size)

    while @items[i] && @items[i].value != value
      resize
    end

    @items[i] = HashItem.new(key, value)
  end

  def [](key)
    i = index(key, @items.size)
    @items[i].value
  end

  def resize
    temp = @items
    new_size = @items.size * 2
    @items = Array.new(new_size)

    temp.each do |x|
      if x
        i = index(x.key, @items.size)
        @items[i] = x
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    sum = 0
    key.each_char do |x|
      sum += x.ord
    end
    sum % size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

end

require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    i = index(key, @items.size)

    if @items[i] && @items[i].value != value
      i = next_open_index(i)

      if i == -1
        resize
        i = @items.size - 1
      end
    end

    @items[i] = Node.new(key, value)
  end

  def [](key)
    i = index(key, @items.size)
    # stop variable to allow while loop to reset
    # iterator to zero and prevent infinite loop
    stop = false

    while @items[i] && @items[i].key != key
      if i == 0
        stop = true
      end

      i += 1
      
      if i >= @items.size && stop == false
        i = 0
        stop = true
      end
    end

    if @items[i]
      @items[i].value
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

  # Given an index, find the next open index in @items
  def next_open_index(index)
    for i in index...@items.size do
      if !@items[i]
        return i
      end
    end

    for i in 0...index do
      if !@items[i]
        return i
      end
    end

    # return -1 if no match
    -1
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
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
end

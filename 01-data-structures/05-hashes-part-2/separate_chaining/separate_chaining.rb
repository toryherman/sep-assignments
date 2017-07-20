require_relative 'linked_list'
require_relative 'node'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @max_load_factor = 0.7
    @items = Array.new(size)
    @m = 0
  end

  def []=(key, value)
    # increment m number of items in llist
    @m += 1

    if load_factor > @max_load_factor
      resize
    end

    i = index(key, @items.size)
    node = Node.new(key, value)

    if !@items[i]
      @items[i] = LinkedList.new()
    end

    @items[i].add_to_tail(node)
  end

  def [](key)
    i = index(key, @items.size)

    current = @items[i].head
    while current && current.key != key
      current = current.next
    end

    if current
      current.value
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

  # Calculate the current load factor
  def load_factor
    k = (@items.size).to_f
    quotient = @m / k
    quotient
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
        current = x.head
        while current
          i = index(current.key, @items.size)
          node = Node.new(current.key, current.value)

          if !@items[i]
            @items[i] = LinkedList.new()
          end

          @items[i].add_to_tail(node)
          current = current.next
        end
      end
    end
  end

  def current_state
    i = 0
    @items.each do |x|
      str = "List #{i}:"
      puts str

      if x
        current = x.head
        j = 0
        while current
          sub_str = "#{j}. Key: #{current.key}, Value: #{current.value}"
          j += 1
          current = current.next
          puts sub_str
        end
      else
        puts "nil"
      end

      i += 1
    end
  end

end

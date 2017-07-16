class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
  end

  def enqueue(element)
    if @queue.empty?
      @head = element
    end
    @tail = element
    @queue << element
  end

  def dequeue
    if !@queue.empty?
      @head = @queue[1]
      item = @queue.shift
    end
  end

  def empty?
    @queue.length == 0
  end
end

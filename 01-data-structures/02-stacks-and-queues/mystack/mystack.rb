class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    @top = item
    @stack.unshift(item)
  end

  def pop
    if !@stack.empty?
      @top = @stack[1]
      @stack.shift
    end
  end

  def empty?
    @stack.length == 0
  end
end

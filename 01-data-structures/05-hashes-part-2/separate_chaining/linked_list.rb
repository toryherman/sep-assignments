require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  def initialize
    self.head = nil
    self.tail = nil
  end

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if @head == nil
      @head = node
    else
      @tail.next = node
    end

    @tail = node
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    temp = @head
    while temp.next
      prev = temp
      temp = temp.next
    end

    if prev
      prev.next = nil
      @tail = prev
    else
      # if no prev then list is empty
      @tail = nil
      @head = nil
    end
  end

  # This method prints out a representation of the list.
  def print
    temp = @head
    str = ""
    while temp
      str += temp.data + "\n"
      temp = temp.next
    end

    puts str
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    temp = @head
    while temp && temp != node
      prev = temp
      temp = temp.next
    end

    # return if no match
    if !temp
      return
    end

    if prev
      if !temp.next
        @tail = prev
      end
      prev.next = temp.next
    else
      # no prev means matched at head
      @head = temp.next
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    temp = @head
    @head = node
    @head.next = temp
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    temp = @head.next
    @head = temp
  end

  def length
    count = 0
    temp = @head

    while temp
      temp = temp.next
      count += 1
    end

    count
  end
  
end

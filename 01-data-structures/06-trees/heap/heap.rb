require_relative 'node'

class Heap
  attr_accessor :root

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    # BFS to find insertion location
    array = [@root]
    while !array.empty?
      temp = array.shift

      if !temp.left
        temp.left = node
        node.parent = temp
        break
      elsif !temp.right
        temp.right = node
        node.parent = temp
        break
      end

      array << temp.left if temp.left
      array << temp.right if temp.right
    end

    parent = node.parent

    if parent.left && parent.left.rating < parent.rating
      child = parent.left
      swap_up(parent, child)
    elsif parent.right && parent.right.rating < parent.rating
      child = parent.right
      swap_up(parent, child)
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    temp = root
    if temp.title == data
      return temp
    else
      if temp.left
        x = find(temp.left, data)
        return x if x
      end

      if temp.right
        x = find(temp.right, data)
        return x if x
      end
    end
  end

  def delete(root, data)
    node = find(root, data)
    return nil if !node

    last = find_last
    swap_down(node, last)

    if last.parent
      if last.parent.left == last
        last.parent.left = nil
      else
        last.parent.right = nil
      end
    end
  end

  # Recursive Breadth First Search
  def printf(children=nil)
    array = [@root]
    str = ''

    while !array.empty?
      temp = array.shift
      str += "#{temp.title}: #{temp.rating}\n"

      array << temp.left if temp.left
      array << temp.right if temp.right
    end

    puts str
  end

  private

  # recursively swap upwards in heap
  def swap_up(parent, child)
    pt = parent.title
    pr = parent.rating
    ct = child.title
    cr = child.rating

    parent.title = ct
    parent.rating = cr
    child.title = pt
    child.rating = pr

    if parent.parent
      grandparent = parent.parent
      if parent.rating < grandparent.rating
        swap_up(grandparent, parent)
      end
    end
  end

  # recursively swap downwards in heap
  def swap_down(parent, child)
    pt = parent.title
    pr = parent.rating
    ct = child.title
    cr = child.rating

    parent.title = ct
    parent.rating = cr
    child.title = pt
    child.rating = pr

    if parent.left && parent.left.rating < parent.rating
      grandchild = parent.left
      swap_down(parent, grandchild)
    elsif parent.right && parent.right.rating < parent.rating
      grandchild = parent.right
      swap_down(parent, grandchild)
    end

    if grandchild
      if grandchild.left && grandchild.left.rating < grandchild.rating
        great_grandchild = grandchild.left
        swap_down(grandchild, great_grandchild)
      elsif grandchild.right && grandchild.right.rating < grandchild.rating
        great_grandchild = grandchild.right
        swap_down(grandchild, great_grandchild)
      end
    end
  end

  def find_last
    # BFS to find last node
    array = [@root]
    while !array.empty?
      temp = array.shift
      array << temp.left if temp.left
      array << temp.right if temp.right
    end
    last = temp
  end

end

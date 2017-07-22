require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    temp = root

    while temp
      if node.rating < temp.rating
        if temp.left
          temp = temp.left
        else
          temp.left = node
          return
        end
      else
        if temp.right
          temp = temp.right
        else
          temp.right = node
          return
        end
      end
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
    if root.title == data
      delete_reorder(root);
      return
    else
      parent, target = delete_search(root, data)
    end

    if !target
      return nil
    else
      delete_reorder(target, parent);
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

  # returns parent, target
  def delete_search(root, data)
    temp = root
    if temp.left && temp.left.title == data
      return temp, temp.left
    elsif temp.right && temp.right.title == data
      return temp, temp.right
    else
      if temp.left
        parent, target = delete_search(temp.left, data)
        return parent, target if target
      end

      if temp.right
        parent, target = delete_search(temp.right, data)
        return parent, target if target
      end
    end
  end

  def delete_reorder(old_node, parent=nil)
    temp = old_node

    # if node to be deleted has left and right children
    if temp.left && temp.right
      # find min value of right tree
      # swap with node to be deleted
      min = temp.right

      while min.left
        if !min.left.left
          swap_parent = min
        end

        min = min.left
      end

      if parent
        if parent.left == old_node
          parent.left = min
        else
          parent.right = min
        end
      else
        @root = min
      end

      # if swapped node has right child
      # move up tree to it's parent
      if min.right
        swap_parent.right = min.right
      end

      # replace swapped node's children
      # with children of deleted node
      if old_node.left != min
        min.left = old_node.left
      end

      if old_node.right != min
        min.right = old_node.right
      end

      # remove swapped node from original location
      swap_parent.left = nil

    # if node to be deleted only has left child
    elsif temp.left
      if parent
        parent.left = temp.left
      else
        @root = temp.left
      end

    # if node to be deleted only has right child
    elsif temp.right
      if parent
        parent.right = temp.right
      else
        @root = temp.right
      end

    # if node to be deleted is leaf node
    else
      if parent
        if parent.left == old_node
          parent.left = nil
        else
          parent.right = nil
        end
      else
        return nil
      end
    end
  end

end

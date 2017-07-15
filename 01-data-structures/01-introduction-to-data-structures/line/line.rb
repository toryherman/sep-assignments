# A line of people at an amusement park ride
# There is a front to the line, as well as a back.
# People may leave the line whenever they see fit and those behind them take their place.
class Line
  attr_accessor :members

  def initialize
    self.members = []
  end

  def join(person)
    # push person to end of @members array/line
    @members << person
  end

  def leave(person)
    # @members array is searched and element
    # with value person is deleted
    @members.delete(person)
  end

  def front
    # returns person at front of line
    @members.first
  end

  def middle
    # returns person in middle of line
    mid_index = (@members.length / 2).floor
    @members[mid_index]
  end

  def back
    # returns person at back of line
    @members.last
  end

  def search(person)
    i = index(person)
    i ? @members[i] : nil
  end

  private

  def index(person)
    # return index location of person
    # return nil if does not exist
    i = 0
    @members.each do
      @members[i] == person ? break : i += 1
    end

    i < @members.length ? i : nil
  end

end

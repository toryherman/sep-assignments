require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    self.width = width
    self.height = height
    self.matrix = []

    # create empty subarray for each x pixel
    width.times do
      self.matrix << []
    end

    # create nil y pixels within each x subarray
    self.matrix.each do |x|
      height.times do
        x << nil
      end
    end
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    if inbounds(x, y)
      @matrix[x][y] = pixel
    end
  end

  def at(x, y)
    if inbounds(x, y)
      @matrix[x][y]
    end
  end

  private

  def inbounds(x, y)
    width = @matrix.length - 1
    height = @matrix[0].length - 1

    x < 0 || x > width || y < 0 || y > height ? nil : true
  end

end

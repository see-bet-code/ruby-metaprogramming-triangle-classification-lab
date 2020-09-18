require 'pry'
class Triangle
  # write code here
  attr_accessor :kind, :sides
  def initialize(side1, side2, side3)
    @sides = []
    @sides.push(side1, side2, side3)  
    raise  TriangleError if !(@sides.all?(&:positive?) && triangle_inequality_true?)
  end

  def kind
    #self.partner = person
    @kind ||= case @sides.uniq.size
                when 1
                  :equilateral
                when 2
                  :isosceles
                when 3
                  :scalene
                end
  end

  class TriangleError < StandardError
    # triangle error code
  end

  private 

  def triangle_inequality_true?
    max = @sides.max
    max < @sides.inject(:+) - max
  end

end

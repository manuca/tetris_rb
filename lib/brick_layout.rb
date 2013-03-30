class BrickLayout
  attr_reader :size

  def initialize(size = [10, 22])
    @size = size
  end

  def empty?
    true
  end
end

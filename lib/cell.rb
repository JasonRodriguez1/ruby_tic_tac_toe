class Cell
  def initialize(x, y)
    @mark = nil
    @x = x
    @y = y
  end  

  def get_mark 
    @mark
  end  

  def set_mark(mark)
     @mark = mark
  end

  def is_empty?
    if @mark == nil
       @is_empty = true
    elsif @mark == 'x' || @mark == 'o'
      @is_empty = false
    end
    @is_empty  
  end

  def get_x_coordinate
    @x
  end

  def get_y_coordinate
    @y
  end
end
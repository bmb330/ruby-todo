class TodoItem
  attr_accessor :name, :done

  def initialize(name)
    @name = name.chomp
    @done = false
  end

  def to_s
    @name
  end
end


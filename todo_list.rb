require_relative 'todo_item'

class TodoList
  def self.load(file)
    list = TodoList.new
    File.read(file).each_line { |item| list.add TodoItem.new(item) }
    list
  end

  def initialize
    @list = []
    @next = 0
  end

  def add(item)
    @list << item
  end

  def write(file)
    File.open(file, 'w') do |f|
      @list.select { |item| !item.done }.each { |item| f.puts item }
    end
  end

  def list
    @list.each { |item| item }
  end

  def next
    if value = @list[@next]
      @next += 1
    else
      @next = 0
    end
    value
  end

  def size
    @list.size
  end

  def [](id)
    @list[id]
  end
end

# frozen_string_literal: true

class LinkedList
  # setup head ,remmember we traverse a linkedlist from the head
  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    # create a new node
    this_node = Node.new(value)
    if @head.nil?
      @head = @tail = this_node
    else
      @tail.next_node = this_node
      @tail = this_node
    end
  end

  def prepend(value)
    # create a new node
    this_node = Node.new(value)
    if @head.nil?
      @head = @tail = this_node
    else
      this_node.next_node = @head
      @head = this_node
    end
  end

  def size
    count = 0
    current = @head
    until current.nil?
      current = current.next_node
      count += 1
    end
    count
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

list = LinkedList.new

p list

p list.append(10)
p list.append(20)

p list.prepend(5)
p list.prepend(16)

p list

p list.size

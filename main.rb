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
      @head = this_node
      return
    end

    current = @head
    # until current.nil means until we reach the last node
    current = current.next_node until current.next_node.nil?

    # point current(last node) to our new node
    current.next_node = this_node
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

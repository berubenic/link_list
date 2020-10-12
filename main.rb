# frozen_string_literal: true

class LinkedList
  # setup head ,remmember we traverse a linkedlist from the head
  attr_reader :head, :tail
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

  def at(index)
    return @head if index.zero?

    return unless index.positive?

    current = @head
    index.times do
      current = current.next_node
    end
    current
  end

  def pop
    current = @head
    previous = nil
    until current.next_node.nil?
      previous = current
      current = current.next_node
    end
    @tails = previous
    @tails.next_node = nil
  end

  def contains?(value)
    current = @head
    until current.next_node.nil?
      return true if current.value == value

      current = current.next_node
    end
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
p list.head
p list.tail

p list.at(3)

p list.size

p list.contains?(16)

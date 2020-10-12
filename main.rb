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
    until current.nil?
      return true if current.value == value

      current = current.next_node
    end
    false
  end

  def find(value)
    current = @head
    index = 0
    until current.nil?
      return index if current.value == value

      current = current.next_node
      index += 1
    end
  end

  def to_s
    current = @head
    until current.nil?
      print "(#{current.value}) -> "
      current = current.next_node
    end
    print "nil \n"
  end

  def insert_at(value, index)
    if @head.nil?
      # if list is empty, the head is the new node
      this_node = Node.new(value)
      @head = this_node
    end
    if index == 0
      # if index is 0, we insert in the first position
      this_node = Node.new(value, @head)
      @head = this_node
    end
    if index > 0
      # insert at desired position if index is greater than 0
      ind = index - 1
      current = @head
      before_current = @head

      # loop to the desired position before where you wish to insert
      ind.times do
        before_current = current.next_node
      end
      # loop to the desired position where you wish to insert
      index.times do
        current = current.next_node
      end
      # create a new node you wish to insert
      this_node = Node.new(value)
      after_current = before_current.next_node
      # point node before current to new node
      before_current.next_node = this_node
      # point new node to the old current node
      this_node.next_node = after_current

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

list.append(10)
list.append(25)
list.append(40)
list.to_s
list.insert_at(12, 2)
list.to_s

# frozen_string_literal: true

# LinkedList
class LinkedList
  attr_reader :head, :tail
  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    this_node = Node.new(value)
    if @head.nil?
      @head = @tail = this_node
    else
      @tail.next_node = this_node
      @tail = this_node
    end
  end

  def prepend(value)
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
      this_node = Node.new(value)
      @head = this_node
    end
    if index.zero?
      this_node = Node.new(value, @head)
      @head = this_node
    end
    return unless index.positive?

    current = @head
    before_current = @head

    (index - 1).times do
      before_current = current.next_node
    end
    index.times do
      current = current.next_node
    end
    this_node = Node.new(value)
    after_current = before_current.next_node
    before_current.next_node = this_node
    this_node.next_node = after_current
  end

  def remove_at(index)
    current = @head
    before_current = @head
    @head = current.next_node if index.zero?
    return unless index.positive?

    (index - 1).times do
      before_current = current.next_node
    end
    index.times do
      current = current.next_node
    end
    before_current.next_node = current.next_node
    current.value = nil
  end
end

# Node
class Node
  attr_accessor :value, :next_node

  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

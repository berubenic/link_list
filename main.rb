# frozen_string_literal: true

class LinkedList
  def append(value); end
end

class Node
  attr_accessor :next_node
  attr_reader :value

  def initialize(value = nil)
    @next_node = nil
    @value = value
  end
end

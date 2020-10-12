# frozen_string_literal: true

require_relative 'lib/linked_list'
require_relative 'lib/node'

list = LinkedList.new

list.append(20)
list.append(21)
list.append(22)
list.append(23)

list.prepend(1)
list.prepend(2)
list.prepend(3)
list.prepend(4)

list.to_s

p list.size

p list.at(2).value

list.pop
list.to_s

p list.contains?(21)

p list.find(2)

list.insert_at(50, 4)
list.to_s

list.remove_at(4)
list.to_s

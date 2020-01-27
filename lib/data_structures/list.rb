# frozen_string_literal: true

require_relative './list/node'

module DataStructures
  class List
    attr_reader :first, :depth

    def initialize
      @first = nil
      @first_setted = false
      @depth = 0
    end

    def reverse
      raise "List is empty" unless @first

      @first = reverse_recoursion(@first)
    end

    def append(value)
      if @first
        @depth += 1
        last.next_node = Node.new(value, @depth)
      else
        @first = Node.new(value, @depth)
      end

      self
    end

    def last
      return nil unless @first

      last_node
    end

    def to_a
      return [] unless @first

      array_recoursion
    end

    private

    def reverse_recoursion(current_node = nil)
      current_node.index = @depth - current_node.index

      return current_node unless current_node&.next_node

      next_node = current_node.next_node


      new_head = reverse_recoursion(next_node)

      next_node.next_node = current_node

      current_node.next_node = nil
      
      new_head
    end

    def array_recoursion(node = nil, result = [])
      current_node = node || @first

      result = [*result, current_node.value]

      return result unless current_node.next_node

      array_recoursion(current_node.next_node, result)
    end

    def last_node(node = nil)
      current_node = node || @first

      return current_node unless current_node.next_node

      last_node(current_node.next_node)
    end
  end
end

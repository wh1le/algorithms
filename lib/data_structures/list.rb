# frozen_string_literal: true

require_relative './list/node'

module DataStructures
  class List
    attr_reader :head, :depth

    def initialize
      @head = nil
      @last_setted = nil
      @depth = 0
    end

    def reverse
      raise "List is empty" unless @head

      @head = reverse_recursion(@head)
    end

    def append(value)
      @depth += 1 if @head

      node = Node.new(value, @depth)

      if @head
        @last_setted.next_node = node
      else
        @head = node
      end

      @last_setted = node

      self
    end

    def last_node
      return nil unless @head

      last_node_recursion
    end

    def to_a
      return [] unless @head

      array_recursion
    end

    private

    def reverse_recursion(current_node = nil)
      current_node.index = @depth - current_node.index

      return current_node unless current_node&.next_node

      next_node = current_node.next_node


      new_head = reverse_recursion(next_node)

      next_node.next_node = current_node

      current_node.next_node = nil
      
      new_head
    end

    def array_recursion(node = nil, result = [])
      current_node = node || @head

      result = [*result, current_node.value]

      return result unless current_node.next_node

      array_recursion(current_node.next_node, result)
    end

    def last_node_recursion(node = nil)
      current_node = node || @head

      return current_node unless current_node.next_node

      last_node_recursion(current_node.next_node)
    end
  end
end

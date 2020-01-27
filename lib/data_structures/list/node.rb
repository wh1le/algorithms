# frozen_string_literal: true

module DataStructures
  class List
    class Node
      attr_accessor :value, :index, :next_node

      def initialize(value, index)
        @value = value
        @index = index
        @next_node = next_node
      end
    end
  end
end

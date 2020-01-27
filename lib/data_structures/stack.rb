module DataStructures
  class Stack
    attr_reader :head

    def initialize
      @head = nil
    end

    def push(value)
      new_node = Node.new(value, @head)
      @head = new_node
    end

    def pop
      @head = @head.next_node
    end
  end
end

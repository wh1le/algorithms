# module Operations
#   def insert(index, value)
#     
#   end
#
#   def print
#     current_note = self
#
#     result = []
#
#     while current_note.next_node
#       result.push(current_note.value)
#       current_note = current_note.next_node
#     end
#
#     require 'pry'; binding.pry
#   end
# end



list = List.new
list.append(2)
list.append(4)
p list.to_a

def smt; end

# BUCKETS = 128
#
# table = Array.new(BUCKETS) { 0 }
# letters = Array('a'..'z')
#
# def hash(input)
#   input.to_s.chars.inject(0) { |sum, char| sum + char.ord } % BUCKETS
# end
#
#
# table = Array.new(BUCKETS) { 0 }
# letters = Array('a'..'z')
#
# 10_000.times do
#   input = Array.new(5) { letters.sample }.join
#
#   table[hash(input)] += 1
# end
#
# p table
# hash(2)

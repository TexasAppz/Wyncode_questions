# This method adds two to any number given
def add_two (number)
  if number.respond_to? :+
    if number.respond_to? :push
      number.push 2
    elsif
      number.class == String
      number.to_i + 2
    else
      number + 2
    end
  else
    number = nil
  end
end

def test_add_two
  puts add_two(1) == 3
  puts add_two(1.0) == 3.0
  puts add_two(nil) == nil
  puts add_two({}) == nil
  puts add_two([]) == [2]
  puts add_two(true) == nil
  puts add_two("2") == 4
  puts add_two("hello") == 2
end
p add_two("Hello")
test_add_two

# def find_ten
#   i = 0
#   loop do
#     if i == 10
#       return i
#     end
#     i += 1
#   end
# end
#
# puts find_ten
#
# block = begin
#   puts "Hello world!"
#   0
# end
#
# # puts block
#
# 5.times do|number|
#   puts "Hello #{number}"
# end
#
# [1,2,3,4,5].each do |number|
#   puts "Counted to #{number}..."
# end
#
# (1..5).each do |x|
#   if x.even?
#     p "Even"
#   else
#     p "Odd"
#   end
# end
#
# result = (1..5).map do |num|
#   if num.even?
#     "Even"
#   else
#     "Odd"
#   end
#   end
#
#   p result

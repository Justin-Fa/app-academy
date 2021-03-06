# Write a method, is_sorted(arr), that accepts an array of numbers as an arg.
# The method should return true if the elements are in increasing order, false otherwise.
# Do not use the built-in Array#sort in your solution :)

# def is_sorted(arr)
#   (0..arr.length-2).each do |i|
#     if arr[-1- i] < arr[-2 - i] && -2 - i > -arr.length
#       return false
#     end
#   end
#   true
# end

# Optimized code
# 1
def is_sorted(arr)
  (0...arr.length - 1).each do |i|
    return false if arr[i] > arr[i + 1]
  end
  true
end

# 2
def is_sorted(arr)
  (0...arr.length - 1).all? { |i| arr[i] <= arr[i + 1] }
end

p is_sorted([1, 4, 10, 13, 15])       # => true
p is_sorted([1, 4, 10, 10, 13, 15])   # => true
p is_sorted([1, 2, 5, 3, 4 ])         # => false

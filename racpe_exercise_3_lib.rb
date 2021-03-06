# dupes?
# Write a method no_dupes?(arr) that accepts an array as an arg and returns an 
# new array containing the elements that were not repeated in the array.
def no_dupes?(array)
    hash = Hash.new(0)
    array.each do |ele|
        hash[ele] += 1
    end
    new_array = []
    hash.each do |k, v|
        new_array << k if v == 1
    end
    return new_array
end


# Examples
p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
p no_dupes?([true, true, true])            # => []

# no_consecutive_repeats?
# Write a method no_consecutive_repeats?(arr) that accepts an array as an arg. 
# The method should return true if an element never appears consecutively in the array; 
# it should return false otherwise.



# Examples
no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
no_consecutive_repeats?(['x'])                              # => true
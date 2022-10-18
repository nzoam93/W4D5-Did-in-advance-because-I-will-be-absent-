def bad_two_sum?(arr, target_sum)
    arr.each.with_index do |ele_1, index_1|
        arr.each.with_index do |ele_2, index_2|
            return true if ele_1 + ele_2 == target_sum && index_1 != index_2 #you don't want to check the same index against itself. (like add the same 5+5 == 10, since they are not separate elements)
        end
    end
    return false
end

#two nested loops. So it's O(n^2) time

# arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false

def okay_two_sum?(arr, target_sum)
    sorted_arr = arr.sort
    arr.each do |ele|
        target_num = target_sum - ele #this give you the number you are looking to find
        return true if binary_seach(target_num)
    end
    return false
end

arr = [0, 1, 5, 7]
p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false

#this decreaes the time complexity from O(n^2) previously to O(nlogn)
#since the most time intensive portion was the sorting, which is done in O(nlogn), the overall time complexity is O(nlogn)

def hash_two_sum?(arr, target_sum)
    hash = {}
    arr.each do |ele|
        hash[ele] = ele #sets a key with a value of itself
    end
    hash.each do |k,v|
        return true if hash.has_key?(target_sum - k) #is this the correct implementation?
    end
    return false
end

arr = [0, 2, 4, 7,3]
p hash_two_sum?(arr, 6) # => should be true
p hash_two_sum?(arr, 10) # => should be false

#hash can be implemented from array in O(n) time complexity. Iterating over it can be done in O(n) complexity.
#Total time complexity is O(n)



#have to figure out how to make it not add the 5+5
#should I set the keys and values to be different?
#also, I haven't finished the "okay" method

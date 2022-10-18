def windowed_max_range_phase_one(arr, range)
    current_max_range = nil
    subarrays = []
    differences = []
    (0..(arr.length - range)).each.with_index do |ele, index| #minus range so that it won't index outside of the array
        subarr = arr[index...(index + range)] #subarray is made up of the array[index...index+range]
        subarrays << subarr
    end
    subarrays.each do |subarr| #for each subarray, find the min and max
        min = subarr[0]
        subarr.each do |ele|
            min = ele if ele <= min
        end
        max = subarr[0]
        subarr.each do |ele|
            max = ele if ele >= max
        end
        difference = max - min
        differences << difference
    end
    return differences.max #return the biggest differnce in the differences arr
end

#This is time O(n^2) since I have two nested loops for the subarrays array

#what if we could do the min and max in constant time? Then, we woulnd't need the nested arrays
#and we could do it in O(n) time

#Phase 2. Using queues

class MyQueue
    def initialize
        @store = []
    end
    

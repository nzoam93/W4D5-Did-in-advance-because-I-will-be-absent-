 #bubbleSort function used for sluggish octupus
def bubbleSort(arr)
    for i in 0...arr.length do
        for j in 0...arr.length - 1 - i do
            if arr[j] > arr[j+1]
                # temp = arr[j + 1]
                # arr[j + 1] = arr[j]
                # arr[j] = temp
                arr[j] , arr[j+1] = arr[j+1] , arr[j]
            end
        end
    end
    return arr
end

 def sluggish_octopus(arr) #O(n^2)
    sorted = bubbleSort(arr) #bubbleSort is O(n^2)
    return sorted[-1]
end

#mergeSort function used for dominant octopus
def mergeSort(arr)
    if arr.length < 2
        return arr
    end
    midpoint = arr.length / 2
    left = arr[0...midpoint]
    right = arr[midpoint..arr.length]
    return merge(mergeSort(left),mergeSort(right))
end

def merge(left,right)
    result = []
    left_index = 0
    right_index = 0

    while result.length < left.length + right.length do
        if left[left_index] <= right[right_index]
            result << left[left_index]
            left_index += 1
        else
            result << right[right_index]
            right_index += 1
        end

        if left_index == left.length
            result += right[right_index...right.length]
            break
        elsif right_index == right.length
            result += left[left_index...left.length]
            break
        end
    end
    return result
end

def dominant_octopus(arr) #O(n log n)
    mergeSort(arr) #merge is O(n log n)
    return arr[-1]
end

def clever_octopus(arr) #O(n)
    max_fish = arr[0]
    max_length = arr[0].length
    arr.each do |ele|
        if ele.length > max_length
            max_length = ele.length
            max_fish = ele
        end
    end
    return max_fish
end


arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh','fiiiissshhhhhh']


#Dancing Octopus
def slow_dance(direction, arr) #O(n)
    arr.each.with_index {|ele, i| return i if ele == direction}
end


tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def array_to_hash(arr)
    hash = {}
    arr.each.with_index do |ele, i|
        hash[ele] = i
    end
    return hash
end

#output of the above function is
hash = {"up"=>0, "right-up"=>1, "right"=>2, "right-down"=>3, "down"=>4, "left-down"=>5, "left"=>6, "left-up"=>7}


def constant_dance(direction, hash) #O(1) time. Need a data structure that can access quickly. I created a hash
    return hash[direction]
end

p constant_dance("right-down",hash) #nice! I get the hash method :)

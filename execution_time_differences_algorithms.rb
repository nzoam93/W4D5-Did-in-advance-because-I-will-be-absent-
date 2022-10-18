def my_min_phase_1(list) #O(n^2). 2 nested loops
    list.each do |ele_1|
        list.each do |ele_2|
            if ele_1 > ele_2
                break
            end
            if ele_1 <= ele_2 and ele_2 == list[-1] #it must have reached all the way to the end if this is the case
                return ele_1
            end
        end
    end
end

def my_min_phase_2(list) #O(n). one loop
    min = list[0]
    list.each do |ele|
        min = ele if ele < min
    end
    return min
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min_phase_1(list)  # =>  -5
# p my_min_phase_2(list)  # =>  -5




def largest_contiguous_subsum_phase_1(list)
    sub_arrs = []
    list.each do |ele_1|
        sub_sub_arrs = []
        list.each do |ele_2|
            sub_sub_arrs += [ele_2]
            sub_arrs << sub_sub_arrs
        end
    end
    return sub_arrs
end




list = [5, 3, -7]
p largest_contiguous_subsum_phase_1(list) # => 8

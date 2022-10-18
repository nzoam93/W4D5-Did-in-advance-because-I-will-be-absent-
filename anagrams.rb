def first_anagram?(word_1, word_2)
    anagrams = word_1.split("").permutation(word_1.length).to_a #permutation is O(n!) since it has to create a permutation of each word
    anagrams.map! do |word|
        word.join("")
    end
    return anagrams.include?(word_2)
end

# p first_anagram?("asdjfk","asdfdsaf")
#permutation is O(n!) since it has to create a permutation of each word
#takes a really long time with a big string length since factorial grows so quickly, and there are so many possible permutations

def second_anagram?(word_1,word_2)
    word_2_arr = word_2.split("")
    word_1.each_char do |char|
        word_2_index = word_2_arr.find_index(char) #finds the character from the first word in the second word...
        return false if word_2_index == nil #this means the character wasn't found in the second word so we know it's not an anagram
        word_2_arr.delete_at(word_2_index) #...and deletes it from the second word at the specified index
    end
    return word_2_arr.empty?
    #it's an anagram if the the second word no longer has any extra characters
end

# p second_anagram?("qhaaaewfawefwaefaewfaewfde","heqa")
#O(n^2) time. MUCH faster than before. It can actually handle strings that are like 20 characters long as opposed to the factorial one which never finished

def third_anagram?(word_1,word_2)
    sorted_1 = word_1.split("").sort
    sorted_2 = word_2.split("").sort
    return sorted_1 == sorted_2
end

p third_anagram?("hello","elloh")
#sorting methods are nlogn. It does 2 O(nlogn) calculations, which converts to O(nlogn). Fastest method yet
#it's also very straightforward to understand

def fourth_anagram?(word_1,word_2)
    word_1_hash = Hash.new(0)
    word_2_hash = Hash.new(0)
    word_1.each_char do |char|
        word_1_hash[char] += 1
    end
    word_2.each_char do |char|
        word_2_hash[char] += 1
    end
    return word_1_hash == word_2_hash
end

p fourth_anagram?("hello","elltkoh")


#there are two loops required to convert to hashes. This is O(n) time
#Then, the hashes are checked which is O(n) time too (since each element needs to be checeked)
#overall O(n) time, which is the fastest yet

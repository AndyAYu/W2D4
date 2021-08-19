# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array. 
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]
def all_vowel_pairs(words)#work through the vowel elements.
    vowels = ["a","e","i","o","u"]
    arr = [] # need unique pairs in nested loop
    words.each_with_index do |word_1,idx1|
        words.each_with_index do |word_2,idx2|
            pairs = word_1 + " " + word_2
            if vowels.all? { |vowel| pairs.include?(vowel) } && idx2 > idx1 #all? 
                arr << pairs 
            end
        end
    end 
    arr
end


# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true
# composite?(13)    # => false
def composite?(num)
    (2...num).each do |n|
        if num % n == 0
            return true
        end
    end
    return false 
end


# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
    arr = []
    bigrams.each do |pairs|
        if str.include?(pairs)
            arr << pairs
        end
    end
    arr 
end

class Hash
    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
    #
    # Examples:
    #
    # hash_1 = {x: 7, y: 1, z: 8}
    # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
    #
    # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
    # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
    # hash_2.my_select                            # => {4=>4}
    def my_select(&prc)
        prc ||= Proc.new { |k , v| k == v } # study return value 
        hash = {}
        self.each do |k,v|
            if prc.(k,v)
                hash[k] = v 
            end
        end
        hash
    end
end

class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.
    #
    # Examples:
    #
    # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
    # "cats".substrings(2)  # => ["ca", "at", "ts"]
    def substrings(length = nil)
        arr = []
        (0...self.length).each do |startidx|
            (startidx...self.length).each do |endidx|
                arr << self[startidx..endidx]
            end
        end
        length.nil? ? arr : arr.select { |sub| sub.length == length }
    end


    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.
    #
    # Examples:
    #
    # "apple".caesar_cipher(1)    #=> "bqqmf"
    # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
    # "zebra".caesar_cipher(4)    #=> "difve"
    def caesar_cipher(num)
        alpha = "abcdefghijklmnopqrstuvwxyz"
        word = self.split("")
        new_word = ""
        word.each_with_index do |char,idx|
            old_index = alpha.index(word[idx])
            new_index = old_index + num
            new_char = alpha[new_index % 26]
            new_word += new_char
        end
        return new_word
    end

end
=begin
Given a string, find the length of the longest substring without repeating characters.

Example 1:

Input: "abcabcbb"
Output: 3 
Explanation: The answer is "abc", with the length of 3. 

Example 2:

Input: "bbbbb"
Output: 1
Explanation: The answer is "b", with the length of 1.

Example 3:

Input: "pwwkew"
Output: 3
Explanation: The answer is "wke", with the length of 3. 
=end

=begin
input: string
return: integer

Approach:
  set max_len to 0
  set sz to str.size

  - iterate i from 0 to sz - 1
   - iterate j from i + max_len to sz - 1
    - substr = str.slice(i, j - i + 1)
    - if no_rep(sub_str)
        max_len = substr.size
      else
        break
      end
    end
  end

  -return max_len
=end

# brute force
def length_of_longest_substring(str)
  max_len = 0
  sz = str.size
  (0...sz).each do |i|
    ((i + max_len)...sz).each do |j|
      substr = str.slice(i, j - i + 1)
      no_rep(substr) ? max_len = j - i + 1 : break
    end
  end
  max_len
end

def no_rep(str)
  str.chars.uniq.size == str.size
end

# p length_of_longest_substring("abcabcbb") # 3
# p length_of_longest_substring("bbbbb")    # 1
# p length_of_longest_substring("pwwkew")   # 3


# sliding window
def length_of_longest_substring(str)
  max_len = 0
  sz = str.size
  i = 0
  j = 0
  hash = Hash.new(0)

  while j < sz do
    if hash[str[j]] == 0
      hash[str[j]] = 1
      j += 1
      max_len = [max_len, j - i].max
    else
      i += 1
      j = i
      hash = Hash.new(0)
    end
  end

  max_len
end


p length_of_longest_substring("abcabcbb") # 3
p length_of_longest_substring("bbbbb")    # 1
p length_of_longest_substring("pwwkew")   # 3
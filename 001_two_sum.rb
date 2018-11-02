=begin
Given an array of integers, return indices of the two numbers such that they add up to a specific target.

You may assume that each input would have exactly one solution, and you may not use the same element twice.

Example:

Given nums = [2, 7, 11, 15], target = 9,

Because nums[0] + nums[1] = 2 + 7 = 9,
return [0, 1].
=end

=begin
arguments: array of integers, a target integer
return: indices of arra elements that sum to the target

algorithm:
  - N^2 performance:
    - iterate through the array
      - for each element (elm) at index (i):
        - search the arr.slice(i, arr.size) for (target - elm)
          - if found, return (i, j)

  - N * log(N) performance:
    - sort the array nums (arr)
    - set indices i and j to 0 and arr.size - 1
    - while i < j:
      - case arr[i] + arr[j] <=> target
        - when -1 : increment i
        - when +1 : decrement j
        - when 0  : break
    - end
    - find the indices of arr[i], arr[j] in the original array
      - first index and last index for the special case of arr[i] == arr[j]
    - return [m, n]
=end

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}

def two_sum(nums, target)
  i = 0
  j = nums.size - 1
  arr = nums.sort

  while i < j do
    case arr[i] + arr[j] <=> target
      when -1 then i += 1
      when 1  then j -= 1
      when 0 then break
    end
  end
  
  [nums.index(arr[i]), nums.rindex(arr[j])]
end

p two_sum([2, 7, 11, 15], 9) # [0, 1]
p two_sum([3, 3], 6) # [0, 1]
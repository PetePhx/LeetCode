=begin
You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.

You may assume the two numbers do not contain any leading zero, except the number 0 itself.

Example:

Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
Output: 7 -> 0 -> 8
Explanation: 342 + 465 = 807.
=end

=begin
Approach
  - inputs: two linked lists, each digits of an integer in reverse order 
    (l1, l2)
  - output: a linked list, the digits of the sum (in reverse)
    (l_sum)

  - algorithm:
    - initialize l_sum to ListNode.new(0)
    - set l_cur to l_sum
    - set carry to 0
    - loop: while l1 && l2
        l_cur.val = (l1.val + l2.val + carry) % 10
        carry = (l1.val + l2.val + carry) / 10
        l1 = l1.next
        l2 = l2.next
        l_cur.next = ListNode.new(0)
        l_cur = l_cur.next
      end     
    - if l1 || l2
        l3 = l1 ? l1 : l2
        while l3
          l_cur.val = (l3.val + carry) % 10
          carry = (l3.val + carry) / 10
          l3 = l3.next
          l_cur.next = ListNode.new(0)
          l_cur = l_cur.next
        end
    - if carry > 0
        l_cur.next = ListNode.new(carry)
      end
    return l_sum
=end

class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

def add_two_numbers(l1, l2)
  l_sum = ListNode.new(0) # output linked list
  l_cur = l_sum           # the current node
  carry = 0

  # summing digit-wise until one of the linked lists is exhausted
  loop do
    break if !l1 || !l2
    l_cur.val = (l1.val + l2.val + carry) % 10
    carry = (l1.val + l2.val + carry) / 10
    l1 = l1.next
    l2 = l2.next
    (l_cur.next = ListNode.new(0)) && (l_cur = l_cur.next) if l1 || l2 || (carry > 0)
  end

  # the remaining linked-list
  l3 = l1 ? l1 : l2
  while l3 do
    l_cur.val = (l3.val + carry) % 10
    carry = (l3.val + carry) / 10
    l3 = l3.next
    (l_cur.next = ListNode.new(carry)) && (l_cur = l_cur.next) if l3 || (carry > 0)
  end

  l_cur.val = carry if carry > 0
  
  return l_sum
end

l1 = ListNode.new(2)
l1.next = ListNode.new(4)
l1.next.next = ListNode.new(3)

l2 = ListNode.new(5)
l2.next = ListNode.new(6)
l2.next.next = ListNode.new(4)

l_sum = add_two_numbers(l1, l2)
p [l_sum.val, l_sum.next.val, l_sum.next.next.val, l_sum.next.next.next] # [7, 0, 8, nil]

l1 = ListNode.new(9)
l1.next = ListNode.new(9)

l2 = ListNode.new(9)
l2.next = ListNode.new(9)

l_sum = add_two_numbers(l1, l2)
p [l_sum.val, l_sum.next.val, l_sum.next.next.val, l_sum.next.next.next] # [8, 9, 1, nil]


l1 = ListNode.new(9)
l1.next = ListNode.new(9)
l1.next.next = ListNode.new(9)

l2 = ListNode.new(1)

l_sum = add_two_numbers(l1, l2)
p [l_sum.val, l_sum.next.val, l_sum.next.next.val, l_sum.next.next.next.val] # [0, 0, 0, 1]

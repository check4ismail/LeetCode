import Foundation

/// You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.
/// You may assume the two numbers do not contain any leading zero, except the number 0 itself.
/// Example 1:
/// - Input: l1 = [2,4,3], l2 = [5,6,4]
/// - Output: [7,0,8]
/// - Explanation: 342 + 465 = 807.
///
/// Example 2:
/// - Input: l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
/// - Output: [8,9,9,9,0,0,0,1]
public class AddTwoNums {
	/// LeetCode coding challenge to add numbers from two LinkedLists. Time complexity: O(n), Space complexity: O(1).
	/// - Parameters:
	///   - l1: LinkedList head node from list 1
	///   - l2: LinkedList head node from list 2
	/// - Returns: Returns head of new `ListNode` to contains each digit for sum of numbers between `l1` and `l2`.
	static func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
		func getNum(_ node: ListNode?) -> Decimal {
			var current = node
			
			/// Collect all digits in a str
			var num = ""
			while current != nil {
				num += "\(current!.val)"
				current = current?.next
			}
			
			/// Reverse str then return as a Decimal to accomadate a large number size beyond Int64
			return Decimal(string: String(num.reversed())) ?? 0
		}
		
		/// Add 2 numbers
		let sum = getNum(l1) + getNum(l2)
		
		/// Fetch `String` value of `sum`
		let strSum = sum.description
		
		/// Reverse the `strSum`
		var strSumReversed = String(strSum.reversed())
		
		/// Add each digit to LinkedList node.
		var newNode = ListNode(strSumReversed.removeLast().wholeNumberValue ?? 0)
		
		while !strSumReversed.isEmpty {
			newNode = ListNode(strSumReversed.removeLast().wholeNumberValue ?? 0, newNode)
		}
		
		return newNode
	}
	
	public static func test() {
		var l1 = ListNode(3)
		l1 = ListNode(4, l1)
		l1 = ListNode(2, l1)
		
		var l2 = ListNode(4)
		l2 = ListNode(6, l2)
		l2 = ListNode(5, l2)
		
		print(addTwoNumbers(l1, l2))
	}
}

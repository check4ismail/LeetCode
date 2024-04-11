import Foundation

/// Given a 1-indexed array of integers numbers that is already sorted in non-decreasing order, find two numbers such that they add up to a specific target number. Let these two numbers be numbers[index1] and numbers[index2] where 1 <= index1 < index2 <= numbers.length.
/// Return the indices of the two numbers, index1 and index2, added by one as an integer array [index1, index2] of length 2.
/// The tests are generated such that there is exactly one solution. You may not use the same element twice.
/// Your solution must use only constant extra space.
public class TwoSum {
	
	/// The following statement sorted in non-decreasing order typically hints at using binary search to efficiently solve this problem. Hence, here's the approach:
	/// - Set up outer loop to loop through indices from `0..<numbers.count - 1` since we want to exclude using the last index
	/// - Set up the left value as the `i + 1`
	/// - Set up the right value as the `numbers.count - 1`
	/// - Create an inner loop to perform binary search for a number that sums up to target. If found, return the array
	/// - Time Complexity: O(n log(n))
	/// - Space Complexity: O(1)
	/// - Parameters:
	///   - numbers: Represents list of numbers
	///   - target: Represents target number
	/// - Returns: Returns 2 indices who's numbers add up to `target` number.
	public func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
		for i in 0..<numbers.count - 1 {
			let leftVal = numbers[i]
			
			var left = i + 1
			var right = numbers.count - 1
			
			while left <= right {
				let middleIndex = (left + right) / 2
				let middleVal = numbers[middleIndex]
				let sum = leftVal + middleVal
				
				if sum == target {
					return [i + 1, middleIndex + 1]
				} else if sum < target {
					left = middleIndex + 1
				} else {
					right = middleIndex - 1
				}
			}
		}
		
		return []
	}
	
	public static func test() {
		let obj = TwoSum()
		print("Input: [2,7,11,15], with target 9")
		print("Output: \(obj.twoSum([2,7,11,15], 9))\n")
		
		print("Input: [2,3,4], with target 6")
		print("Output: \(obj.twoSum([2,7,11,15], 9))\n")
	}
}

import Foundation

/// The median is the middle value in an ordered integer list. If the size of the list is even, there is no middle value, and the median is the mean of the two middle values.
/// For example, for arr = [2,3,4], the median is 3.
/// For example, for arr = [2,3], the median is (2 + 3) / 2 = 2.5.
/// - Implement the MedianFinder class:
/// - MedianFinder() initializes the MedianFinder object.
/// - void addNum(int num) adds the integer num from the data stream to the data structure.
/// - double findMedian() returns the median of all elements so far. Answers within 10-5 of the actual answer will be accepted.
public class MedianFinder {
	private var nums: [Int]

	public init() {
		nums = []
	}
	
	/// Add new number to list while maintaining sort order efficiently
	/// Time complexity: O(n), Space complexity: O(n)
	public func addNum(_ num: Int) {
		guard let firstIndex = nums.firstIndex(where: { $0 > num }) else {
			nums.insert(num, at: firstIndex)
		} else {
			nums.append(num)
		}
	}
	
	/// Calculate median of number list. Time complexity: O(1).
	/// - Returns: Median of number list.
	public func findMedian() -> Double {
		let middle = nums.count / 2
		guard nums.count % 2 == 0 else {
			return Double(nums[middle])
		}

		return Double(nums[middle] + nums[middle - 1]) / 2.0
	}
}

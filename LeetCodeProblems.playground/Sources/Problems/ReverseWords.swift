import Foundation

public struct ReverseWords {
	
	/// Given an input string s, reverse the order of the words.
	/// A word is defined as a sequence of non-space characters. The words in s will be separated by at least one space.
	/// Return a string of the words in reverse order concatenated by a single space.
	/// Note that s may contain leading or trailing spaces or multiple spaces between two words. The returned string should only have a single space separating the words. Do not include any extra spaces.
	/// Time Complexity: O(n), Space Complexity: O(n)
	private static func reverseWords(_ s: String) -> String {
		s.split(separator: " ")
			.reversed()
			.joined(separator: " ")
	}
	
	public static func test() {
		print("'the sky is blue' -> '\(reverseWords("the sky is blue"))'")
		print("'  hello world  ' -> '\(reverseWords("  hello world  "))'")
		print("'a good   example' -> '\(reverseWords("a good   example"))'")
	}
}

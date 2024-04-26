import Foundation

public struct Anagram {
	/// Given two strings s and t, return true if t is an anagram of s, and false otherwise.

	/// An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.
	/// Time complexity solution: O(n)
	/// Space complexity solution: O(n)
	private static func isAnagram(_ s: String, _ t: String) -> Bool {
		let sMap = toCharMap(s)
		let tMap = toCharMap(t)
		
		func toCharMap(_ word: String) -> [Character: Int] {
			word.reduce(into: [:]) { result, char in
				result[char, default: 0] += 1
			}
		}
		
		return sMap == tMap
	}
	
	
	public static func test() {
		print("s = \"anagram\", t = \"nagaram\": \(isAnagram("anagram", "nagaram"))")
		print("s = \"rat\", t = \"car\": \(isAnagram("rat", "car"))")
	}
}

import Foundation

public struct CourseSchedule {
	/// There are a total of numCourses courses you have to take, labeled from 0 to numCourses - 1. You are given an array prerequisites where prerequisites[i] = [a, b] indicates that you must take course b first if you want to take course a. For example, the pair [0, 1], indicates that to take course 0 you have to first take course 1.
	/// 
	/// Solution Time Complexity: O(n),
	/// Solution Space Complexity: O(n)
	/// - Parameters:
	///   - numCourses: Represents total course count.
	///   - prerequisites: Represents list of courses with corresponding prerequisites.
	/// - Returns: Return true if you can finish all courses. Otherwise, return false.
	private static func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
		/// Cache for memoization.
		var courseMapCache: [Int: Bool] = [:]
		
		/// Convert prequisites into adjacency-list like mapping, where each course key has a list of prerequisites.
		let courseMap = prerequisites.reduce(into: [Int: [Int]]()) { result, key in
			result[key[0], default: []].append(key[1])
		}
		
		
		/// Deep validation of course map to determine if all courses can be taken or not. If course repeats itself while checking
		/// adjacency list, this would indicate a cycle which means it's not possible to take all courses.
		/// - Parameters:
		///   - prereqs: Prequisite courses
		///   - set: Set to keep track of courses traversed.
		/// - Returns: Returns bool indicating if all courses can be taken or not.
		func courseMapIsValid(_ prereqs: [Int], _ set: Set<Int>) -> Bool {
			for prereq in prereqs {
				var set = set
				
				/// Return false if course exists.
				guard !set.contains(prereq) else { return false }
				set.insert(prereq)
				
				/// If current course has no prereqs, move onto next course.
				guard let subPrereqs = courseMap[prereq] else { continue }
				
				if courseMapCache[prereq] == nil {
					/// Store value to prevent repeated recursion.
					courseMapCache[prereq] = courseMapIsValid(subPrereqs, set)
				}
				
				guard courseMapCache[prereq] == true else {
					return false
				}
			}
			
			return true
		}
		
		/// Validate that all prereqs are validate for each course.
		for (_, prereqs) in courseMap {
			guard courseMapIsValid(prereqs, []) else {
				return false
			}
		}
		
		return true
	}
	
	public static func test() {
		print("Num courses: \(8), Prerequisites: \([[1,0],[2,6],[1,7],[6,4],[7,0],[0,5]])")
		print("Can finish all courses: \(canFinish(8, [[1,0],[2,6],[1,7],[6,4],[7,0],[0,5]]))\n")
		
		print("Num courses: \(2), Prerequisites: \([[1,0]])")
		print("Can finish all courses: \(canFinish(2, [[1,0]]))\n")
		
		print("Num courses: \(2), Prerequisites: \([[1,0],[0,1]])")
		print("Can finish all courses: \(canFinish(2, [[1,0],[0,1]]))")
	}
}

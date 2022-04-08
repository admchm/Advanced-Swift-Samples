import UIKit

/* Arrays and Mutability */
let fibs = [0, 1, 1, 2, 3, 5]
// fibs.append(8) - illegal, fib isn't mutable

var mutableFibs = [0, 1, 1, 2, 3, 5]
mutableFibs.append(contentsOf: [8, 13])

let a = NSMutableArray(array: [1, 2, 3])
// I don't want to be able to mutate b
let b: NSArray = a
// But it can still be mutated - via a
a.insert(4, at: 3)
b // [1, 2, 3, 4]

// correct way - creating a copy upon assignment
let c = NSMutableArray(array: [1, 2, 3])
// I don't want to be able to mutate d.
let d: NSArray = c.copy() as! NSArray
c.insert(5, at: 3)
d // [1, 2, 3]

/* Array Indexing */
var nums = [10, 20, 30, 40]
// Want to iterate over array?
for x in nums {
    x //print(x)
}
// Want to iterate over all but the first element of an array?
for x in nums.dropFirst() {
    x // print(x)
}
// Want to iterate over all but the last five elements?
for x in nums.dropLast(1) {
    x // print(x)
}
// Want to number all the elements in an array?
for (num, element) in nums.enumerated() {
    num
    element
    // print(num, element)
}
// Want to find the location of a specific element?
// Want to transform all the elements in an array?
// Want to fetch only the elements matching a specific criterion?

/* Transforming Arrays */

var squared: [Int] = []
for fib in fibs {
    squared.append(fib * fib)
}
// squared //

// map
/*
 * “you see map, and you immediately know what’s happening: a function is going to be applied to every
 * element”
 * Excerpt From: Chris Eidhof. “Advanced Swift”.
 */

let squares = fibs.map { fib in fib * fib }
// squares //

extension Array {
    func map<T>(_ transform: (Element) -> T) -> [T] {
        var result: [T] = []
        result.reserveCapacity(count)
        for x in self {
            result.append(transform(x))
        }
        return result
    }
}


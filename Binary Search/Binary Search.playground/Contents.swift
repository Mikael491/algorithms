import Foundation

/*
 Binary Search
 - caveat is that this only works for an already sorted array
 
    1. Split the array in half and determine whether the thing you're looking for, known as the search key, is in the left half or in the right half.
 
    2. How do you determine in which half the search key is? This is why you sorted the array first, so you can do a simple < or > comparison.
 
    3. If the search key is in the left half, you repeat the process there: split the left half into two even smaller pieces and look in which piece the search key must lie. (Likewise for when it's the right half.)
 
    4. This repeats until the search key is found. If the array cannot be split up any further, you must regrettably conclude that the search key is not present in the array.
 */


//======Binary Search (Recursive)=======

func BinarySearch <T: Comparable>(_ array: [T], itemToFind: T, range: Range<Int>) -> Int? {
    if range.lowerBound >= range.upperBound {
        return nil
    } else {
        let midIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2
        
        if array[midIndex] > itemToFind {
            return BinarySearch(array, itemToFind: itemToFind, range: 0..<midIndex)
        } else if array[midIndex] < itemToFind {
            return BinarySearch(array, itemToFind: itemToFind, range: midIndex + 1..<range.upperBound)
        } else {
            return midIndex
        }
    }
}

let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20].sorted()
BinarySearch(numbers, itemToFind: 12, range: 0..<numbers.count)

//======Binary Search (Iterative)=======

func BinarySearch<T: Comparable>(_ array: [T], itemToFind: T) -> Int? {

    var lower = 0
    var upper = array.count
    
    while lower < upper {
        let midIndex = lower + (upper - lower) / 2
        if array[midIndex] == itemToFind {
            return midIndex
        } else if array[midIndex] > itemToFind {
            upper = midIndex
        } else if array[midIndex] < itemToFind {
            lower = midIndex + 1
        }
    }
    return nil
}

BinarySearch(numbers, itemToFind: 12)



































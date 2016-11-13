import Foundation

//INSERTION SORT, runtime = O(n^2)

func insertionSort(_ array: [Int]) -> [Int] {
    var array = array
    
    for x in 1..<array.count {
        var y = x
        while y > 0 && array[y] < array[y - 1] {
            swap(&array[y - 1], &array[y])
            y -= 1
        }
    }
    return array
}

let list = [ 10, -1, 3, 9, 2, 27, 8, 5, 1, 3, 0, 26 ]
//insertionSort(list)

/*
 The above example sort the given array in place
 We can make it a bit faster by getting rid of swap function:
 */
func insertionSort2(_ array: [Int]) -> [Int] {
    
    var array = array
    
    for x in 1..<array.count {
        var y = x
        let temp = array[y]
        while y > 0 && temp < array[y - 1] {
            array[y] = array[y - 1]
            y -= 1
        }
        array[y] = temp
    }
    return array
}

//insertionSort2(list)

/*
 This can be made generaic with a closure allowing user of function to decide how to sort (low - high, high - low) to account for any type entered (same as how swifts array sort function is implemented):
 */

func insertionSort3<T>(_ array: [T], isOrderedBy: (T, T) -> Bool) -> [T] {
    
    var array = array
    
    for x in 1..<array.count {
        var y = x
        let temp = array[y]
        while y > 0 && isOrderedBy(temp, array[y - 1]) {
            array[y] = array[y - 1]
            y -= 1
        }
        array[y] = temp
    }
    return array
}

insertionSort3(list, isOrderedBy: <)



/* 
 Insertion sort works well with arrays short in length and already sorted arrays but starts to lag when size of array becomes very large numbers.
 */




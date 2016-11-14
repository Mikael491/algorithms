import Foundation
//==========|
//MERGE SORT|: runtime (best, average, worst) O(n*log(n))
//==========|


//Helper function to make array filled with random numbers
func makeArray() -> [Int] {
    
    let randomNumber = Int(arc4random_uniform(100))
    var array = [Int]()
    for _ in 0..<randomNumber {
        array.append(Int(arc4random_uniform(100)))
    }
    return array
}

//========Top-Down Implementation==========

func mergeSort(_ array: [Int]) -> [Int] {
    
    guard array.count > 1 else { return array }
    //If the array is empty or only contains a single element, there's no way to split it into smaller pieces. You'll just return the array.
    
    let middleIndex = array.count / 2
    //Find the middle index.
    
    let leftArray = mergeSort(Array(array[0..<middleIndex]))
    //Using the middle index from the previous step, recursively split the left side of the array.
    
    let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
    //Also recursively split the right side of the array.
    
    return merge(leftPile: leftArray, rightPile: rightArray)
    //Finally, merge all the values together, making sure that it's always sorted.
}

func merge(leftPile: [Int], rightPile: [Int]) -> [Int] {
    
    var leftIndex = 0
    var rightIndex = 0
    
    var orderedArray = [Int]()
    
    while leftIndex < leftPile.count && rightIndex < rightPile.count {
        if leftPile[leftIndex] < rightPile[rightIndex] {
            orderedArray.append(leftPile[leftIndex])
            leftIndex += 1
        } else if leftPile[leftIndex] > rightPile[rightIndex] {
            orderedArray.append(rightPile[rightIndex])
            rightIndex += 1
        } else {
            orderedArray.append(leftPile[leftIndex])
            leftIndex += 1
            orderedArray.append(rightPile[rightIndex])
            rightIndex += 1
        }
    }
    
    
    while leftIndex < leftPile.count {
        orderedArray.append(leftPile[leftIndex])
        leftIndex += 1
    }
    
    while rightIndex < rightPile.count {
        orderedArray.append(rightPile[rightIndex])
        rightIndex += 1
    }
    
    return orderedArray

}



print(mergeSort(makeArray()))




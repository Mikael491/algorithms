import Foundation

indirect public enum BinaryTree<T> {
    case Node(BinaryTree<T>, T, BinaryTree<T>)
    case Empty
}

let node2 = BinaryTree.Node(.Empty, 2, .Empty)
let node12 = BinaryTree.Node(.Empty, 12, .Empty)
let node1 = BinaryTree.Node(.Empty, 1, .Empty)
let node3 = BinaryTree.Node(.Empty, 3, .Empty)
let node11 = BinaryTree.Node(node3, 11, .Empty)
let node7 = BinaryTree.Node(node1, 7, node12)
let node9 = BinaryTree.Node(.Empty, 9, .Empty)
let node5 = BinaryTree.Node(node9, 5, node7)
let node4 = BinaryTree.Node(.Empty, 4, node11)
let node8 = BinaryTree.Node(node5, 8, node4)


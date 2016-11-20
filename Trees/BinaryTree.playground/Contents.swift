import Foundation

indirect public enum BinaryTree<T> {
    case Node(BinaryTree<T>, T, BinaryTree<T>)
    case Empty
    
}

extension BinaryTree {
    public var count : Int {
        switch self {
        case let .Node(left, _, right):
            return left.count + 1 + right.count
        case .Empty:
            return 0
        }
    }
    
    //TODO: In-Order (depth first) Search
    func traverseInOrder(process: (T) -> Void) {
        if case let .Node(left, value, right) = self {
            left.traverseInOrder(process: process)
            process(value)
            right.traverseInOrder(process: process)
        }
    }
    
    //TODO: PreOrder Search
    func traversePreOrder(process: (T) -> Void) {
        if case let .Node(left, value, right) = self {
            left.traversePreOrder(process: process)
            right.traversePreOrder(process: process)
            process(value)
        }
    }
    
    //TODO: PostOrder Search
    func traversePostOrder(process: (T) -> Void) {
        if case let .Node(left, value, right) = self {
            process(value)
            left.traversePostOrder(process: process)
            right.traversePostOrder(process: process)
        }
    }
}

let node2 = BinaryTree.Node(.Empty, 2, .Empty)
let node12 = BinaryTree.Node(node2, 12, .Empty)
let node1 = BinaryTree.Node(.Empty, 1, .Empty)
let node3 = BinaryTree.Node(.Empty, 3, .Empty)
let node11 = BinaryTree.Node(node3, 11, .Empty)
let node7 = BinaryTree.Node(node1, 7, node12)
let node9 = BinaryTree.Node(.Empty, 9, .Empty)
let node5 = BinaryTree.Node(node9, 5, node7)
let node4 = BinaryTree.Node(.Empty, 4, node11)
let node8 = BinaryTree.Node(node5, 8, node4)



node5.traverseInOrder { (int) in
    print(int)
}








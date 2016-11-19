import Foundation

indirect public enum BinaryTree<T> {
    case Node(BinaryTree<T>, T, BinaryTree<T>)
    case Empty
}
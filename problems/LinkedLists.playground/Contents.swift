import Foundation

class ListNode<T> {
    var value: T
    var next: ListNode?
    weak var previous: ListNode?
    init(value: T) {
        self.value = value
    }
}

class LinkedList<T> {
    public typealias Node = ListNode<T>
    private var head : Node?
}

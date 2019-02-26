
public class LinkedListNode<T> {
    var value: T
    var next: LinkedListNode?
    init(value: T) {
        self.value = value
    }
}

public class LinkedList<T> {
    public typealias Node = LinkedListNode<T>
    var head: Node?
    
    func isEmpty() -> Bool {
        return head == nil
    }
    
    func last() -> Node? {
        guard var node = head else {return nil}
        while let next = node.next {
            node = next
        }
        return node
    }
    
    func count() -> Int {
        guard var node = head else {return 0}
        var count = 0
        while let next = node.next {
            count = count + 1
            node = next
        }
        return count
    }
    
    
    func node(index: Int) -> Node? {
         var index = index
         guard var node = head else {return nil}
         while let next = node.next {
            index = index - 1
            if index < 0 {return node}
            node = next
        }
        return nil
    }
    
    func append(node: Node) {
        guard let last = last() else {
            head = node
            return
        }
        last.next = node
    }
    
    func reciprocal(number: Int) -> Node? {
        //倒数第K
        if number > self.count() {return nil}
        guard let head = head else {return nil}
        var first = head
        var second = head
        let node_k = self.node(index: number)
        while let firstNext = node_k?.next {
            second = second.next
        }
        return second
    }
    
}



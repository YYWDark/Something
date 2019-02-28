
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
        var count = 1
        while let next = node.next {
            count = count + 1
            node = next
        }
        return count
    }
    
    
    func node(index: Int) -> Node? {
        guard var node = head else {return nil}
        var i = 0
        for i in 0..<index {
            if let next = node.next {
                node = next
            } else {
                return nil
            }
        }
        return node
    }
    
    func append(node: Node?) {
        guard let last = last() else {
            head = node
            return
        }
        last.next = node
    }
    
    func print() {
        guard var node = head else {return}
        while let next = node.next {
            Swift.print(next.value)
            node = next
        }
    }
    
    func reciprocal(index: Int) -> Node? {
        //倒数第K
        if index >= self.count() {return nil}
        guard let head = head else {return nil}
        var second = head
        var node_k = self.node(index: index)
        while let firstNext = node_k?.next {
            node_k = firstNext
            second = second.next!
        }
        return second
    }
    
    func reversal() -> LinkedList? {
        guard var node = head else {return nil}

        var reversal: Node? = nil
        while true {
            if let next = node.next {
                node.next = reversal
                reversal = node
                node = next
            } else {
                node.next = reversal
                reversal = node
                let list = LinkedList()
                list.append(node: reversal)
                return list
            }
          
        }
        return nil
    }
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        var s = "["
        var node = head
        while node != nil {
            s += "\(node!.value)"
            node = node!.next
            if node != nil { s += ", " }
        }
        return s + "]"
    }
}

extension LinkedListNode: CustomStringConvertible {
    public var description: String {
        return "[" + "\(self.value)" + "]"
    }
}

let list = LinkedList<String>()
list.append(node: LinkedListNode.init(value: "1"))
list.append(node: LinkedListNode.init(value: "2"))
list.append(node: LinkedListNode.init(value: "3"))
list.append(node: LinkedListNode.init(value: "4"))
list.append(node: LinkedListNode.init(value: "5"))
list.append(node: LinkedListNode.init(value: "6"))
list.print()
print(list.count())
list.reciprocal(index: 0)
print(list.reciprocal(index: 0))
print(list.reciprocal(index: 1))
print(list.reciprocal(index: 5))
print(list.reciprocal(index: 6))
print(list.reciprocal(index: 7))
list.node(index: 0)
list.node(index: 1)
list.node(index: 2)
list.node(index: 3)
list.node(index: 4)
list.node(index: 5)
list.node(index: 6)
list.reversal()





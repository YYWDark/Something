import UIKit
import Foundation

class Stack {
    var container:[Int] = []
    func pop() -> Int {
      return container.removeLast()
    }
    
    func push(value: Int){
       container.append(value)
    }
    
    func count() -> Int {
        return container.count
    }
}

class Queue {
    private var stack1 = Stack()
    private var stack2 = Stack()
    func queueIn(value:Int) {
         stack1.push(value: value)
    }
    
    func queueOut() -> Int{
        if stack2.count() != 0 {
           let value = stack2.pop()
           return value
        } else {
            var count = stack1.count()
            while count > 0  {
                let value = stack1.pop()
                stack2.push(value: value)
                count = count - 1
            }
            let value = stack2.pop()
            return value
        }
    }
    
    func inMore(values: [Int]) {
        for value in values {
            stack1.push(value: value)
        }
    }
    
}

let queue = Queue()
queue.inMore(values: [1,2,3,4,5,6])
let number1 = queue.queueOut()
let number2 = queue.queueOut()
let number3 = queue.queueOut()
queue.inMore(values: [7,8,9])
let number4 = queue.queueOut()
let number5 = queue.queueOut()
let number6 = queue.queueOut()
let number7 = queue.queueOut()
let number8 = queue.queueOut()
let number9 = queue.queueOut()

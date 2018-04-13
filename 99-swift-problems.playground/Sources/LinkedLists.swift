/*
 Section rules:
 
 - Individual methods or computed properties will be added to the List<T> class as extensions to solve each problem.
 - Consider instances of List as immutable. All methods should return new instances of linked lists (instead of modifying the current list).
 - Using sequence types from the Swift Standard Library, like Array or Set is not allowed.
 */

// IMMUTABLE
public class List<T> {
    public var value: T
    public var nextItem: List<T>?
    
    public convenience init?(_ values: T...) {
        self.init(Array(values))
    }
    
    public init?(_ values: [T]) {
        guard let first = values.first else {
            return nil
        }
        value = first
        nextItem = List(Array(values.suffix(from: 1)))
    }
}

extension List {
    public var description: String {
        var buffer: [String] = []
        var current: List? = self
        //        buffer.append(String(describing: value))
        while current != nil {
            buffer.append(String(describing: current!.value))
            current = current!.nextItem
        }
        return "[" + buffer.joined(separator: ", ") + "]"
    }
}

// P01 (*) Find the last element of a linked list.
extension List {
    public var last: T {
        return nextItem?.last ?? value
    }
}

// P02 (*) Find the last but one element of a linked list.
extension List {
    public var penultimate: T? {
        guard let next = nextItem else { return nil }
        return next.penultimate ?? value
    }
}

// P03 (*) Find the Kth element of a linked list
extension List {
    public subscript(index: Int) -> T? {
        return index == 0 ? value : nextItem?[index-1]
    }
}

// P04 (*) Find the number of elements of a linked list.
extension List {
    public var length: Int {
        return 1 + (nextItem?.length ?? 0)
    }
}

// P05 (*) Reverse a linked list.
extension List {
    public func reverse() -> List {
        var immutableHead = self
        var current = List(value)!
        while immutableHead.nextItem != nil {
            immutableHead = immutableHead.nextItem!
            let newHead = List(immutableHead.value)!
            newHead.nextItem = current
            current = newHead
        }
        return current
    }
}

//P06 (*) Find out whether a linked list is a palindrome.
extension List where T:Equatable {
    public func isPalindrome() -> Bool {
        var original = self
        var reversed = self.reverse()
        guard original.value == reversed.value else { return false }
        while let nextOriginal = original.nextItem, let nextReversed = reversed.nextItem {
            original = nextOriginal
            reversed = nextReversed
            guard original.value == reversed.value else { return false }
        }
        return true
    }
}

//P07 (**) Flatten a nested linked list structure.
extension List {

    private var lastNode: List {
        return nextItem?.lastNode ?? self
    }

    public func flatten() -> List {
        var newHead = List(self.value)!
        var newTail = newHead
        var iterator = self
        if let listValue = newHead.value as? List {
            newHead = listValue.flatten()
            newTail = newHead.lastNode
        }
        while let next = iterator.nextItem {
            if let listValue = next.value as? List {
                newTail.nextItem = listValue.flatten()
                newTail = newTail.lastNode
            } else {
                let node = List(next.value)!
                newTail.nextItem = node
                newTail = newTail.nextItem!
            }
            iterator = next
        }
        return newHead
    }
}

//P08 (**) Eliminate consecutive duplicates of linked list elements.
extension List where T: Equatable {
    public func compress() -> List {
        let first = List(self.value)!
        var last = first
        var iterator = self
        while let next = iterator.nextItem {
            if next.value != last.value {
                let newNode = List(next.value)!
                last.nextItem = newNode
                last = newNode
            }
            iterator = next
        }
        return first
    }
}

//P09 (**) Pack consecutive duplicates of linked list elements into sub linked lists.
extension List where T: Equatable {
    public func pack() -> List<List<T>> {
        
        var iterator = self as List?
        var packHead : List!
        var packTail : List!
        var result : List<List>!
        var resultTail : List<List<T>>!
        
        while let value = iterator?.value {
            let node = List(value)!
            if value != packTail?.value {
                packHead = node
                packTail = packHead
                if result == nil {
                    result = List<List<T>>(packHead)!
                    resultTail = result
                } else {
                    resultTail.nextItem = List<List<T>>(packHead)!
                    resultTail = resultTail.nextItem!
                }
            } else {
                packTail.nextItem = node
                packTail = node
            }
            iterator = iterator?.nextItem
        }
        return result
    }
}

//P10 (*) Run-length encoding of a linked list.
extension List where T: Equatable {
    public func encode() -> List<(Int, T)> {
        var iterator = Optional.some(pack())
        var resultHead : List<(Int,T)>!
        var resultTail : List<(Int,T)>!
        while let current = iterator {
            let node = List<(Int,T)>((current.value.length,current.value.value))!
            resultHead == nil ? (resultHead = node) : (resultTail.nextItem = node)
            resultTail = node
            iterator = iterator?.nextItem
        }
        return resultHead
    }
}















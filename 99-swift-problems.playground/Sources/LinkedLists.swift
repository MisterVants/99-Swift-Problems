/*
 Section rules:
 
 - Individual methods or computed properties will be added to the List<T> class as extensions to solve each problem.
 - Consider instances of List as immutable. All methods should return new instances of linked lists (instead of modifying the current list).
 - Using sequence types from the Swift Standard Library, like Array or Set is not allowed.
 */

// IMMUTABLE
public class List<T> {
    var value: T
    var nextItem: List<T>?
    
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

// DONT NEED TO USE GENERICS CAST
//P07 (**) Flatten a nested linked list structure.
extension List {
    public func flatten() -> List {
        
        var head : List?
        var pointer = self as List?
        
        while let node = pointer {
            if let val = value as? T {
                let newNode = List(val)
                head?.nextItem = newNode
                head = newNode
            } else if let val = value as? List<T> {
                let flatList = val.flatten()
                head?.nextItem = flatList
            }
            pointer = pointer?.nextItem
        }
        
        if let val = nextItem?.value as? List<T> {
            print("AAAAA")
        } else if let val = nextItem?.value as? T {
            print("BBBBB")
        }
        
        
        //
        //        var flatList = List(value)
        //        var pointer = self as List<T>?
        //        while let head = pointer {
        //            pointer = head.nextItem
        //        }
        ////        repeat {
        ////
        ////        } while let aaa = nextItem// != nil
        //
        //        if let avalue = value as? List<T> {
        //            return avalue.flatten()
        //        }
        //        return List(value)!
        //        return List(T)!
        return head!
    }
}
//let deep = List<Any>( List<Any>(1, 1)! , 2 , List<Any>(3, List<Any>(5, 8)!)! )!//.flatten().description
//deep.flatten()
//if let first = deep.nextItem!.value as? List<Any> {
//    print("AAA")
//}

//deep.value is T.Type




//import Foundation

public struct TestData {
    public static var singleElementList: List<Int> {
        return List(1)!
    }
    public static var twoElementList: List<Int> {
        return List(1, 2)!
    }
    public static var multiElementList: List<Int> {
        return List(1, 2, 3, 5, 8, 13, 21)!
    }
    public static var veryLongList: List<Int> {
        let items = Array(1...1000)
        return List(items)!
    }
}

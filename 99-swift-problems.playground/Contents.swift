/*
 LINKED LISTS
 */

// String description
List(1, 1, 2, 3, 5, 8)!.description
TestData.singleElementList.description
TestData.twoElementList.description
TestData.multiElementList.description
TestData.veryLongList.description

// P01 - Last element
List(1, 1, 2, 3, 5, 8)!.last
TestData.singleElementList.last
TestData.twoElementList.last
TestData.multiElementList.last
TestData.veryLongList.last

// P02 - Penultimate element
List(1, 1, 2, 3, 5, 8)!.penultimate
TestData.singleElementList.penultimate
TestData.twoElementList.penultimate
TestData.multiElementList.penultimate
TestData.veryLongList.penultimate

// P03 - Access by index
let list = List(1, 1, 2, 3, 5, 8)!
list[4]
list[5]
list[9]

// P04 - Element count
List(1, 1, 2, 3, 5, 8)!.length
TestData.singleElementList.length
TestData.twoElementList.length
TestData.multiElementList.length
TestData.veryLongList.length

// P05 - Reverse list
let l = List(1, 1, 2, 3, 5, 8)!
let rev = l.reverse()
l.description
rev.description

// P06 - Palindrome
List(1, 2, 3, 2, 1)!.isPalindrome()
TestData.multiElementList.isPalindrome()
List(1)!.isPalindrome()

// P07 - Flatten a nested list
let deep = List<Any>( List<Any>(1, 1)! , 2 , List<Any>(3, List<Any>(5, 8)!)! )!//.flatten().description
let flat = deep.flatten()
flat.description

// P08 - Eliminate consecutive duplicates
let dup = List("a", "a", "a", "a", "b", "c", "c", "a", "a", "d", "e", "e", "e", "e")!
let comp = dup.compress()
comp.description

// P09 - Pack consecutive duplicates into new lists
let duplicates = List("a", "a", "a", "a", "b", "c", "c", "a", "a", "d", "e", "e", "e", "e")!
duplicates.description
let pack = duplicates.pack()
pack.description

//P10 - Run-length encoding
let encode = duplicates.encode()
encode.description











// Logical functions output
and(true, true)
and(false, true)
and(true, false)
and(false, false)

or(true, true)
or(false, true)
or(true, false)
or(false, false)

nand(true, true)
nand(false, true)
nand(true, false)
nand(false, false)

nor(true, true)
nor(false, true)
nor(true, false)
nor(false, false)

xor(true, true)
xor(false, true)
xor(true, false)
xor(false, false)

impl(true, true)
impl(false, true)
impl(true, false)
impl(false, false)

equ(true, true)
equ(false, true)
equ(true, false)
equ(false, false)

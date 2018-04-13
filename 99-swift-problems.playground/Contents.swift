/*
 LINKED LISTS
 */

// String description
List(1, 1, 2, 3, 5, 8)!.description
TestData.singleElementList.description
TestData.twoElementList.description
TestData.multiElementList.description
TestData.veryLongList.description

// P01
List(1, 1, 2, 3, 5, 8)!.last
TestData.singleElementList.last
TestData.twoElementList.last
TestData.multiElementList.last
TestData.veryLongList.last

// P02
List(1, 1, 2, 3, 5, 8)!.penultimate
TestData.singleElementList.penultimate
TestData.twoElementList.penultimate
TestData.multiElementList.penultimate
TestData.veryLongList.penultimate

// P03
let list = List(1, 1, 2, 3, 5, 8)!
list[4]
list[5]
list[9]

// P04
List(1, 1, 2, 3, 5, 8)!.length
TestData.singleElementList.length
TestData.twoElementList.length
TestData.multiElementList.length
TestData.veryLongList.length

// P05
let l = List(1, 1, 2, 3, 5, 8)!
let rev = l.reverse()
l.description
rev.description

// P06
List(1, 2, 3, 2, 1)!.isPalindrome()
TestData.multiElementList.isPalindrome()
List(1)!.isPalindrome()

// P07
let deep = List<Any>( List<Any>(1, 1)! , 2 , List<Any>(3, List<Any>(5, 8)!)! )!//.flatten().description
let flat = deep.flatten()
flat.description












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

public func and(_ a: Bool, _ b: Bool) -> Bool {
    return a && b
}

public func or(_ a: Bool, _ b: Bool) -> Bool {
    return a || b
}

public func nand(_ a: Bool, _ b: Bool) -> Bool {
    return !(a && b)
}

public func nor(_ a: Bool, _ b: Bool) -> Bool {
    return !(a || b)
}

public func xor(_ a: Bool, _ b: Bool) -> Bool {
    return a != b
}

public func impl(_ a: Bool, _ b: Bool) -> Bool {
    return a == b || b == true
}

public func equ(_ a: Bool, _ b: Bool) -> Bool {
    return a == b
}


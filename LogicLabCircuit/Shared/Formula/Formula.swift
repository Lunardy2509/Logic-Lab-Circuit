//
//  Formula.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 01/08/25.
//

import Foundation

struct FullAdderFormula {
    static let sum = "(A ⊕ B) ⊕ Cin"
    static let carryOut = "(A ⋅ B) + (Cin ⋅ (A ⊕ B))"
}

struct FullSubtractorFormula {
    static let difference = "(A ⊕ B) ⊕ Bin"
    static let borrow = "¬A ⋅ B + ¬A ⋅ Bin + B ⋅ Bin"
}

struct HalfAdderFormula {
    static let sum = "A ⊕ B"
    static let carryOut = "A ⋅ B" 
}

struct HalfSubtractorFormula {
    static let difference = "A ⊕ B"
    static let borrow = "¬A ⋅ B"
}

struct ANDFormula {
    static let conjunction = "A ⋅ B"
}

struct ORFormula {
    static let disjunction = "A + B"
}

struct XORFormula {
    static let exclusiveOr = "A ⊕ B"
}

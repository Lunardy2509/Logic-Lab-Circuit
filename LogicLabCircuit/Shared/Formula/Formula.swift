//
//  Formula.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 01/08/25.
//

import Foundation

struct FullAdderFormula {
    static let sum = "(A ⊕ B) ⊕ Ci"
    static let carryOut = "(A ⋅ B) + (Ci ⋅ (A ⊕ B))"
}

struct FullSubtractorFormula {
    static let difference = "Ci ⊕ (A ⊕ B)"
    static let carryOut = "(A ⋅ B) ⊕ (Ci ⊕ (A ⊕ B))"
}

struct HalfAdderFormula {
    static let sum = "(A ⊕ B)"
    static let carryOut = "A ⋅ B" 
}

struct HalfSubtractorFormula {
    static let difference = "A ⊕ (B ⊕ Ci)"
    static let carryOut = "(A ⊕ B) ⋅ Ci"
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

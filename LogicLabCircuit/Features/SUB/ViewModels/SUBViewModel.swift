//
//  SUBViewModel.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 26/07/25.
//

import Combine
import Foundation

class SUBViewModel: ObservableObject {
    @Published var inputA: Bool = false
    @Published var inputB: Bool = false
    @Published var inputCi: Bool = false

    @Published var outputD: Bool = false // Difference
    @Published var outputCo: Bool = false // Borrow

    func computeOutput() {
        let notA = !inputA
        let xorAB = inputA != inputB
        outputD = xorAB != inputCi
        outputCo = (notA && inputB) || (inputCi && !xorAB)
    }
}

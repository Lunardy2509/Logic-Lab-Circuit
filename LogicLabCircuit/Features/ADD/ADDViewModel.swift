//
//  ADDViewModel.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 22/07/25.
//

import Combine
import Foundation

class ADDViewModel: ObservableObject {
    @Published var inputA: Bool = false
    @Published var inputB: Bool = false
    @Published var inputCi: Bool = false

    @Published var outputS: Bool = false
    @Published var outputCo: Bool = false

    func computeOutput() {
        let xorAB = inputA != inputB
        outputS = xorAB != inputCi
        outputCo = (inputA && inputB) || (inputCi && xorAB)
    }
}

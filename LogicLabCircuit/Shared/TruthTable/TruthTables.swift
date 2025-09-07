//
//  TruthTables.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 07/09/25.
//

import SwiftUI

// MARK: - Truth Table Models
struct TruthTableRow {
    let inputs: [Int]
    let outputs: [Int]
}

struct TruthTable {
    let inputHeaders: [String]
    let outputHeaders: [String]
    let rows: [TruthTableRow]
}

// MARK: - Truth Table Data
struct TruthTables {
    
    // Full Adder Truth Table
    static let fullAdder = TruthTable(
        inputHeaders: ["A", "B", "C-IN"],
        outputHeaders: ["Sum", "C-OUT"],
        rows: [
            TruthTableRow(inputs: [0, 0, 0], outputs: [0, 0]),
            TruthTableRow(inputs: [0, 0, 1], outputs: [1, 0]),
            TruthTableRow(inputs: [0, 1, 0], outputs: [1, 0]),
            TruthTableRow(inputs: [0, 1, 1], outputs: [0, 1]),
            TruthTableRow(inputs: [1, 0, 0], outputs: [1, 0]),
            TruthTableRow(inputs: [1, 0, 1], outputs: [0, 1]),
            TruthTableRow(inputs: [1, 1, 0], outputs: [0, 1]),
            TruthTableRow(inputs: [1, 1, 1], outputs: [1, 1])
        ]
    )
    
    // Full Subtractor Truth Table
    static let fullSubtractor = TruthTable(
        inputHeaders: ["A", "B", "B-IN"],
        outputHeaders: ["D", "B-OUT"],
        rows: [
            TruthTableRow(inputs: [0, 0, 0], outputs: [0, 0]),
            TruthTableRow(inputs: [0, 0, 1], outputs: [1, 1]),
            TruthTableRow(inputs: [0, 1, 0], outputs: [1, 1]),
            TruthTableRow(inputs: [0, 1, 1], outputs: [0, 1]),
            TruthTableRow(inputs: [1, 0, 0], outputs: [1, 0]),
            TruthTableRow(inputs: [1, 0, 1], outputs: [0, 0]),
            TruthTableRow(inputs: [1, 1, 0], outputs: [0, 0]),
            TruthTableRow(inputs: [1, 1, 1], outputs: [1, 1])
        ]
    )
    
    // AND Gate Truth Table
    static let andGate = TruthTable(
        inputHeaders: ["A", "B"],
        outputHeaders: ["Output"],
        rows: [
            TruthTableRow(inputs: [0, 0], outputs: [0]),
            TruthTableRow(inputs: [0, 1], outputs: [0]),
            TruthTableRow(inputs: [1, 0], outputs: [0]),
            TruthTableRow(inputs: [1, 1], outputs: [1])
        ]
    )
    
    // OR Gate Truth Table
    static let orGate = TruthTable(
        inputHeaders: ["A", "B"],
        outputHeaders: ["Output"],
        rows: [
            TruthTableRow(inputs: [0, 0], outputs: [0]),
            TruthTableRow(inputs: [0, 1], outputs: [1]),
            TruthTableRow(inputs: [1, 0], outputs: [1]),
            TruthTableRow(inputs: [1, 1], outputs: [1])
        ]
    )
    
    // XOR Gate Truth Table
    static let xorGate = TruthTable(
        inputHeaders: ["A", "B"],
        outputHeaders: ["Output"],
        rows: [
            TruthTableRow(inputs: [0, 0], outputs: [0]),
            TruthTableRow(inputs: [0, 1], outputs: [1]),
            TruthTableRow(inputs: [1, 0], outputs: [1]),
            TruthTableRow(inputs: [1, 1], outputs: [0])
        ]
    )
}

// MARK: - Truth Table View Component
struct TruthTableView: View {
    let truthTable: TruthTable
    let title: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .padding(.bottom, 4)
            
            VStack(spacing: 0) {
                // Header row
                HStack(spacing: 1) {
                    // Input headers
                    HStack(spacing: 1) {
                        ForEach(truthTable.inputHeaders, id: \.self) { header in
                            Text(header)
                                .font(.caption)
                                .fontWeight(.bold)
                                .frame(width: 40, height: 30)
                                .background(Color.gray.opacity(0.3))
                                .border(Color.gray, width: 0.5)
                        }
                    }
                    
                    // Output headers
                    HStack(spacing: 1) {
                        ForEach(truthTable.outputHeaders, id: \.self) { header in
                            Text(header)
                                .font(.caption)
                                .fontWeight(.bold)
                                .frame(width: 50, height: 30)
                                .background(Color.blue.opacity(0.3))
                                .border(Color.gray, width: 0.5)
                        }
                    }
                }
                
                // Data rows
                ForEach(Array(truthTable.rows.enumerated()), id: \.offset) { _, row in
                    HStack(spacing: 1) {
                        // Input values
                        HStack(spacing: 1) {
                            ForEach(Array(row.inputs.enumerated()), id: \.offset) { _, input in
                                Text("\(input)")
                                    .font(.caption)
                                    .frame(width: 40, height: 25)
                                    .background(Color.gray.opacity(0.1))
                                    .border(Color.gray, width: 0.5)
                            }
                        }
                        
                        // Output values
                        HStack(spacing: 1) {
                            ForEach(Array(row.outputs.enumerated()), id: \.offset) { _, output in
                                Text("\(output)")
                                    .font(.caption)
                                    .frame(width: 50, height: 25)
                                    .background(Color.blue.opacity(0.1))
                                    .border(Color.gray, width: 0.5)
                            }
                        }
                    }
                }
            }
        }
    }
}

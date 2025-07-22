//
//  ADDGateLayout.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 22/07/25.
//
import SwiftUI

struct ADDGateLayout: View {
    var body: some View {
        HStack(alignment: .top, spacing: 40) {
            // Inputs
            VStack(spacing: 20) {
                ADDLogicNode(imageName: "IN_off", label: "A", color: .black)
                ADDLogicNode(imageName: "IN_off", label: "B", color: .black)
                ADDLogicNode(imageName: "IN_off", label: "Ci", font: .caption, color: .black)
            }

            // Gates
            VStack(alignment: .leading, spacing: 25) {
                HStack(alignment: .top, spacing: 50) {
                    Image("XOR").resizable().frame(width: 60, height: 60)
                    Image("XOR").resizable().frame(width: 60, height: 60).padding(.top, 35)
                }

                HStack(alignment: .top, spacing: 50) {
                    VStack(spacing: 30) {
                        Image("AND").resizable().frame(width: 60, height: 60)
                        Image("AND").resizable().frame(width: 60, height: 60)
                    }
                    .padding(.leading, 50)

                    Image("OR").resizable().frame(width: 60, height: 60).padding(.top, 30)
                }
            }

            // Outputs
            VStack(spacing: 95) {
                ADDLogicNode(imageName: "OUT_off", label: "S", color: .black)
                ADDLogicNode(imageName: "OUT_off", label: "Co", font: .caption, color: .black)
            }
            .padding(.top, 55)
        }
    }
}

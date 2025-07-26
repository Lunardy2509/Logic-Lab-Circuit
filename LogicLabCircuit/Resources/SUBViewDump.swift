//
//  SUBView.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 26/07/25.
//

//import SwiftUI
//
//struct SUBViewDump: View {
//    @ObservedObject var viewModel: SUBViewModel
//    let inactiveColor = Color.gray
//    let r: CGFloat = 3.0
//
//    var body: some View {
//        ZStack {
//            // MARK: - WIRE PATHS
//            Path { path in
//                // A to NOT gate
//                path.move(to: CGPoint(x: 18, y: 60))
//                path.addLine(to: CGPoint(x: 40, y: 60))
//                
//                // dot at A output to XOR1 (25, 60)
//                path.addEllipse(in: CGRect(x: 25 - r, y: 60 - r, width: r * 2, height: r * 2))
//
//                // NOT1 output to AND1
//                path.move(to: CGPoint(x: 70, y: 62.5))
//                path.addLine(to: CGPoint(x: 90, y: 62.5))
//                
//                // B to AND1
//                path.move(to: CGPoint(x: 18, y: 100))
//                path.addLine(to: CGPoint(x: 70, y: 100))
//                
//                // B to AND1
//                path.move(to: CGPoint(x: 70, y: 82.5))
//                path.addLine(to: CGPoint(x: 70, y: 100))
//                
//                // dot at B output to AND1 (70, 100)
//                path.addEllipse(in: CGRect(x: 70 - r, y: 100 - r, width: r * 2, height: r * 2))
//                
//                // B to AND1
//                path.move(to: CGPoint(x: 70, y: 82.5))
//                path.addLine(to: CGPoint(x: 90, y: 82.5))
//
//                // AND1 to OR
//                path.move(to: CGPoint(x: 135, y: 70))
//                path.addLine(to: CGPoint(x: 275, y: 70))
//                
//                // dot at AND1 output to NOT (135, 100)
//                path.addEllipse(in: CGRect(x: 145 - r, y: 70 - r, width: r * 2, height: r * 2))
//                
//                // OR to D (Difference)
//                path.move(to: CGPoint(x: 310, y: 80))
//                path.addLine(to: CGPoint(x: 345, y: 80))
//                
//                // A to XOR1
//                path.move(to: CGPoint(x: 25, y: 60))
//                path.addLine(to: CGPoint(x: 25, y: 190))
//                
//                // A to XOR1
//                path.move(to: CGPoint(x: 25, y: 190))
//                path.addLine(to: CGPoint(x: 95, y: 190))
//
//                // B to XOR1
//                path.move(to: CGPoint(x: 70, y: 100))
//                path.addLine(to: CGPoint(x: 70, y: 170))
//                
//                // B to XOR1
//                path.move(to: CGPoint(x: 70, y: 170))
//                path.addLine(to: CGPoint(x: 95, y: 170))
//
//                // XOR1 to XOR2
//                path.move(to: CGPoint(x: 135, y: 180))
//                path.addLine(to: CGPoint(x: 180, y: 180))
//                
//                // XOR1 to XOR2
//                path.move(to: CGPoint(x: 180, y: 180))
//                path.addLine(to: CGPoint(x: 180, y: 195))
//                
//                // XOR1 to XOR2
//                path.move(to: CGPoint(x: 180, y: 195))
//                path.addLine(to: CGPoint(x: 275, y: 195))
//
//                // Ci to XOR2
//                path.move(to: CGPoint(x: 18, y: 215))
//                path.addLine(to: CGPoint(x: 275, y: 215))
//                
//                // dot at Ci output to AND (160, 215)
//                path.addEllipse(in: CGRect(x: 160 - r, y: 215 - r, width: r * 2, height: r * 2))
//
//                // AND1 to NOT2
//                path.move(to: CGPoint(x: 145, y: 70))
//                path.addLine(to: CGPoint(x: 145, y: 102.5))
//                
//                // AND1 to NOT2
//                path.move(to: CGPoint(x: 145, y: 102.5))
//                path.addLine(to: CGPoint(x: 160, y: 102.5))
//                
//                // AND to NOT2
//                path.move(to: CGPoint(x: 190, y: 102.5))
//                path.addLine(to: CGPoint(x: 200, y: 102.5))
//
//                // Ci to AND2
//                path.move(to: CGPoint(x: 160, y: 125))
//                path.addLine(to: CGPoint(x: 160, y: 215))
//                
//                // Ci to AND2
//                path.move(to: CGPoint(x: 160, y: 125))
//                path.addLine(to: CGPoint(x: 200, y: 125))
//
//                // AND2 to OR
//                path.move(to: CGPoint(x: 245, y: 115))
//                path.addLine(to: CGPoint(x: 255, y: 115))
//                
//                // AND2 to OR
//                path.move(to: CGPoint(x: 255, y: 90))
//                path.addLine(to: CGPoint(x: 255, y: 115))
//                
//                // AND2 to OR
//                path.move(to: CGPoint(x: 255, y: 90))
//                path.addLine(to: CGPoint(x: 270, y: 90))
//
//                // XOR to Co (Borrow)
//                path.move(to: CGPoint(x: 317.5, y: 205))
//                path.addLine(to: CGPoint(x: 345, y: 205))
//            }
//            .stroke(inactiveColor, lineWidth: 3)
//
//            // MARK: - LOGIC GATE LAYOUT
//            HStack(alignment: .top, spacing: 20) {
//                // Inputs
//                VStack(spacing: 20) {
//                    logicNode(imageName: viewModel.inputA ? "IN_On" : "IN_Off", label: "A")
//                    logicNode(imageName: viewModel.inputB ? "IN_On" : "IN_Off", label: "B")
//                    VStack {
//                        logicNode(imageName: viewModel.inputCi ? "IN_On" : "IN_Off", label: "Ci", font: .caption)
//                    }
//                    .padding(.top, 75)
//                }
//                .padding(.top, 5)
//
//                // Gates
//                VStack(alignment: .leading, spacing: 15) {
//                    HStack (alignment: .top, spacing: 15){
//                        Image("NOT").resizable().frame(width: 35, height: 35) // NOT A
//                        Image("AND").resizable().frame(width: 50, height: 50) // AND1 (¬A & B)
//                        HStack {
//                            HStack {
//                                Image("NOT").resizable().frame(width: 35, height: 35) // XOR1 (A ⊕ B)
//                            }
//                            .padding(.bottom, 20)
//                            Image("AND").resizable().frame(width: 50, height: 50) // XOR2 ((A⊕B)⊕Ci)
//                        }
//                        .padding(.top, 40)
//                        HStack {
//                            Image("OR").resizable().frame(width: 50, height: 50) // OR (AND1 | AND2)
//                        }
//                        .padding(.top, 10)
//                    }
//                    HStack {
//                        HStack {
//                            Image("XOR").resizable().frame(width: 50, height: 50) // AND2 (Ci & XOR1)
//                        }
//                        .padding(.bottom, 50)
//                        .padding(.leading, 50)
//                        Spacer()
//                        Image("XOR").resizable().frame(width: 50, height: 50) // OR (AND1 | AND2)
//                    }
//                }
//
//                // Outputs
//                VStack(spacing: 105) {
//                    logicNode(imageName: viewModel.outputD ? "OUT_On" : "OUT_Off", label: "D")
//                    logicNode(imageName: viewModel.outputCo ? "OUT_On" : "OUT_Off", label: "Co", font: .caption)
//                }
//                .padding(.top, 25)
//            }
//        }
//        .frame(width: 360, height: 300)
//        .onChange(of: viewModel.inputA) { viewModel.computeOutput() }
//        .onChange(of: viewModel.inputB) { viewModel.computeOutput() }
//        .onChange(of: viewModel.inputCi) { viewModel.computeOutput() }
//    }
//
//    private func logicNode(imageName: String, label: String, font: Font = .footnote) -> some View {
//        ZStack {
//            Image(imageName)
//                .resizable()
//                .frame(width: 20, height: 20)
//            Text(label)
//                .font(font)
//                .foregroundStyle(Color(.black))
//        }
//    }
//}
//
//#Preview {
//    let vm = SUBViewModel()
//    vm.inputA = true
//    vm.inputB = false
//    vm.inputCi = true
//    vm.computeOutput()
//    return SUBView(viewModel: vm)
//}

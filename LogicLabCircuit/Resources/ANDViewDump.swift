//
//  ANDViewDump.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 26/07/25.
//

//import SwiftUI
//
//struct ANDViewDump: View {
//    @ObservedObject var viewModel: ANDViewModel
//    let inactiveColor = Color.gray
//    let r: CGFloat = 3.0
//
//    var body: some View {
//        ZStack {
//            // MARK: - WIRE PATHS
//            Path { path in
//                // Input A to AND gate
//                path.move(to: CGPoint(x: 125, y: 370))
//                path.addLine(to: CGPoint(x: 180, y: 370))
//                
//                // Input B to AND gate
//                path.move(to: CGPoint(x: 120, y: 410))
//                path.addLine(to: CGPoint(x: 180, y: 410))
//                
//                // AND gate output to Output
//                path.move(to: CGPoint(x: 230, y: 390))
//                path.addLine(to: CGPoint(x: 280, y: 390))
//            }
//            .stroke(inactiveColor, lineWidth: 3)
//            
//            // MARK: - LOGIC GATE LAYOUT
//            HStack(alignment: .top, spacing: 40) {
//                // Inputs
//                VStack(spacing: 20) {
//                    logicNode(imageName: viewModel.inputA ? "IN_On" : "IN_Off", label: "A")
//                    logicNode(imageName: viewModel.inputB ? "IN_On" : "IN_Off", label: "B")
//                }
//                
//                // Gate
//                VStack {
//                    Image(viewModel.output ? "AND_On" : "AND").resizable().frame(width: 60, height: 60)
//                }
//                
//                // Output
//                VStack {
//                    logicNode(imageName: viewModel.output ? "OUT_On" : "OUT_Off", label: "O")
//                }
//                .padding(.top, 21)
//            }
//            .frame(width: 360, height: 300)
//            .onChange(of: viewModel.inputA) { viewModel.computeOutput() }
//            .onChange(of: viewModel.inputB) { viewModel.computeOutput() }
//        }
//    }
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
//    let vm = ANDViewModel()
//    vm.inputA = true
//    vm.inputB = true
//    vm.computeOutput()
//    return ANDView(viewModel: vm)
//}

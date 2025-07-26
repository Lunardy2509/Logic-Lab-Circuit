//
//  ADDLogicNode.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 22/07/25.
//

import SwiftUI

struct ADDLogicNode: View {
    var imageName: String
    var label: String
    var font: Font = .footnote

    var body: some View {
        ZStack {
            Image(imageName)
                .resizable()
                .frame(width: 20, height: 20)
            Text(label)
                .font(font)
                .foregroundStyle(Color(.black))
        }
    }
}

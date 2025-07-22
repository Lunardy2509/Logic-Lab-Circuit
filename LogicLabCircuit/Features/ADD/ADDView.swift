//
//  ADDView.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 06/07/25.
//

import SwiftUI

struct ADDView: View {
    var body: some View {
        ZStack {
            ADDWirePath()
            ADDGateLayout()
        }
        .frame(width: 300, height: 300)
    }
}

#Preview {
    ADDView()
}

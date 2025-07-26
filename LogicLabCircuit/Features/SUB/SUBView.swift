//
//  SUBView.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 26/07/25.
//

import SwiftUI

struct SUBView: View {
    @ObservedObject var viewModel: MainViewModel

    var body: some View {
        ZStack {
            // Add wire paths and gate layouts specific to subtraction
            Text("Subtraction Logic Gates")
        }
        .frame(width: 300, height: 300)
    }
}

#Preview {
    SUBView(viewModel: MainViewModel())
}

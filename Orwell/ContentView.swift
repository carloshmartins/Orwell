//
//  ContentView.swift
//  Orwell
//
//  Created by carlos.henrique.martrins on 13/04/21.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var viewModel = ContentViewModel()
    init() {
        viewModel.checkAuthorization()
    }

    var body: some View {
        PlayerContainerView(captureSession: viewModel.captureSession)
           .clipShape(Circle())
    }
}

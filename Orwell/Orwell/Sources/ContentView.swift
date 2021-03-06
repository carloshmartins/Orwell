//
//  ContentView.swift
//  Orwell
//
//  Created by carlos.henrique.martrins on 14/04/21.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var viewModel = ContentViewModel()
    @EnvironmentObject var settings: UserSettings

    init() {
        viewModel.checkAuthorization()
        print("How this")
    }

    var body: some View {
        WebcamContainerView(captureSession: viewModel.captureSession, settings: settings)
                .clipShape(shape)
    }
    
    var shape: some Shape {
        switch settings.shape {
        case .circle:
            return AnyShape(Circle())
        case .rectangle:
            return AnyShape(RoundedRectangle(cornerRadius: 25.0))
        }
    }
}

struct AnyShape: Shape {
    init<S: Shape>(_ wrapped: S) {
        _path = { rect in
            let path = wrapped.path(in: rect)
            return path
        }
    }

    func path(in rect: CGRect) -> Path {
        return _path(rect)
    }

    private let _path: (CGRect) -> Path
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

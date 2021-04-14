//
//  PlayerContainerView.swift
//  Orwell
//
//  Created by carlos.henrique.martrins on 14/04/21.
//

import AVFoundation
import SwiftUI

final class PlayerContainerView: NSViewRepresentable {
    typealias NSViewType = PlayerView

    let captureSession: AVCaptureSession

    init(captureSession: AVCaptureSession) {
        self.captureSession = captureSession
    }

    func makeNSView(context: Context) -> PlayerView {
        return PlayerView(captureSession: captureSession)
    }

    func updateNSView(_ nsView: PlayerView, context: Context) { }
}

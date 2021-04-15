//
//  PlayerContainerView.swift
//  Orwell
//
//  Created by carlos.henrique.martrins on 14/04/21.
//

import SwiftUI
import AppKit
import AVFoundation
import Combine

final class PlayerContainerView: NSViewRepresentable {
    typealias NSViewType = PlayerView

    let settings: UserSettings
    let captureSession: AVCaptureSession

    init(captureSession: AVCaptureSession, settings: UserSettings) {
        self.captureSession = captureSession
        self.settings = settings
    }

    func makeNSView(context: Context) -> PlayerView {
        return PlayerView(captureSession: captureSession, settings: settings)
    }

    func updateNSView(_ nsView: PlayerView, context: Context) { }
}

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

final class WebcamContainerView: NSViewRepresentable {
    typealias NSViewType = CameraView

    let settings: UserSettings
    let captureSession: AVCaptureSession

    init(captureSession: AVCaptureSession, settings: UserSettings) {
        self.captureSession = captureSession
        self.settings = settings
    }

    func makeNSView(context: Context) -> CameraView {
        return CameraView(captureSession: captureSession, settings: settings)
    }

    func updateNSView(_ nsView: CameraView, context: Context) { }
}

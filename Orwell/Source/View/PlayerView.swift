//
//  PlayerView.swift
//  Orwell
//
//  Created by carlos.henrique.martrins on 14/04/21.
//

import AppKit
import AVFoundation

class PlayerView: NSView {
    
    var previewLayer: AVCaptureVideoPreviewLayer?

    init(captureSession: AVCaptureSession) {
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        super.init(frame: .zero)

        setupLayer()
    }

    func setupLayer() {

        previewLayer?.frame = self.frame
        previewLayer?.contentsGravity = .resizeAspectFill
        previewLayer?.videoGravity = .resizeAspectFill
        previewLayer?.connection?.automaticallyAdjustsVideoMirroring = false
        layer = previewLayer
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


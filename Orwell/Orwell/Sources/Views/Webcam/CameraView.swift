//
//  PlayerView.swift
//  Orwell
//
//  Created by carlos.henrique.martrins on 14/04/21.
//

import SwiftUI
import AppKit
import AVFoundation
import Combine

class CameraView: NSView {
    
    private weak var settings: UserSettings?
    private var previewLayer: AVCaptureVideoPreviewLayer?
    private lazy var cancellables = Set<AnyCancellable>()

    init(captureSession: AVCaptureSession, settings: UserSettings? = nil) {
        self.settings = settings
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
        
        settings?.$isMirroring
            .subscribe(on: RunLoop.main)
            .sink { [weak self] isMirroring in
                self?.previewLayer?.connection?.isVideoMirrored = isMirroring
            }
            .store(in: &cancellables)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

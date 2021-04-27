//
//  ScreenRecordView.swift
//  Orwell
//
//  Created by carlos.henrique.martrins on 15/04/21.
//

import SwiftUI
import AppKit
import AVFoundation
import Combine

class ScreenRecordView: NSView {
    
    private weak var settings: UserSettings?
    private var screenRecordLayer: AVCaptureVideoPreviewLayer?
    private lazy var cancellables = Set<AnyCancellable>()

    init(captureSession: AVCaptureSession, settings: UserSettings? = nil) {
        self.settings = settings
        screenRecordLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        super.init(frame: .zero)

        setupLayer()
    }

    func setupLayer() {

        screenRecordLayer?.frame = self.frame
        screenRecordLayer?.contentsGravity = .resizeAspectFill
        screenRecordLayer?.videoGravity = .resizeAspectFill
        screenRecordLayer?.connection?.automaticallyAdjustsVideoMirroring = false
        
        layer = screenRecordLayer
        
        settings?.$isMirroring
            .subscribe(on: RunLoop.main)
            .sink { [weak self] isMirroring in
                self?.screenRecordLayer?.connection?.isVideoMirrored = isMirroring
            }
            .store(in: &cancellables)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  CoreMotionViewModel.swift
//  Workshop SwiftUI
//
//  Created by Bryan Caro on 15/11/22.
//

import SwiftUI
import CoreMotion

class CoreMotionViewModel: ObservableObject {
    //  MARK: - Published
    @Published var x = 0.0
    @Published var y = 0.0
    
    private let motionManager = CMMotionManager()
    //  MARK: - Constants
    //  MARK: - Lifecycle
    init() {
        motionManager.deviceMotionUpdateInterval = 1/60
        motionManager.startDeviceMotionUpdates(to: .main) { [weak self] data, error in
            guard let self = self else { return }
            guard let motion = data?.attitude else { return }
            self.x = motion.roll
            self.y = motion.pitch
            
            print("x: \(motion.roll), y: \(motion.pitch)")
        }
    }
    
    deinit {
        print("[DEBUG]-[VIEWMODEL] []: [deinit] [\(self)]")
    }
}


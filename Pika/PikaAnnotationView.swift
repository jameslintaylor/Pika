//
//  PikaAnnotationView.swift
//  Pika
//
//  Created by James Taylor on 2016-07-22.
//  Copyright © 2016 James Taylor. All rights reserved.
//

import Foundation

import Mapbox
import Cartography
import PulsingHalo

struct ImageSpec {
    let imageName: String
    let renderingMode: UIImageRenderingMode
    
    var image: UIImage? {
        return UIImage(named: imageName)?.imageWithRenderingMode(renderingMode)
    }
}

enum PulseMode {
    case always
    case onSelected
}

struct PulseSpec {
    let mode: PulseMode
    let color: UIColor
    let radius: CGFloat
    let singlePulseDuration: Double
    let concurrentPulses: Int
}

class PikaAnnotationView: MGLAnnotationView {
    
    private let imageView = UIImageView()
    private var pulse: PulsingHaloLayer?
    
    var imageSpec: ImageSpec? {
        didSet { imageView.image = imageSpec?.image }
    }
    
    var pulseSpec: PulseSpec? {
        didSet {
            guard let spec = pulseSpec else {
                pulse?.removeFromSuperlayer()
                return
            }
            
            if let pulse = pulse {
                
                // Remove pulse
                if spec.mode == .onSelected && !selected {
                
                    pulse.removeFromSuperlayer()
                //  Update pulse
                } else {
                    pulse.backgroundColor = spec.color.CGColor
                    pulse.radius = spec.radius
                }
                
            // New pulse
            } else {
                if spec.mode == .always {
                    startPulse()
                }
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
        constrain(imageView) { $0.edges == $0.superview!.edges }
        
        // Worry not! this prevents the nonsense of the map not moving when a pan starts over an annotation. Tapping on the annotation to show the callout still works.  
        userInteractionEnabled = false
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        guard let spec = pulseSpec where spec.mode == .onSelected else { return }
        
        if selected {
            startPulse()
        } else {
            pulse?.removeFromSuperlayer()
        }
    }
    
    private func startPulse() {
        guard let spec = pulseSpec else { return }
        
        let pulse = PulsingHaloLayer().with {
            $0.position = CGPoint(x: bounds.width/2, y: bounds.height/2)
            $0.animationDuration = spec.singlePulseDuration
            $0.haloLayerNumber = spec.concurrentPulses
            $0.backgroundColor = spec.color.CGColor
            $0.radius = spec.radius
        }
        
        layer.insertSublayer(pulse, atIndex: 0)
        pulse.start()
        
        self.pulse?.removeFromSuperlayer()
        self.pulse = pulse
    }
}
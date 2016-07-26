//
//  EncounterCalloutView.swift
//  Pika
//
//  Created by James Taylor on 2016-07-23.
//  Copyright © 2016 James Taylor. All rights reserved.
//

import Foundation

import Mapbox
import FLAnimatedImage
import Cartography

class EncounterCalloutView: UIView, MGLCalloutView {
    
    var representedObject: MGLAnnotation
    lazy var leftAccessoryView = UIView()
    lazy var rightAccessoryView = UIView()
    weak var delegate: MGLCalloutViewDelegate?
    
    required init(annotation: EncounterAnnotation) {
        representedObject = annotation
        super.init(frame: .zero)
        
        let encounter = annotation.encounter
        
        let gifContainer = UIView().with {
            $0.layer.cornerRadius = 4
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor(white: 0.2, alpha: 1).CGColor
            $0.backgroundColor = UIColor(white: 0.96, alpha: 1)
            $0.backgroundColor = UIColor(white: 0.6, alpha: 1)
        }
        
        let gifView = FLAnimatedImageView().with {
            guard let data = NSDataAsset(name: String(encounter.pokemon))?.data else { return }
            $0.animatedImage = FLAnimatedImage(animatedGIFData: data)
            $0.contentMode = .ScaleAspectFit
        }
        
        addSubview(gifContainer)
        gifContainer.addSubview(gifView)
        constrain(gifContainer, gifView) { gifContainer, gifView in
            gifContainer.left == gifContainer.superview!.left
            gifContainer.top == gifContainer.superview!.top
            gifContainer.bottom == gifContainer.superview!.bottom - 2
            gifContainer.width == gifContainer.height
            gifView.edges == inset(gifContainer.edges, 3)
        }
        
        let bubbleView = UIImageView().with {
            $0.image = UIImage(named: "bubble")
            $0.layer.masksToBounds = true
        }
        
        let nameLabel = UILabel().with {
            $0.text = encounter.pokemon.name.uppercaseString
            $0.textColor = .blackColor()
            $0.textAlignment = .Center
            $0.font = UIFont(name: "VCROSDMONO", size: 17)
        }
        
        let timeLabel = CountDownLabel(fireDate: encounter.disappearDate).with {
            $0.textColor = .blackColor()
            $0.textAlignment = .Center
            $0.font = UIFont(name: "VCROSDMONO", size: 17)
        }
    
        addSubview(bubbleView)
        bubbleView.addSubview(nameLabel)
        bubbleView.addSubview(timeLabel)
        constrain(bubbleView, nameLabel, timeLabel) { bubbleView, nameLabel, timeLabel in
            bubbleView.edges == inset(bubbleView.superview!.edges, 0, 50, 0, 0)
            nameLabel.left == bubbleView.left + 8
            nameLabel.top == bubbleView.top + 4
            align(leading: nameLabel, timeLabel)
            distribute(by: 3, vertically: nameLabel, timeLabel)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func presentCalloutFromRect(rect: CGRect, inView view: UIView, constrainedToView constrainedView: UIView, animated: Bool) {
        
        // Determine frame for callout view
        let width: CGFloat = 150
        let height: CGFloat = 50
        let x = rect.origin.x + rect.size.width/2 - width/2
        let y = rect.origin.y - height
        frame = CGRectMake(x, y, width, height)
        
        view.addSubview(self)
        if animated {
            alpha = 0
            animate(self.alpha = 1)
        }
    }
    
    func dismissCalloutAnimated(animated: Bool) {
        if animated {
            animate(self.alpha = 0, completion: self.removeFromSuperview())
        } else {
            removeFromSuperview()
        }
    }
}

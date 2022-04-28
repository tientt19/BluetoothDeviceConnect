//
//  CircleProgressView.swift
//  1SK
//
//  Created by vuongbachthu on 7/8/21.
//

import UIKit

protocol CircleProgressViewDelegate: AnyObject {
    func onCountdownStartPlaySuccess()
}

class CircleProgressView: UIView {
    private var circleLayer = CAShapeLayer()
    private var progressLayer = CAShapeLayer()
    private var timeLabel =  UILabel()
    private var timer = Timer()
    
    private var startPoint = CGFloat(-Double.pi / 2)
    private var endPoint = CGFloat(3 * Double.pi / 2)
    
    weak var delegate: CircleProgressViewDelegate?
    var timeInterval: TimeInterval = 5
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func createCircularPath() {
        // created circularPath for circleLayer and progressLayer
        let circularPath = UIBezierPath(arcCenter: CGPoint(
                                            x: self.frame.size.width / 2.0,
                                            y: self.frame.size.height / 2.0),
                                        radius: (self.frame.size.height/2) - 2.5,
                                        startAngle: self.startPoint,
                                        endAngle: self.endPoint,
                                        clockwise: true)
        
        self.addTimeLabel()
        
        // circleLayer path defined to circularPath
        self.circleLayer.path = circularPath.cgPath
        
        // ui edits
        self.circleLayer.fillColor = UIColor.clear.cgColor
        self.circleLayer.lineCap = .round
        self.circleLayer.lineWidth = 22.0
        self.circleLayer.strokeEnd = 1.0
        self.circleLayer.strokeColor = UIColor.init(hex: "FFFFFF").cgColor
        // added circleLayer to layer
        self.layer.addSublayer(self.circleLayer)
        
        // progressLayer path defined to circularPath
        self.progressLayer.path = circularPath.cgPath
        
        // ui edits
        self.progressLayer.fillColor = UIColor.clear.cgColor
        self.progressLayer.lineCap = .round
        self.progressLayer.lineWidth = 22.0
        self.progressLayer.strokeEnd = 0
        self.progressLayer.strokeColor = UIColor.init(hex: "C4C4C4").cgColor.copy(alpha: 0.56)
        
        // added progressLayer to layer
        self.layer.addSublayer(self.progressLayer)
    }
    
    func startProgress() {
        // created circularProgressAnimation with keyPath
        let circularProgressAnimation = CABasicAnimation(keyPath: "strokeEnd")
        
        // set the end time
        circularProgressAnimation.duration = self.timeInterval
        circularProgressAnimation.fromValue = 0.0
        circularProgressAnimation.toValue = 1.0
        circularProgressAnimation.fillMode = .forwards
        circularProgressAnimation.isRemovedOnCompletion = false
        
        self.progressLayer.add(circularProgressAnimation, forKey: "progressAnim")
        
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.updateTime), userInfo: nil, repeats: true)
    }
    
    @objc func updateTime() {
        if self.timeInterval > 1 {
            self.timeInterval -= 1
            self.timeLabel.text = "\(Int(self.timeInterval))"
            
        } else {
            self.timeLabel.text = "1"
            self.timer.invalidate()
            self.delegate?.onCountdownStartPlaySuccess()
        }
    }
    
    func addTimeLabel() {
        self.timeLabel = UILabel(frame: self.frame)
        self.timeLabel.font = UIFont.systemFont(ofSize: 84, weight: .medium)
        self.timeLabel.textAlignment = .center
        self.timeLabel.text = "\(Int(self.timeInterval))"
        self.timeLabel.textColor = UIColor.init(hex: "FFFFFF")
        self.timeLabel.backgroundColor = UIColor.clear
        self.addSubview(self.timeLabel)
    }
}

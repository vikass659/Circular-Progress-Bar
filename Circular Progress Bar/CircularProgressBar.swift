//  Circular Progress Bar - CircularProgressBar.swift
//  Created by Vikas Ninawe on 12/9/17.
//  Copyright © 2017 VSN. All rights reserved.
//  Purpose: This class is used to draw the circular progress view

import UIKit

class CircularProgressBar: UIView {
    
    private let angleStart:CGFloat = 0
    private let angleEnd:CGFloat = 90 // set circular progress bar angle, range between 0 to 360
    private var layerProgress: CAShapeLayer = CAShapeLayer()
    private var progress:CGFloat = 0
    private var barWidth:CGFloat = 8.0

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.clear
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    
    override func draw(_ rect: CGRect) {
        
        // Rotate view to set the starting position of the progress bar (by default, it is at left side)
        self.transform = CGAffineTransform(rotationAngle:CGFloat(Double.pi))
        
        // Draw progress bar track with border
        self.drawProgressTrack()
    }
    
    private func drawProgressTrack(){
        
        let width = self.frame.width
        let pathBorder = UIBezierPath(arcCenter:CGPoint(x:width*0.5,y:width*0.5),
                                radius: CGFloat(width*0.5),
                                startAngle: toRadian(degree: angleStart),
                                endAngle:toRadian(degree: angleEnd),
                                clockwise:true)
        let layerBorder = CAShapeLayer()
        layerBorder.path = pathBorder.cgPath
        layerBorder.fillColor = UIColor.clear.cgColor
        layerBorder.strokeColor = UIColor.blue.cgColor // border color
        layerBorder.lineCap = kCALineCapRound
        layerBorder.lineWidth = self.barWidth + 2.0
        self.layer.addSublayer(layerBorder)

        let pathTrack = UIBezierPath(arcCenter:CGPoint(x:width*0.5,y:width*0.5),
                                radius: CGFloat(width*0.5),
                                startAngle: toRadian(degree: angleStart),
                                endAngle:toRadian(degree: angleEnd),
                                clockwise:true)
        let layerTrack = CAShapeLayer()
        layerTrack.path = pathTrack.cgPath
        layerTrack.fillColor = UIColor.clear.cgColor
        layerTrack.strokeColor = UIColor.white.cgColor // track color
        layerTrack.lineCap = kCALineCapRound
        layerTrack.lineWidth = self.barWidth + 1.0
        self.layer.addSublayer(layerTrack)
        
        self.setProgress(withProgress:self.progress)
    }
    
    func setProgress(withProgress:CGFloat){
        
        self.progress = withProgress
        if (self.progress < 0) {
            self.progress = 0
        }
        else if(self.progress > 100){
            self.progress = 100
        }
        let newAngleEnd = (self.angleEnd/100)*self.progress
        
        let width = self.frame.width
        let pathProgress = UIBezierPath(arcCenter:CGPoint(x:width*0.5,y:width*0.5),
                                radius: CGFloat(width*0.5),
                                startAngle: toRadian(degree: angleStart) ,
                                endAngle:toRadian(degree: newAngleEnd),
                                clockwise:true)
        
        layerProgress.removeFromSuperlayer()
        layerProgress.path = pathProgress.cgPath
        layerProgress.fillColor = UIColor.clear.cgColor
        layerProgress.strokeColor = UIColor.blue.cgColor    // Progress color
        layerProgress.lineCap = kCALineCapRound
        layerProgress.lineWidth = self.barWidth
        self.layer.addSublayer((layerProgress))
    }
    
    func getProgress() ->CGFloat{
        return self.progress;
    }
    
    private func toRadian(degree:CGFloat) -> CGFloat{
        return degree*CGFloat(Double.pi)/180
    }
    
    private func toDegree(radians:CGFloat) -> CGFloat{
        return radians * 180/CGFloat(Double.pi)
    }
}


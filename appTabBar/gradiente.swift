//
//  gradiente.swift
//  appTabBarViewController
//
//  Created by braulio on 09/06/24.
//

import UIKit


class gradiente: UIView {

  public var startPointX: CGFloat = 0
   public var startPointY: CGFloat = 0
   
   public var endPointX : CGFloat = 414
   public var endPointY : CGFloat = 216
   
   public var startRadio : CGFloat = 10
   public var endRadio : CGFloat = 70.0
   
   public var color1: CGColor = UIColor.green.cgColor
   public var color2: CGColor = UIColor.blue.cgColor
   public var color3: CGColor = UIColor.orange.cgColor
   
   
   
  override func draw(_ rect: CGRect) {
         
       let canvas = UIGraphicsGetCurrentContext()
         
        canvas?.setLineWidth(3.0)
     
         
         //GRADIENTE RADIAL
         let posicion1:[CGFloat]=[0.0,0.5,1.0]
         let colores = [color1, color2, color3]
         let colorspace1 = CGColorSpaceCreateDeviceRGB()
         let gradiente = CGGradient(colorsSpace: colorspace1, colors: colores as CFArray, locations: posicion1)
         
         var startPoint = CGPoint()
         var endPoint = CGPoint()
         
         startPoint.x = startPointX
         startPoint.y = startPointY
         
         endPoint.x = endPointX
         endPoint.y = endPointY
         
         
   canvas?.drawRadialGradient(gradiente!, startCenter: startPoint, startRadius: startRadio, endCenter: endPoint, endRadius: endRadio, options: CGGradientDrawingOptions.drawsAfterEndLocation)  //[])
         
         canvas?.strokePath()
     }

}

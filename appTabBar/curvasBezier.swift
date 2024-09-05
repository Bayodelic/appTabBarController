//
//  curvasBezier.swift
//  appTabBarViewController
//
//  Created by braulio on 09/06/24.
//

import UIKit


class curvasBezier: UIView {
    
    public var x1:Int = 0
    internal var y1:Int = 0
    public var x2:Int = 0
    public var y2:Int = 0
    
    
    public var PCX1: Int = 0
    public var PCY1: Int = 0
    public var PCX2: Int = 0
    public var PCY2: Int = 0
    
    public var ancho:Int = 0
    public var alto:Int = 0

    public var grosor:CGFloat = 2.0
    
    public var selectedColor: CGColor = UIColor.black.cgColor // Color por defecto
    //Tarea Implementar el boton para la curva de bezier Quad
    //
    override func draw(_ rect: CGRect) {
        
        
        ancho = Int(rect.width)
        alto = Int(rect.height)
        
        let canvas = UIGraphicsGetCurrentContext()
        
        canvas?.setLineWidth(grosor)
    
        
        canvas?.setStrokeColor(selectedColor)
        
        //Curvas de Bezier
        
        
        canvas?.move(to: CGPoint(x: x1, y: y1))

        canvas?.addCurve(to: CGPoint(x: x2, y: y2), control1: CGPoint(x: PCX1, y: PCY1), control2: CGPoint(x: PCX2, y: PCY2))
        canvas?.addQuadCurve(to: CGPoint(x: x2, y: y2) , control: CGPoint(x: PCX1, y: PCY1))
        canvas?.strokePath()
        
        
       
    }


}


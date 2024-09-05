//
//  CurvasBezierViewController.swift
//  appTabBarViewController
//
//  Created by Guest User on 06/06/24.
//

import UIKit

class CurvasBezierViewController: UIViewController {

    
    
    @IBOutlet weak var canvas: curvasBezier!
    
    
    @IBOutlet weak var sliderX1: UISlider!
    
    @IBOutlet weak var sliderY1: UISlider!
    
    
    @IBOutlet weak var sliderX2: UISlider!
    @IBOutlet weak var sliderY2: UISlider!
    @IBOutlet weak var sliderPCX1: UISlider!
    @IBOutlet weak var sliderPCY1: UISlider!
    @IBOutlet weak var sliderPCX2: UISlider!
    @IBOutlet weak var sliderPCY2: UISlider!
    @IBOutlet weak var labelAncho: UILabel!
    @IBOutlet weak var labelAlto: UILabel!
    @IBOutlet weak var sliderGrosor: UISlider!
    @IBOutlet weak var labelPC: UILabel!
    @IBOutlet weak var labelPCX: UILabel!
    @IBOutlet weak var labelPCY: UILabel!
    @IBOutlet weak var labelGrosor: UILabel!
    @IBOutlet weak var botonColor: UIButton!
    
    @IBOutlet weak var botonCurvaCuadratica: UIButton!
    
    @IBOutlet weak var labelX: UILabel!
    
    @IBOutlet weak var labelY: UILabel!
    @IBOutlet weak var botonHelp: UIButton!
    /*

    
    @IBOutlet weak var labelPC: UILabel!
    
    @IBOutlet weak var labelPCX: UILabel!
    
    
    @IBOutlet weak var labelPCY: UILabel!
    
    
    @IBOutlet weak var labelGrosor: UILabel!
    

    
    @IBOutlet weak var botonColor: UIButton!
    
    
    
    
    @IBOutlet weak var botonCurvaCuadratica: UIButton!
    
    
    @IBOutlet weak var labelX: UILabel!
    
    
    @IBOutlet weak var labelY: UILabel!
  
    
    @IBOutlet weak var botonHelp: UIButton!
    
    */
    
    
    var bandera = false // Define la variable como propiedad de la clase

    
    @objc func sliderValueChanged(_ sender: UISlider) {
        dibujarCurvaBezier()
        actualizarAnchoAlto()
    }
    
    @IBAction func dibujarCurvaBezier() {
        labelGrosor.isEnabled = true
        sliderGrosor.isEnabled = true
        botonColor.isEnabled = true
        
        labelAncho.text! += " " + String(self.canvas.ancho)
        labelAlto.text! += " " + String(self.canvas.alto)
        canvas.x1 = Int(sliderX1.value)
        canvas.y1 = Int(sliderY1.value)
        canvas.x2 = Int(sliderX2.value)
        canvas.y2 = Int(sliderY2.value)
        canvas.PCX1 = Int(sliderPCX1.value)
        canvas.PCY1 = Int(sliderPCY1.value)
        canvas.PCX2 = Int(sliderPCX2.value)
        canvas.PCY2 = Int(sliderPCY2.value)
        
        canvas.grosor = CGFloat(sliderGrosor.value)
        
        canvas.setNeedsDisplay()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Agrega los targets para los sliders
            sliderX1.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
            sliderY1.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
            sliderX2.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
            sliderY2.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
            sliderPCX1.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
            sliderPCY1.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
            sliderPCX2.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
            sliderPCY2.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
        sliderGrosor.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
        
        actualizarAnchoAlto()
    }

    func actualizarAnchoAlto() {
        labelAncho.text = "Ancho: \(canvas.ancho)"
        labelAlto.text = "Alto: \(canvas.alto)"
    }
    
    
    
    
    
    
  
    
    
    
    @IBAction func curvaCuadraticaShow(_ sender: UIButton) {
        
        if !bandera {
             
              sliderPCX2.isEnabled = false
              
              sliderPCY2.isEnabled = false
              
              
              botonCurvaCuadratica.setTitle("Curva Bezier", for: .normal)
              
              bandera = true
          } else {
        
              sliderPCX2.isEnabled = true
            
              sliderPCY2.isEnabled = true
              
              botonCurvaCuadratica.setTitle("Curva Cuadratica", for: .normal)
              
              bandera = false
          }
        
        
    }
    
    
    
  
    
    @IBAction func botonHelp(_ sender: UIButton) {
        
        let alertController = UIAlertController(title: "Ayuda", message: "Curva de Bézier lineal: Es una simple línea recta entre dos puntos. \nCurva de Bézier cuadrática: Utiliza tres puntos: dos puntos extremos y un punto de control que determina la forma de la curva.", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alertController.addAction(okAction)
                    
                    // Crear una imagen
                    let image = UIImage(named: "ImagenAyuda1")
                    let imageView = UIImageView(frame: CGRect(x: 25, y: 165, width: 100, height: 100))
                    imageView.image = image
               
                    let image1 = UIImage(named: "ImagenAyuda2")
                    let imageView1 = UIImageView(frame: CGRect(x: 155, y: 165, width: 100, height: 100))
                    imageView1.image = image1
                       
                    // Añadir la imagen al UIAlertController
                    alertController.view.addSubview(imageView)
                    alertController.view.addSubview(imageView1)
                    // Ajustar el tamaño del UIAlertController
                    let height = NSLayoutConstraint(item: alertController.view!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 350)
                    alertController.view.addConstraint(height)
                    
                    present(alertController, animated: true, completion: nil)
               
        
        
        
    }
    
    
    

    @IBAction func seleccionarColorBoton(_ sender: UIButton) {
        
        let alertController = UIAlertController(title: "Selecciona un color", message: nil, preferredStyle: .actionSheet)

                let colors: [(String, CGColor)] = [
                    ("Rojo", UIColor.red.cgColor),
                    ("Verde", UIColor.green.cgColor),
                    ("Azul", UIColor.blue.cgColor),
                    ("Negro", UIColor.black.cgColor),
                    ("Amarillo", UIColor.yellow.cgColor),
                    ("Naranja", UIColor.orange.cgColor),
                    ("Púrpura", UIColor.purple.cgColor)
                ]

                for (name, color) in colors {
                    let action = UIAlertAction(title: name, style: .default) { _ in
                       self.canvas.selectedColor = color
                       self.dibujarCurvaBezier()
                       self.actualizarAnchoAlto()
                    }
                    alertController.addAction(action)
                }

                let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
                alertController.addAction(cancelAction)

                present(alertController, animated: true, completion: nil)
            }
        
    }

    

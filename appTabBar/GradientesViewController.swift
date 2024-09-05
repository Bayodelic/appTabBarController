//
//  GradientesViewController.swift
//  appTabBarViewController
//
//  Created by braulio on 09/06/24.
//

import UIKit

class GradientesViewController: UIViewController {


    
    @IBOutlet weak var canvas: gradiente!
    
    @IBOutlet weak var startX: UISlider!
    
    @IBOutlet weak var startY: UISlider!
    
    
    @IBOutlet weak var endX: UISlider!
    
    
    @IBOutlet weak var endY: UISlider!
    
    
    @IBOutlet weak var startRadio: UISlider!
    
    
    @IBOutlet weak var endRadio: UISlider!
    
   
     
     @objc func sliderValueChanged(_ sender: UISlider) {
         dibujarGradiente()
     }
     
       
     @IBAction func dibujarGradiente() {
         
         canvas.startPointX = CGFloat(startX.value)
         canvas.startPointY = CGFloat(startY.value)
         
         canvas.endPointX = CGFloat(endX.value)
         canvas.endPointY = CGFloat(endY.value)
         
         canvas.startRadio = CGFloat(startRadio.value)
         
         canvas.endRadio = CGFloat(endRadio.value)
         
         canvas.setNeedsDisplay()
     }
     
     
     
     
     override func viewDidLoad() {
         super.viewDidLoad()

         // Do any additional setup after loading the view.
         startX.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
         startY.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
         endX.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
         endY.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
         
         startRadio.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
         endRadio.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
     }
     
     
       
       
       @IBAction func seleccionarColor1(_ sender: Any) {
           
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
                   self.canvas.color1 = color
                  self.dibujarGradiente()
               }
               alertController.addAction(action)
           }

           let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
           alertController.addAction(cancelAction)

           present(alertController, animated: true, completion: nil)
       }
       
       
       
     
       @IBAction func seleccionarColor3(_ sender: Any) {
           
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
                                       self.canvas.color3 = color
                                      self.dibujarGradiente()
                                   }
                                   alertController.addAction(action)
                               }

                               let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
                               alertController.addAction(cancelAction)

                               present(alertController, animated: true, completion: nil)
       }
       
     
    
     
       @IBAction func seleccionarColor2(_ sender: UIButton) {
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
                                       self.canvas.color2 = color
                                      self.dibujarGradiente()
                                   }
                                   alertController.addAction(action)
                               }

                               let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
                               alertController.addAction(cancelAction)

                               present(alertController, animated: true, completion: nil)
       }
       

     
     
       @IBAction func botonAyuda(_ sender: UIButton) {
           let alertController = UIAlertController(title: "Ayuda", message: "La transición de colores ocurre a lo largo de una línea recta. Puedes controlar la dirección del gradiente (horizontal, vertical o diagonal) y los colores de inicio y fin.", preferredStyle: .alert)
                       let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                       alertController.addAction(okAction)
                       
                       // Crear una imagen
                       let image = UIImage(named: "gradiente")
                       let imageView = UIImageView(frame: CGRect(x: 25, y: 165, width: 100, height: 100))
                       imageView.image = image
                  
           
                          
                       // Añadir la imagen al UIAlertController
                       alertController.view.addSubview(imageView)
                       
                       // Ajustar el tamaño del UIAlertController
                       let height = NSLayoutConstraint(item: alertController.view!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 350)
                       alertController.view.addConstraint(height)
                       
                       present(alertController, animated: true, completion: nil)
       }
       
     
   }


//
//  ConversorViewController.swift
//  appTabBarViewController
//
//  Created by braulio on 09/06/24.
//

import UIKit

class ConversorViewController: UIViewController {
 
    var firstNumber: Int?
    var currentOperation: String?
    
    
    
    @IBOutlet weak var etqNumero: UILabel!
    
    @IBOutlet weak var slider1: UISlider!
    
    @IBOutlet weak var stepper1: UIStepper!
    
    @IBOutlet weak var segmento1: UISegmentedControl!
    
    
    @IBOutlet weak var txtSalida: UITextField!
    
    @IBOutlet weak var labelResultado: UILabel!
    
    
    /*
    @IBOutlet weak var etqNumero: UILabel!
    @IBOutlet weak var slider1: UISlider!
    @IBOutlet weak var stepper1: UIStepper!
    @IBOutlet weak var segmento1: UISegmentedControl!
    @IBOutlet weak var txtSalida: UITextField!
    @IBOutlet weak var labelResultado: UILabel!
    @IBOutlet weak var btnSuma: UIButton!
   */
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        etqNumero.text = "\(lround(Double(sender.value)))"
        stepper1.value = Double(sender.value)
        self.segmentSeleccionado(segmento1)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        etqNumero.text = "\(lround(Double(sender.value)))"
        slider1.value = Float(sender.value)
        self.segmentSeleccionado(segmento1)
    }
    
    @IBAction func segmentSeleccionado(_ sender: UISegmentedControl) {
        let indice: Int = sender.selectedSegmentIndex
        var num: Int = Int(etqNumero.text!)!
        
        if indice == 0 {
            if num < 0 {
                num *= -1
                num = 256 - num
            }
            let n = String(num, radix: 2)
            txtSalida.text = n
        }
        
        if indice == 1 {
            let n = String(num, radix: 8)
            txtSalida.text = n
        }
        if indice == 2 {
            let n = String(num, radix: 16)
            txtSalida.text = n
        }
    }
    
    
    
    @IBAction func btnSumaPressed(_ sender: UIButton) {
        if let number = Int(etqNumero.text!) {
            firstNumber = number
            currentOperation = "+"
            etqNumero.text = "0"
        }

    }
    
   
    @IBAction func btnRestaPressed(_ sender: UIButton) {
        if let number = Int(etqNumero.text!) {
                   firstNumber = number
                   currentOperation = "-"
                   etqNumero.text = "0"
               }
    }
    
    @IBAction func btnMultiPressed(_ sender: UIButton) {
        if let number = Int(etqNumero.text!) {
                   firstNumber = number
                   currentOperation = "*"
                   etqNumero.text = "0"
               }
    }
    

    @IBAction func btnDivPressed(_ sender: UIButton) {
        
        if let number = Int(etqNumero.text!) {
                   firstNumber = number
                   currentOperation = "/"
                   etqNumero.text = "0"
               }
    }
    
    
    @IBAction func btnResiduoPressed(_ sender: UIButton) {
        
        if let number = Int(etqNumero.text!) {
                   firstNumber = number
                   currentOperation = "%"
                   etqNumero.text = "0"
               }
    }
    
 
    @IBAction func btnEqualPressed(_ sender: Any) {
        if let operation = currentOperation, let firstNumber = firstNumber, let secondNumber = Int(etqNumero.text!) {
                   var result: Int?
                   
                   switch operation {
                   case "+":
                       result = firstNumber + secondNumber
                   case "-":
                       result = firstNumber - secondNumber
                   case "*":
                       result = firstNumber * secondNumber
                   case "/":
                       if secondNumber != 0 {
                           result = firstNumber / secondNumber
                       } else {
                           result = nil // Handle division by zero
                       }
                   case "%":
                       result = firstNumber % secondNumber
                   default:
                       result = nil
                   }
                   
                   if let result = result {
                       labelResultado.text = "Resultado: \(result)"
                   } else {
                       labelResultado.text = "Error"
                   }
                   
                   // Reset
                   self.firstNumber = nil
                   self.currentOperation = nil
               }
        
    }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        etqNumero.text = String(Int(slider1.value))
    }
}

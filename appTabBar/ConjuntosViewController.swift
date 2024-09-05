//
//  ConjuntosViewController.swift
//  appTabBarViewController
//
//  Created by braulio on 09/06/24.
//

import UIKit

class ConjuntosViewController: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource{

    var setA = Set<String>()
    var setB = Set<String>()
    
    let conjuntos = ["Union", "Intersección", "Diferencia", "Diferencia Simétrica", "Subconjunto", "Superconjunto"]

    
    
    @IBOutlet weak var txtConjuntoA: UITextField!
    
    @IBOutlet weak var txtConjuntoB: UITextField!
    
    
    @IBOutlet weak var labResultado: UILabel!
    
    @IBOutlet weak var btnAsignarSetA: UIButton!
    
    @IBOutlet weak var btnAsignarSetB: UIButton!
    
    
    @IBOutlet weak var pickerConjuntos: UIPickerView!
    
    /*
    @IBOutlet weak var txtConjuntoA: UITextField!
    @IBOutlet weak var txtConjuntoB: UITextField!
    @IBOutlet weak var labResultado: UILabel!
    @IBOutlet weak var btnAsignarSetA: UIButton!
    @IBOutlet weak var btnAsignarSetB: UIButton!
    @IBOutlet weak var pickerConjuntos: UIPickerView!
    
    */
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerConjuntos.delegate = self as UIPickerViewDelegate
        pickerConjuntos.dataSource = self as UIPickerViewDataSource
        
        txtConjuntoA.addTarget(self, action: #selector(txtSetAChanged(_:)), for: .editingChanged)
        txtConjuntoB.addTarget(self, action: #selector(txtSetBChanged(_:)), for: .editingChanged)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return conjuntos.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return conjuntos[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        performOperation(operation: conjuntos[row])
    }
    
    @objc func txtSetAChanged(_ sender: UITextField) {
        if let texto = sender.text, !texto.isEmpty {
            btnAsignarSetA.isEnabled = true
        } else {
            btnAsignarSetA.isEnabled = false
        }
    }
    
    @IBAction func btnAsignarSetA(_ sender: UIButton) {
        if let texto = txtConjuntoA.text, !texto.isEmpty {
            let conjunto = texto.components(separatedBy: ",")
            setA = Set(conjunto)
            txtConjuntoB.isEnabled = true
        }
    }
    
    @objc func txtSetBChanged(_ sender: UITextField) {
        if let texto = sender.text, !texto.isEmpty {
            btnAsignarSetB.isEnabled = true
        } else {
            btnAsignarSetB.isEnabled = false
        }
    }
    
    @IBAction func btnAsignarSetB(_ sender: UIButton) {
        if let texto = txtConjuntoB.text, !texto.isEmpty {
            let conjunto = texto.components(separatedBy: ",")
            setB = Set(conjunto)
        }
    }
    
    
    func performOperation(operation: String) {
        var resultado: [String] = []
        switch operation {
        case "Union":
            resultado = setA.union(setB).sorted()
        case "Intersección":
            resultado = setA.intersection(setB).sorted()
        case "Diferencia":
            resultado = setA.subtracting(setB).sorted()
        case "Diferencia Simétrica":
            resultado = setA.symmetricDifference(setB).sorted()
        case "Subconjunto":
            let esSubconjunto = setA.isSubset(of: setB)
            resultado = esSubconjunto ? ["A es subconjunto de B"] : ["A no es subconjunto de B"]
        case "Superconjunto":
            let esSuperconjunto = setA.isSuperset(of: setB)
            resultado = esSuperconjunto ? ["A es superconjunto de B"] : ["A no es superconjunto de B"]
        default:
            break
        }
        labResultado.text = resultado.joined(separator: ",")
    }
}


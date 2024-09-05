//
//  AutoLavadoViewController.swift
//  appTabBarViewController
//
//  Created by braulio on 09/06/24.
//

import UIKit

class AutoLavadoViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{


    let carro_servicio_duracion = [["Camioneta","Carro","Deportivo","Motocicleta","Bicicleta","Autobus"],["Prelavado","Lavado","Secado", "Aspirado","Detallado","Soporte"],["Lento🐌","Normal🐶","Rapido🐎","Express🐆"]]
    
    let preciosVehiculos: [String: Double] = [
        "Camioneta": 50.0,
        "Carro": 40.0,
        "Deportivo": 70.0,
        "Motocicleta": 30.0,
        "Bicicleta": 20.0,
        "Autobus": 100.0
    ]
    
    let preciosServicios: [String: Double] = [
        "Prelavado": 10.0,
        "Lavado": 20.0,
        "Secado": 15.0,
        "Aspirado": 25.0,
        "Detallado": 50.0,
        "Soporte": 35.0
    ]
    
    let preciosDuracion: [String: Double] = [
        "Lento🐌": 5.0,
        "Normal🐶": 10.0,
        "Rapido🐎": 15.0,
        "Express🐆": 20.0
    ]
    
    let imagenesVehiculos: [String: String] = [
        "Camioneta": "camioneta",
        "Carro": "tsuru",
        "Deportivo": "deportivo",
        "Motocicleta": "motocicleta",
        "Bicicleta": "bicicleta",
        "Autobus": "autobus"
    ]
    
   
   
    
    
    @IBOutlet weak var pickerView1: UIPickerView!
    
   
    @IBOutlet weak var vehiculo: UILabel!
    
    
    @IBOutlet weak var labelServicio: UILabel!
    
    @IBOutlet weak var duracion: UILabel!
    
    
    @IBOutlet weak var total: UILabel!
    
    @IBOutlet weak var imagenes: UIImageView!
    /*
    @IBOutlet weak var pickerView1: UIPickerView!
   
    @IBOutlet weak var vehiculo: UILabel!
    
    @IBOutlet weak var labelServicio: UILabel!
    
    
    @IBOutlet weak var duracion: UILabel!
    
    
    @IBOutlet weak var total: UILabel!
    

    @IBOutlet weak var imagenes: UIImageView!
    */
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView1.delegate = self
        pickerView1.dataSource = self
        
        // Inicializar etiquetas
        pickerView(pickerView1, didSelectRow: 0, inComponent: 0)
        pickerView(pickerView1, didSelectRow: 0, inComponent: 1)
        pickerView(pickerView1, didSelectRow: 0, inComponent: 2)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return carro_servicio_duracion[component].count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return carro_servicio_duracion[component][row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let carro = carro_servicio_duracion[0][pickerView.selectedRow(inComponent: 0)]
        let servicio = carro_servicio_duracion[1][pickerView.selectedRow(inComponent: 1)]
        let tiempo = carro_servicio_duracion[2][pickerView.selectedRow(inComponent: 2)]
        
        vehiculo.text = "Vehiculo: " + carro
        labelServicio.text = "Servicio: " + servicio
        duracion.text = "Duracion: " + tiempo
        
        // Asignar la imagen correspondiente al vehículo seleccionado
        if let imagenNombre = imagenesVehiculos[carro] {
            imagenes.image = UIImage(named: imagenNombre)
        }
        
        // Calcular el total
        let precioCarro = preciosVehiculos[carro] ?? 0
        let precioServicio = preciosServicios[servicio] ?? 0
        let precioDuracion = preciosDuracion[tiempo] ?? 0
        let totalPrecio = precioCarro + precioServicio + precioDuracion
        
        total.text = "Total: $\(totalPrecio)"
    }
}

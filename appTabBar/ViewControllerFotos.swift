//
//  ViewControllerFotos.swift
//  appTabBarViewController
//
//  Created by Guest User on 06/06/24.
//

import UIKit

class ViewControllerFotos: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var imageViewFotos: UIImageView!
    let imagePicker = UIImagePickerController()
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        
        self.imageViewFotos.alpha = 0.0
        
        UIImageView.animate(withDuration: 2){
            self.imageViewFotos.frame = CGRect(x: 0, y: 0, width: 361 , height: 256)
            self.imageViewFotos.center = self.view.center
            self.imageViewFotos.alpha = 1.0
            self.imageViewFotos.layer.cornerRadius = 50
        }
        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func btnPhotos(_ sender: UIButton) {
        
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker,animated: true,completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        {
            imageViewFotos.contentMode = .scaleAspectFill
            imageViewFotos.image = pickedImage
        }
        dismiss(animated: true,completion: nil)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

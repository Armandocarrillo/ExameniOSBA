//
//  OpcionesTableViewController.swift
//  ExameniOSBA
//
//  Created by Armando Carrillo on 10/02/21.
//

import UIKit

class OpcionesTableViewController: UITableViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var selfieLabel: UILabel!
    @IBOutlet weak var selfieImageView: UIImageView!
    @IBOutlet weak var graficasLabel: UILabel!
    @IBOutlet weak var graficasTitulo: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        guard let urlString = UserDefaults.standard.value(forKey: "url") as? String,
              let url = URL(string: urlString) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: {data, _, error in
        
            guard let data = data, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                let image = UIImage(data: data)
                self.selfieImageView.image = image
            }
        })
        task.resume()
        
        
        graficasLabel.text = "Una gráfica o representación gráfica es un tipo de representación de datos, generalmente numéricos, mediante recursos visuales (líneas, vectores, superficies o símbolos), para que se manifieste visualmente la relación matemática o correlación estadística que guardan entre sí. También es el nombre de un conjunto de puntos que se plasman en coordenadas cartesianas y sirven para analizar el comportamiento de un proceso o un conjunto de elementos o signos que permiten la interpretación de un fenómeno. La representación gráfica permite establecer valores que no se han obtenido experimentalmente sino mediante la interpolación (lectura entre puntos) y la extrapolación (valores fuera del intervalo experimental)"
        
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
    }

    let checkInSelfieCellIndexPath = IndexPath(row: 2, section: 0)
    let checkOutGraficsCellIndexPath = IndexPath(row: 3, section: 0)
    
    var isCheckInSelfieShown: Bool = false{
        didSet{
            selfieImageView.isHidden = !isCheckInSelfieShown
        }
    }
    
    var isCheckOutGraficsShown: Bool = false {
        didSet{
            
            
        }
    }
    
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch (indexPath.section, indexPath.row) {
        
        case (checkInSelfieCellIndexPath.section, checkInSelfieCellIndexPath.row):
            
            if isCheckInSelfieShown{
               return 414.0
            } else {
               return 0.0
            }
            
        case(checkOutGraficsCellIndexPath.section, checkOutGraficsCellIndexPath.row):
            
            if isCheckOutGraficsShown {
                
                return 400.0
                
            } else {
                return 400.0
            }
        default:
            return 44.0
        }
    }
        
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch (indexPath.section, indexPath.row) {
        case (checkInSelfieCellIndexPath.section, checkInSelfieCellIndexPath.row - 1):
            if ( isCheckInSelfieShown){
                isCheckInSelfieShown = false
            }  else {
                isCheckInSelfieShown = true
            }
            tableView.beginUpdates()
            tableView.endUpdates()
            
        
        default:
            break
        }
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    /*
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        // Verify all the conditions
        if let sdcTextField = textField as? SDCTextField {
            return sdcTextField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        } else {
            return false
        }
    
    }*/
    
    @IBAction func cameraButton(_ sender: UIButton) {
        
        let imagePicker = UIImagePickerController()
               imagePicker.delegate = self
        
        let alertController = UIAlertController(title: "Choose Image Source", message: nil, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            print("User selected camera action")
            let cameraAction = UIAlertAction(title: "Camera", style: .default, handler: {action in imagePicker.sourceType = .camera
                self.present(imagePicker, animated: true, completion: nil)
            })
            
            alertController.addAction(cameraAction)
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            print("User selected photo library action")
            let photoLibraryAction = UIAlertAction(title: "Photo library", style: .default, handler: {action in imagePicker.sourceType = .photoLibrary
                self.present(imagePicker, animated: true, completion: nil)
            })
            
            alertController.addAction(photoLibraryAction)
        }
        alertController.popoverPresentationController?.sourceView = sender
        present(alertController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info:[UIImagePickerController.InfoKey : Any]){
     /*
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            selfieImageView.image = selectedImage
            dismiss(animated: true, completion: nil)
        }*/
        dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            return
        }
        
        guard  let imageData = image.pngData() else {
            return
        }
        
        //let ref = storage.child("image./file.png")
        
        
    }
    
   
    

}

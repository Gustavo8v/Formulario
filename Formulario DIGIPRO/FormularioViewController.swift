//
//  FormularioViewController.swift
//  Formulario DIGIPRO
//
//  Created by Gustavo Gutierrez on 20/12/20.

import Foundation
import RealmSwift

class FormularioViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var datoFormularios: Results<DatosFormulario>!
    
    var notificacionToken: NotificationToken?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let realm = RealmService.shared.realm
        datoFormularios = realm.objects(DatosFormulario.self)
        
        
        notificacionToken = realm.observe{ Notification, realm in
            self.tableView.reloadData()
        }
        
        RealmService.shared.observeRealmErros(in: self) { (error) in
            print(error ?? "no error detected")
        
    }
        
}
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        notificacionToken?.invalidate()
        RealmService.shared.stopObservingErrors(in: self)
    }
    
    
    @IBAction func agregarFormulario() {
        AlertService.addAlert(in: self) { (nombre, apellidoPaterno, apellidoMaterno, correo, numero) in
            let newFormulario = DatosFormulario(nombre: nombre!, apellidoPaterno: apellidoPaterno!, apelllidoMaterno: apellidoMaterno!, correo: correo!, numero: numero!)
            RealmService.shared.create(newFormulario)
        }
        
    }
    
    
}



   
   
    
extension FormularioViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return datoFormularios.count
    }

    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FormularioLineCell") as?
                FormularioLineCell else { return UITableViewCell() }
        
        let datoFormulario = datoFormularios[indexPath.row]
        cell.configure(with: datoFormulario)

        // Configure the cell...

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 63
    }
    
}
 
extension FormularioViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selcted")
        let datosForm = datoFormularios[indexPath.row]
        AlertService.updateAlert(in: self, datosFormulario: datosForm) { (nombre, apellidoPaterno, apellidoMaterno, correo, numero) in
            let dict: [String: Any?] = ["nombre": nombre,
                                        "apellidoPaterno": apellidoPaterno,
                                        "apellidoMaterno": apellidoMaterno,
                                        "correo": correo,
                                        "numero": numero]
            RealmService.shared.update(datosForm, with: dict)
        }
        
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        let datosForm = datoFormularios[indexPath.row]
        
        RealmService.shared.delete(datosForm)
    }


   
}



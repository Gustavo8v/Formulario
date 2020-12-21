//
//  AlertasViewController.swift
//  Formulario DIGIPRO
//
//  Created by Gustavo Gutierrez on 20/12/20.
//

import UIKit

class AlertService {
    
    private init() {}
    
    static func addAlert(in vc: FormularioViewController,
                         completion: @escaping(String?, String?, String?, String?, String?) -> Void) {
        
        let alert = UIAlertController(title: "Añadir Formulario", message: nil, preferredStyle: .alert)
        alert.addTextField{ (nombre) in
            nombre.placeholder = "Agregar Nombre"
        }
        alert.addTextField{ (apellidoPaterno) in
            apellidoPaterno.placeholder = "Agregar Apellido Paterno"
    }
        alert.addTextField{ (apellidoMaterno) in
            apellidoMaterno.placeholder = "Agregar Apellido Materno"
}
        alert.addTextField{ (correo) in
            correo.placeholder = "Agregar Correo"
    }
        alert.addTextField{ (numero) in
            numero.placeholder = "Agregar Numero"
    }
        let action = UIAlertAction(title: "Agregar", style: .default) { (_) in
            guard let nombreF = alert.textFields?.first?.text,
                  let apellidoPF = alert.textFields?.last?.text,
                  let apellidoMF = alert.textFields?.last?.text,
                  let correoF = alert.textFields?.last?.text,
                  let celularF = alert.textFields?.last?.text
                  else { return }
            
            let nombre = nombreF == "" ? nil : nombreF
            let apellidoPaterno = apellidoPF == "" ? nil : apellidoPF
            let apellidoMaterno = apellidoMF == "" ? nil : apellidoMF
            let correo = correoF == "" ? nil : correoF
            let celular = celularF == "" ? nil : celularF
            
            completion(nombre, apellidoPaterno, apellidoMaterno, correo, celular)
            
        }
        
        alert.addAction(action)
        vc.present(alert, animated: true)
    
  }
    
    static func updateAlert(in vc: UIViewController,
                            datosFormulario: DatosFormulario,
                            completion: @escaping(String?, String?, String?, String?, String?) -> Void) {
        let alert = UIAlertController(title: "Añadir Formulario", message: nil, preferredStyle: .alert)
        alert.addTextField{ (nombre) in
            nombre.placeholder = "Agregar Nombre"
            nombre.text = datosFormulario.nombre
        }
        alert.addTextField{ (apellidoPaterno) in
            apellidoPaterno.placeholder = "Agregar Apellido Paterno"
            apellidoPaterno.text = datosFormulario.apellidoPaterno
    }
        alert.addTextField{ (apellidoMaterno) in
            apellidoMaterno.placeholder = "Agregar Apellido Materno"
            apellidoMaterno.text = datosFormulario.apellidoMaterno
}
        alert.addTextField{ (correo) in
            correo.placeholder = "Agregar Correo"
            correo.text = datosFormulario.correo
    }
        alert.addTextField{ (numero) in
            numero.placeholder = "Agregar Numero"
            numero.text = datosFormulario.numero
    }
        let action = UIAlertAction(title: "Agregar", style: .default) { (_) in
            guard let nombreF = alert.textFields?.first?.text,
                  let apellidoPF = alert.textFields?.last?.text,
                  let apellidoMF = alert.textFields?.last?.text,
                  let correoF = alert.textFields?.last?.text,
                  let celularF = alert.textFields?.last?.text
                  else { return }
            
            let nombre = nombreF == "" ? nil : nombreF
            let apellidoPaterno = apellidoPF == "" ? nil : apellidoPF
            let apellidoMaterno = apellidoMF == "" ? nil : apellidoMF
            let correo = correoF == "" ? nil : correoF
            let celular = celularF == "" ? nil : celularF
            
            completion(nombre, apellidoPaterno, apellidoMaterno, correo, celular)
        
    }
    
    
        alert.addAction(action)
        vc.present(alert, animated: true)
 
    }
    
    


}

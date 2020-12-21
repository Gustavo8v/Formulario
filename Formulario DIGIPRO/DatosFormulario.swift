//
//  DatosFormulario.swift
//  Formulario DIGIPRO
//
//  Created by Gustavo Gutierrez on 20/12/20.
//

import Foundation
import RealmSwift


@objcMembers class DatosFormulario: Object {
     dynamic var nombre: String = ""
     dynamic var apellidoPaterno: String = ""
     dynamic var apellidoMaterno: String = ""
     dynamic var correo: String = ""
     dynamic var numero: String = ""
        
    
    convenience init(nombre: String, apellidoPaterno:String, apelllidoMaterno:String, correo: String, numero: String){
        self.init()
        self.nombre = nombre
        self.apellidoPaterno = apellidoPaterno
        self.apellidoMaterno = apelllidoMaterno
        self.correo = correo
        self.numero = numero
    }
    
    
}

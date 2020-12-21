//
//  FormularioLineCell.swift
//  Formulario DIGIPRO
//
//  Created by Gustavo Gutierrez on 20/12/20.
//

import UIKit


class FormularioLineCell: UITableViewCell {
    @IBOutlet weak var nombreFrmulario: UILabel!
    @IBOutlet weak var apellidoPaterno: UILabel!
    @IBOutlet weak var apellidoMaterno: UILabel!
    @IBOutlet weak var correo: UILabel!
    @IBOutlet weak var numero: UILabel!
    
    func configure(with datosFormulario: DatosFormulario) {
        nombreFrmulario.text = datosFormulario.nombre
        apellidoPaterno.text = datosFormulario.apellidoPaterno
        apellidoMaterno.text = datosFormulario.apellidoMaterno
        correo.text = datosFormulario.correo
        numero.text = datosFormulario.numero
    }
}

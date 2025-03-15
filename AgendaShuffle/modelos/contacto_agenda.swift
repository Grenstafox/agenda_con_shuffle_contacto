//
//  contacto_agenda.swift
//  ShuffleAgenda
//
//  Created by alumno on 26/02/25.
//

import SwiftUI

struct ContactoAgenda: Identifiable {
    var nombre: String
    var telefono: String
    
    var imagen1: String = "nuke"
    var imagen2: String = "selfie"
    var imagen3: String = "elguapo"
    var imagen4: String = "elotaku"
    var id: String { nombre }
}

/*
var nombre = "Pepito Veraz"

var _nombre: String

var nombre: set{
    let nombre_validado = filtrar_palabras(value)
    _nombre = nombre_validado
} get {
    return _nombre.split(" ")[0]
}
*/

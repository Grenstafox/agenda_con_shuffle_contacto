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
    
    var imagen: String = "nuke"
    
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

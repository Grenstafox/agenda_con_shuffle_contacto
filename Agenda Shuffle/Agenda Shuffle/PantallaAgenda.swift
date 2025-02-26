//
//  PantallaAgenda.swift
//  Agenda Shuffle
//
//  Created by alumno on 2/26/25.
//

import SwiftUI

let contactos = [
ContactoAgenda(nombre: "juan", telefono: "123456" ),
ContactoAgenda(nombre: "juana", telefono: "123456" ),
ContactoAgenda(nombre: "juancho", telefono: "123456" ),
ContactoAgenda(nombre: "juanpa", telefono: "123456" ),
ContactoAgenda(nombre: "joana", telefono: "123456" ),
ContactoAgenda(nombre: "judini", telefono: "123456" ),
ContactoAgenda(nombre: "juan", telefono: "123456" ),
ContactoAgenda(nombre: "juan", telefono: "123456" ),
ContactoAgenda(nombre: "juan", telefono: "123456" ),
ContactoAgenda(nombre: "juan", telefono: "123456" ),
ContactoAgenda(nombre: "juan", telefono: "123456" ),
]

struct PantallaAgenda: View {
    var body: some View {
        
        List{
            VStack {
                ForEach(contactos){ contacto in
                    Text("\(contacto.nombre)")
                    ContactoPrevista()
                }
            }
            .background(Color.cyan)
        }
    }
}


#Preview {
    PantallaAgenda()
}

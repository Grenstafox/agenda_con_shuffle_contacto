//
//  contacto_prevista.swift
//  ShuffleAgenda
//
//  Created by alumno on 26/02/25.
//

import SwiftUI


let contato_prueba = ContactoAgenda(nombre: "Nuke", telefono: "12345")

struct ContactoPrevista: View {
    var contacto_a_mostar: ContactoAgenda
    var al_pulsar: () -> Void = { print("No se ha implementado") }
    
    let esquinas_redondeadas = CGSize(width: 25, height: 25)
    let esquinas_redondeadas2 = CGSize(width: 50, height: 50)
    
    var body: some View {
        HStack(alignment: VerticalAlignment.center, spacing: 10){
            Spacer()
            
            VStack {
                Image(contacto_a_mostar.imagen1)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 75, alignment: .center)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerSize: esquinas_redondeadas))
            }
            .background(Color.purple)
            .clipShape(RoundedRectangle(cornerSize: esquinas_redondeadas))
            .frame(height: 85, alignment: .center)
            
            Spacer()
            
            VStack(alignment: HorizontalAlignment.leading, spacing: 10){
                Text(contacto_a_mostar.nombre)
                Text(contacto_a_mostar.telefono)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.white)
            
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .shadow(color: .black, radius: 10, x: 5, y: 5)
        .background(Color.red)
 
        .clipShape(RoundedRectangle(cornerSize: esquinas_redondeadas))
        // TAmbien se puede agragar un UnevenRoundedRectangle
        .onTapGesture {
            al_pulsar()
        }       .shadow(color: .black, radius: 10, x: 5, y: 5)

    }
}

#Preview {
    ContactoPrevista(contacto_a_mostar: contato_prueba)
}

//
//  pantalla_agregar_contacto.swift
//  ShuffleAgenda
//
//  Created by alumno on 3/3/25.
//

import SwiftUI

struct pantalla_agregar_contacto: View {
    @State private var nombre: String = ""
    @State private var numero_telefonico: String = ""
    @State private var imagen_seleccionada: String = "imagen"
    
    var boton_salir: () -> Void = {
        print("PARECE QUE TE HAS EQUIVOCADO")
    }
    var boton_agregar: (_ nombre: String, _ numero: String, _ imagen: String) -> Void = {nombre, numero, imagen in
        print("PARECE QUE TE HAS EQUIVOCADO")
    }
    
    var body: some View {
        Text("Colocar la etiqueta de nombre")
        ZStack{
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 75)
                .foregroundColor(Color.cyan)
            TextField("PLace holder", text: $nombre)
                //.border(Rectangle(), width: 15)
                .padding(10)
        }

        
        Text("Colocar el campo del numero telefonico")
        TextField("Place holder numeros", text: $numero_telefonico)
            .frame(height: 35)
            .padding(10)
        
        HStack{
            // Este icono es para agregar a un contacto
            icono(tamaño: 65, ruta_icono: "person.crop.circle.badge.plus",
                  padding: 10)
            .onTapGesture {
                boton_agregar(nombre, numero_telefonico, imagen_seleccionada)
            }
            
            Spacer()
            // Este es para salir
            icono(tamaño: 65, ruta_icono: "return")
                .background(nombre == "" ? Color.red: Color.cyan)
                .onTapGesture {
                    boton_salir()
                }
        }
        .background(Color.cyan)
        
        HStack{
            Image("nuke")
                .resizable()
                .scaledToFit()
                .frame(height: 75)
                .onTapGesture {
                    imagen_seleccionada = "imagen"
                }
            Image("nuke")
                .resizable()
                .scaledToFit()
                .frame(height: 75)
                .onTapGesture {
                    imagen_seleccionada = "imagen2"
                }
        }
    }
}

#Preview {
    pantalla_agregar_contacto()
}

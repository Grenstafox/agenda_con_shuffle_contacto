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
    let esquinas_redondeadas = CGSize(width: 25, height: 25)
    let esquinas_redondeadas2 = CGSize(width: 50, height: 50)
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
                .foregroundColor(Color.red)
            TextField("Place holder", text: $nombre)
                //.border(Rectangle(), width: 15)
                .padding(10)
        }.clipShape(RoundedRectangle(cornerSize: esquinas_redondeadas))
            .shadow(color: .black, radius: 10, x: 5, y: 5)
        
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
            }.shadow(color: .black, radius: 10, x: 5, y: 5)
            
            Spacer()
            // Este es para salir
            icono(tamaño: 65, ruta_icono: "return")
                .background(nombre == "" ? Color.white: Color.cyan)
                .clipShape(RoundedRectangle(cornerSize: esquinas_redondeadas))
                .onTapGesture {
                    boton_salir()
                }.shadow(color: .black, radius: 10, x: 5, y: 5)
        }
        .background(Color.red)
        .clipShape(RoundedRectangle(cornerSize: esquinas_redondeadas))
        .shadow(color: .black, radius: 10, x: 5, y: 5)
        
        HStack {
            ZStack {
                // Primer círculo (fondo)
                Circle()
                    .frame(width: 90)
                    .foregroundColor(Color.red)
                
                // Segundo círculo (más pequeño)
                Circle()
                    .frame(width: 65, height: 65)
                    .foregroundColor(Color.white)
                
                // Imagen encima de los círculos
                Image("elguapo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 50) // Ajusta el tamaño de la imagen para que se ajuste bien en el espacio
                    .clipShape(Circle()) // Asegura que la imagen esté recortada como un círculo
                    .onTapGesture {
                        imagen_seleccionada = "imagen"
                    }
                    .shadow(color: .black, radius: 10, x: 5, y: 5)
            }
            
            ZStack {
                // Primer círculo (fondo)
                Circle()
                    .frame(width: 90)
                    .foregroundColor(Color.red)
                
                // Segundo círculo (más pequeño)
                Circle()
                    .frame(width: 65, height: 65)
                    .foregroundColor(Color.white)
                
                // Imagen encima de los círculos
                Image("otaku")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 50)
                    .clipShape(Circle())
                    .onTapGesture {
                        imagen_seleccionada = "imagen2"
                    }
                    .shadow(color: .black, radius: 10, x: 5, y: 5)
            }
            
            ZStack {
                // Primer círculo (fondo)
                Circle()
                    .frame(width: 90)
                    .foregroundColor(Color.red)
                
                // Segundo círculo (más pequeño)
                Circle()
                    .frame(width: 65, height: 65)
                    .foregroundColor(Color.white)
                
                // Imagen encima de los círculos
                Image("selfie")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 50)
                    .clipShape(Circle())
                    .onTapGesture {
                        imagen_seleccionada = "imagen"
                    }
                    .shadow(color: .black, radius: 10, x: 5, y: 5)
            }
            
            ZStack {
                // Primer círculo (fondo)
                Circle()
                    .frame(width: 90)
                    .foregroundColor(Color.red)
                
                // Segundo círculo (más pequeño)
                Circle()
                    .frame(width: 65, height: 65)
                    .foregroundColor(Color.white)
                
                // Imagen encima de los círculos
                Image("nuke")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 50)
                    .clipShape(Circle())
                    .onTapGesture {
                        imagen_seleccionada = "imagen2"
                    }
                    .shadow(color: .black, radius: 10, x: 5, y: 5)
            }
        }

    }
}

#Preview {
    pantalla_agregar_contacto()
}

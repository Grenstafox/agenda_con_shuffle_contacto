//
//  PantallaAgenda.swift
//  ShuffleAgenda
//
//  Created by alumno on 26/02/25.
//

import SwiftUI

enum PantallasDisponibles: String, Identifiable{
    case pantalla_agregar, pantalla_aleatorio
    
    var id: String { rawValue }
    
}


struct PantallaAgenda: View {
    var largo_de_pantalla = UIScreen.main.bounds.width
    var ancho_de_pantalla = UIScreen.main.bounds.height
    
    @State var mostrar_pantalla_agregar_contacto: Bool = false
    
    @State var contactos_actuales: [ContactoAgenda] = [
        ContactoAgenda(nombre: "Judsana", telefono: "12345"),
        ContactoAgenda(nombre: "Judsana", telefono: "12345"),
        ContactoAgenda(nombre: "Judsana", telefono: "12345"),
        ContactoAgenda(nombre: "Judsana", telefono: "12345"),
        ContactoAgenda(nombre: "Judsana", telefono: "12345"),
    ]
    
    @State var pantalla_a_mostrar: PantallasDisponibles?
    
    var body: some View {
        ScrollView {
                VStack(spacing: 10) {
                    ForEach(contactos_actuales){ contacto in
                        NavigationLink{
                            Text("Texto rando")
                        }label: {
                            ContactoPrevista(contacto_a_mostar: contacto)
                            
                        }
                    }
                    
                    .frame(alignment: Alignment.center)
                    .padding(10)
                    .background(Color.cyan)
                    
                }
            
        } .background(Color.green)
        HStack(alignment: VerticalAlignment.center, spacing: 25){
            
            ZStack{
                Circle()
                    .frame(width: 100)
                    .tint(Color.red)
                    .foregroundColor(Color.green)
                
                Rectangle()
                    .frame(width: 65, height: 65)
                    .foregroundColor(Color.cyan)
                Image(systemName: "plus")
                    .background(Color.red)
            }
            .padding(15)
            .onTapGesture {
                print("Falta implementar la seccion de agregar contacto")
                mostrar_pantalla_agregar_contacto.toggle()
            }
            
            Spacer()
            
            ZStack{
                Circle()
                    .frame(width: 100)
                    .tint(Color.red)
                    .foregroundColor(Color.green)
                
                Circle()
                    .frame(width: 65, height: 65)
                    .foregroundColor(Color.cyan)
                Image(systemName: "shuffle")
                    .background(Color.red)
            }
            .padding(15)
            .onTapGesture {
                print("Lanzar un intent para iniciar la llamada")
                pantalla_a_mostrar = PantallasDisponibles.pantalla_agregar
            }
        }.background(Color.purple)
            .sheet(isPresented: $mostrar_pantalla_agregar_contacto) {
                pantalla_agregar_contacto(
                    boton_salir: {
                        //pantalla = nil
                    },
                    boton_agregar: {nombre, numero,
                        imagen_seleccionada in
                        let contacto_nuevo = ContactoAgenda(nombre: nombre,
                        telefono: numero, imagen: imagen_seleccionada)
                        contactos_actuales.append(contacto_nuevo)
                        pantalla_a_mostrar = nil
                    }
                )
            }
            .sheet(item: $pantalla_a_mostrar){ pantalla in
                switch(pantalla){
                case .pantalla_agregar:
                    Text("Adios mundo")
                case .pantalla_aleatorio:
                    Text("NOs vemos mundo")
                }
            }

    }
}




#Preview {
    PantallaAgenda()
}

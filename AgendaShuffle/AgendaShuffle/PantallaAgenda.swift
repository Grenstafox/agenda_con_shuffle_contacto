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
    let esquinas_redondeadas = CGSize(width: 25, height: 25)
    let esquinas_redondeadas2 = CGSize(width: 50, height: 50)
    let esquinas_redondeadas3 = CGSize(width: 10, height: 10)
    
    @State var mostrar_pantalla_agregar_contacto: Bool = false
    
    @State var contactos_actuales: [ContactoAgenda] = [
        ContactoAgenda(nombre: "Jose Luis", telefono: "12345"),
        ContactoAgenda(nombre: "Maria Susana", telefono: "54321"),
        ContactoAgenda(nombre: "Javier Herrera", telefono: "53421"),
        ContactoAgenda(nombre: "Jose Torres", telefono: "15432"),
        ContactoAgenda(nombre: "Guadalupe Hidalgo", telefono: "42135s"),
    ]
    
    @State var pantalla_a_mostrar: PantallasDisponibles?
    
    var body: some View {
        ScrollView {
                VStack(spacing: 10) {
                    ForEach(contactos_actuales){ contacto in
                        NavigationLink{
                            Text("Texto Random")
                        }label: {
                            ContactoPrevista(contacto_a_mostar: contacto)
                            
                        }
                    }
                    .frame(height: 55)
                    .frame(alignment: Alignment.center)
                    .padding(30)
                    .background(Color.indigo)
                    
                }
            
        } .background(Color.teal)
        HStack(alignment: VerticalAlignment.center, spacing: 25){
            
            ZStack{
                Circle()
                    .frame(width: 100)
                    .tint(Color.red)
                    .foregroundColor(Color.black)
                
                Circle()
                    .frame(width: 65, height: 65)
                    .foregroundColor(Color.white)
                Image(systemName: "plus")
                    .background(Color.blue)
            }
            .padding(15)
            .onTapGesture {
                print("Falta implementar la seccion de agregar contacto")
                mostrar_pantalla_agregar_contacto.toggle()
            }.shadow(color: .black, radius: 10, x: 5, y: 5)
            
            Spacer()
            
            ZStack{
                Circle()
                    .frame(width: 100)
                    .tint(Color.red)
                    .foregroundColor(Color.black)
                
                Circle()
                    .frame(width: 65, height: 65)
                    .foregroundColor(Color.white)
                Image(systemName: "shuffle")
                    .background(Color.blue)

            }
            .padding(15)
            .onTapGesture {
                print("Lanzar un intent para iniciar la llamada")
                pantalla_a_mostrar = PantallasDisponibles.pantalla_agregar
            }.shadow(color: .black, radius: 10, x: 5, y: 5)
        }.background(Color.cyan)
            .sheet(isPresented: $mostrar_pantalla_agregar_contacto) {
                pantalla_agregar_contacto(
                    boton_salir: {
                        //pantalla = nil
                    },
                    boton_agregar: {nombre, numero,
                        imagen_seleccionada in
                        let contacto_nuevo = ContactoAgenda(nombre: nombre,
                        telefono: numero, imagen1: imagen_seleccionada)
                        contactos_actuales.append(contacto_nuevo)
                        pantalla_a_mostrar = nil
                    }
                )
            }
            .sheet(item: $pantalla_a_mostrar) { pantalla in
                switch(pantalla) {
                case .pantalla_agregar:
                    VStack {
                        // Texto "Adios mundo" con un tamaño más grande
                        Text("Adios mundo")
                            .font(.system(size: 50, weight: .bold)) // Aumenta el tamaño y hace el texto más grueso
                            .foregroundColor(.orange)
                            .background(.black)// Cambia el color del texto
                            .padding() // Añade padding para separar el texto de la imagen

                        // Imagen
                        Image("nuke")  // Cambia "tu_imagen" por el nombre de la imagen  .resizable()  // Hace que la imagen sea redimensionable
                            .scaledToFill()  // Ajusta la imagen para llenar el espacio, recortando si es necesario
                            .frame(maxWidth: .infinity, maxHeight: .infinity)  // Hace que ocupe todo el espacio disponible
                            .clipped()  // Recorta la imagen si se sale del contenedor
                            .padding() // Añade padding alrededor de la imagen
                    }
                case .pantalla_aleatorio:
                    Text("Nos vemos mundo")
                }
            }
    }
}




#Preview {
    PantallaAgenda()
}

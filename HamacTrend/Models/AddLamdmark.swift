//
//  AddLamdmark.swift
//  HamacTrend
//
//  Created by stephane verardo on 27/01/2020.
//  Copyright © 2020 stephane verardo. All rights reserved.
//

import SwiftUI

struct AddLamdmark: View {
    @Binding var showAddLandmarkView: Bool
    @State private var name: String = ""
    @State private var commentaire: String = ""
    @State var showImagePicker: Bool = false
    @State var image: Image? = nil
   // @State var location: Location
    
    var body: some View {
            NavigationView {
                
                //MapView
                
                //Image
                VStack{
//                    MapView(coordinates: location.previousLocation?.coordinate)
//                    .edgesIgnoringSafeArea(.top)
//                    .frame(height: 300)
                    // ImagePicker
                    VStack {
                            Button(action: {
                                 withAnimation {
                                     self.showImagePicker.toggle()
                                 }
                             }) {
                                 Text("Show image picker")
                             }
                            image?
                            .resizable()
                            .frame(width: 300, height: 300)
                            .clipShape(Circle())
                            .scaledToFill()
                        .overlay(
                            Circle().stroke(Color.white, lineWidth: 4))
                        .shadow(radius: 10)
                        
                        }
                        .sheet(isPresented: $showImagePicker) {
                            ImagePicker(image: self.$image)
                        }
                    
                    // Navigation retour
                    VStack{
                        TextField("Nom du lieu", text: $name)
                        TextField("Commentaires", text: $commentaire)
//                        Text("Hello, \(name)")
                            .edgesIgnoringSafeArea(.top)
                             .navigationBarItems(trailing: Button(action: {
                                // TODO : enrgeistrer l'image dans la FirebaseDatabase et l'afficher dans la liste
                                      print("Dismissing sheet view...")
                                      self.showAddLandmarkView = false
                                  }) {
                                      Text("Valider").bold()
                                       .foregroundColor(.yellow)
                                  })
                  
                        
                      
                     
                    }
        }
                  
    }
        
}
}


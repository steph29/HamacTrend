//
//  LandmarkDetail.swift
//  SpotAHamac
//
//  Created by stephane verardo on 13/01/2020.
//  Copyright © 2020 stephane verardo. All rights reserved.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var userData: UserData
    var landmark: Landmark
    @State private var showingAlert = false

    
    var landmarkIndex: Int {
        userData.landmarks.firstIndex(where: { $0.id == landmark.id})!
    }
    
   var body: some View {
            VStack{
                MapView(coordinates: landmark.locationCoordinate)
                             .edgesIgnoringSafeArea(.top)
                             .frame(height: 300)

                         CircleImage(image: landmark.image)
                             .offset(y: -130)
                             .padding(.bottom, -130)
                VStack{
                    VStack(alignment: .leading) {
                       HStack{
                           Text(landmark.name)
                           .font(.title)
                           
                           Button(action: {
                               self.userData.landmarks[self.landmarkIndex].isFavorite.toggle()
                           }) {
                               if self.userData.landmarks[self.landmarkIndex].isFavorite {
                                   Image(systemName: "star.fill")
                                       .foregroundColor(Color.yellow)
                               } else {
                                   Image(systemName: "star")
                                       .foregroundColor(Color.gray)
                               }
                           }
                       }
                        

                        HStack(alignment: .top) {
                            Text(landmark.park)
                                .font(.subheadline)
                            Spacer()
                            Text(landmark.state)
                                .font(.subheadline)
                        }
                    }
                    Spacer()
                    Button(action: {
                            self.showingAlert = true
                        }) {
                         
                            Image(systemName: "paperplane.fill")
                            .foregroundColor(.yellow)
                            Text("C'est parti")
                            .foregroundColor(.yellow)
                        }
                        .actionSheet(isPresented: $showingAlert) {
                            ActionSheet(title: Text("Choississez votre navigateur favori"), message: nil, buttons: [
                                .default(Text("Google Maps")),
                                .default(Text("Plans")),
                                .default(Text("Waze")),
                                .default(Text("Restez avec HamacTrend")),
                                .cancel()
                            ])
                        }
                
                         
                .padding()
                
                Spacer()
            }
             .navigationBarTitle(Text(landmark.name), displayMode: .inline)
        }
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarkData[0])
        .environmentObject(UserData())
    }
}

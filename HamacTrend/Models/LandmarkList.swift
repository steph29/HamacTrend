//
//  LandmarkList.swift
//  SpotAHamac
//
//  Created by stephane verardo on 13/01/2020.
//  Copyright © 2020 stephane verardo. All rights reserved.
//

import SwiftUI
import Firebase

struct LandmarkList: View {
    @EnvironmentObject private var userData: UserData
    @State var showAddLandmarkView = false
    //@State var location: Location
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $userData.showFavoritesOnly) {
                    Text("Mes spots fétiches")
                }
                
                ForEach(userData.landmarks) { landmark in
                    if !self.userData.showFavoritesOnly || landmark.isFavorite {
                        NavigationLink(
                            destination: LandmarkDetail(landmark: landmark)
                                .environmentObject(self.userData)
                        ) {
                            LandmarkRow(landmark: landmark)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Spot à hamac"), displayMode: .large)
                .navigationBarItems(trailing: Button(action: {
                    self.showAddLandmarkView.toggle()
                 
            }) {
                Text("Ajouter").bold()
                    .foregroundColor(.yellow)
            })
        }.sheet(isPresented: $showAddLandmarkView) {
            AddLamdmark(showAddLandmarkView: self.$showAddLandmarkView)
        }
    }
}

struct LandmarksList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
        .environmentObject(UserData())
    }
}

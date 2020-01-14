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
    
    var body: some View {
        NavigationView {
            List(landmarkData) { landmark in
                            NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                                LandmarkRow(landmark: landmark)

                            }
                        }
                     .navigationBarTitle(Text("Spot à hamac"))
                .navigationBarItems(trailing: Button(action: {
                print("Ajout de spot")
            }) {
                Image(systemName: "plus")
            })
             }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
          ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
                  LandmarkList()
                      .previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName)
              }
    }
}

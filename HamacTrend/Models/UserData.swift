//
//  UserData.swift
//  HamacTrend
//
//  Created by stephane verardo on 15/01/2020.
//  Copyright © 2020 stephane verardo. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject{
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
}


//
//  DiceAppApp.swift
//  DiceApp
//
//  Created by Vinay Desiraju on 2/22/23.
//

import SwiftUI

@main
struct DiceAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(GameModel())
        }
    }
}

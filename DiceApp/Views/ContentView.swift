//
//  ContentView.swift
//  SimpleDiceGame
//
//  Created by Vinay Desiraju on 2/22/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //GameView is the first screen that a user sees.
        GameView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(GameModel())
    }
}

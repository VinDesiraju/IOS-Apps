//
//  DiceImageView.swift
//  SimpleDiceGame
//
//  Created by Vinay Desiraju on 2/22/23.
//

import SwiftUI

struct DiceImageView: View {
    //variables for all four dice.
    var playerDiceImg1: Image
    var playerDiceImg2: Image
    var computerDiceImg1: Image
    var computerDiceImg2: Image
    
    
    var body: some View {
        HStack(){
            VStack{
                // This stack has the player label and both his dice.
                Text("Player")
                    .foregroundColor(Color.red)
                    .fontWeight(.bold)
                HStack{
                    //this horizontal stack contains the 2 player dice.
                    playerDiceImg1
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Rectangle())
                        .frame(width: 50, height: 50)
                    playerDiceImg2
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Rectangle())
                        .frame(width: 50, height: 50)
                }
            }
            Spacer()
            // The text field to display VS
            Text("vs")
                .font(.largeTitle)
                .foregroundColor(Color.red)
                .padding(.top,25)
                .fontWeight(.medium)
            Spacer()
            VStack{
                // This stack has the computer label and both its dice.
                Text("Computer")
                    .foregroundColor(Color.red)
                    .fontWeight(.bold)
                HStack{
                    //this horizontal stack contains the 2 computer dice.
                    computerDiceImg1
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Rectangle())
                        .frame(width: 50, height: 50)
                    computerDiceImg2
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Rectangle())
                        .frame(width: 50, height: 50)
                }
            }
        }
        .padding(50)
    }
}

struct DiceImageView_Previews: PreviewProvider {
    static var previews: some View {
        // The diceImageView is passed its parameters, which are the 4 dice.
        DiceImageView(playerDiceImg1: Image("Dice1"),
                      playerDiceImg2: Image("Dice1"),
                      computerDiceImg1: Image("Dice1"),
                      computerDiceImg2: Image("Dice1")
                      )
    }
}

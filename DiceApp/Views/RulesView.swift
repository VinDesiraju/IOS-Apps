//
//  GameRulesView.swift
//  SimpleDiceGame
//
//  Created by Vinay Desiraju on 2/24/23.
//

import SwiftUI

struct RulesView: View {
    
    //Environment variables to read values stored in a view’s environment
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var body: some View {
        // for horizontal = compact and vertical = compact traits
        if(horizontalSizeClass == .compact && verticalSizeClass == .compact)
        {
            ScrollView
            {
                ZStack{
                    //set background image
                    Image("BGD")
                        .resizable()
                        .frame(maxWidth: .infinity,maxHeight: .infinity)
                        .ignoresSafeArea()
                    VStack{
                        //set page title
                        Text("HOW TO PLAY")
                            .foregroundColor(.brown)
                            .font(.title)
                            .padding(.bottom,5)
                        VStack(alignment: .leading){
                            //List of rules
                            Text("1. The player and computer have two dice each.")
                                .foregroundColor(.brown)
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.system(size: 16))
                                .fontWeight(.heavy)
                            Text("2. Place your bet and roll.")
                                .foregroundColor(.white)
                                .font(.system(size: 16))
                                .fontWeight(.heavy)
                                .padding(.top,3)
                            Text("3. The game will roll all 4 dice at once.")
                                .foregroundColor(.brown)
                                .font(.system(size: 16))
                                .fontWeight(.heavy)
                                .padding(.top,3)
                            Text("4. If dice 1 of the player is atleast equal to dice 1 of the computer and dice 2 of the player is atleast equal to dice 2 of the computer, you get twice your money.")
                                .font(.system(size: 16))
                                .foregroundColor(.white)
                                .fontWeight(.heavy)
                                .fixedSize(horizontal: false, vertical: true)
                                .padding(.top,3)
                            Text("5. Similarly, if they are less than the computer's dice, then youlose your bet money.")
                                .font(.system(size: 16))
                                .foregroundColor(.brown)
                                .fontWeight(.heavy)
                                .fixedSize(horizontal: false, vertical: true)
                                .padding(.top,3)
                            Text("6. And for any other result, you get back your bet money. You neither win nor lose.")
                                .font(.system(size: 16))
                                .foregroundColor(.white)
                                .fontWeight(.heavy)
                                .fixedSize(horizontal: false, vertical: true)
                                .padding(.top,3)
                        }
                    }
                    //Button to go back to game.
                    Button("Back to Game"){
                        presentationMode.wrappedValue.dismiss()
                    }
                    .foregroundColor(.white)
                    .padding(.top, 2)
                    Spacer()
                }
                
            }
        }
        else //for all other type of devices
        {
            ZStack{
                //set background image
                Image("BGD")
                    .resizable()
                    .frame(maxWidth: .infinity,maxHeight: .infinity)
                    .ignoresSafeArea()
                VStack{
                    Spacer()
                    //set page title
                    Text("HOW TO PLAY")
                        .fontWeight(.bold)
                        .foregroundColor(.brown)
                        .font(.system(size: 40))
                        .padding(.bottom,50)
                    VStack(alignment: .leading){
                        //List of rules
                        Text("1. The player and computer have two dice each.")
                            .font(.system(size: 18))
                            .foregroundColor(.brown)
                            .fontWeight(.heavy)
                            .padding(.top,10)
                            .padding(.leading,10)
                            .padding(.trailing,10)
                        Text("2. Place your bet and roll.")
                            .font(.system(size: 18))
                            .foregroundColor(.white)
                            .fontWeight(.heavy)
                            .padding(.top,5)
                            .padding(.leading,10)
                            .padding(.trailing,10)
                        Text("3. The game will roll all 4 dice at once.")
                            .font(.system(size: 18))
                            .foregroundColor(.brown)
                            .fontWeight(.heavy)
                            .padding(.top,5)
                            .padding(.leading,10)
                            .padding(.trailing,10)
                        Text("4. If dice 1 of the player is atleast equal to dice 1 of the computer and dice 2 of the player is atleast equal to dice 2 of the computer, you get twice your money.")
                            .font(.system(size: 18))
                            .foregroundColor(.white)
                            .fontWeight(.heavy)
                            .padding(.top,10)
                            .padding(.leading,10)
                            .padding(.trailing,10)
                        Text("5. Similarly, if they are less than the computer's dice, then youlose your bet money.")
                            .font(.system(size: 18))
                            .foregroundColor(.brown)
                            .fontWeight(.heavy)
                            .padding(.top,10)
                            .padding(.leading,10)
                            .padding(.trailing,10)
                        Text("6. And for any other result, you get back your bet money. You neither win nor lose.")
                            .font(.system(size: 18))
                            .foregroundColor(.white)
                            .fontWeight(.heavy)
                            .padding(.top,10)
                            .padding(.leading,10)
                            .padding(.trailing,10)
                        
                    }
                    //button to go back to game.
                    Button("Back to Game"){
                        presentationMode.wrappedValue.dismiss()
                    }
                    .font(.system(size: 18))
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
                    .padding(.top, 80)
                    Spacer()
                }
            }
        }
           
    }
}

struct GameRulesView_Previews: PreviewProvider {
    static var previews: some View {
        RulesView()
    }
}

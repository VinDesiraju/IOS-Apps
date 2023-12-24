//
//  GameView.swift
//  SimpleDiceGame
//
//  Created by Vinay Desiraju on 2/22/23.
//

import SwiftUI

struct GameView: View {
    //Environment variables to read values stored in a view’s environment
    @EnvironmentObject var gameModel : GameModel
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    //state variables for different pages and actions
    @State private var sliderAlert = false
    @State private var authorPage = false
    @State private var resetGame = false
    @State private var rulesPage = false
    
    var body: some View {
        // for horizontal = compact and vertical = compact traits
        if(horizontalSizeClass == .compact && verticalSizeClass == .compact)
        {
            ZStack{
                //set background image
                Image("BGD")
                    .resizable()
                    .frame(maxWidth: .infinity,maxHeight: .infinity)
                    .ignoresSafeArea()
                VStack{
                    // set game title
                    Text("The Dice Gambler")
                        .foregroundColor(.white)
                        .font(.title)
                        .padding(.top, 20)
                        .fontWeight(.heavy)
                    HStack{
                        // horizontal stack to display the total money and number of rounds played.
                        Text("Total Money: \(gameModel.totalMoney)$")
                            .foregroundColor(.white)
                            .padding(/*@START_MENU_TOKEN@*/.trailing, 41.0/*@END_MENU_TOKEN@*/)
                            .fontWeight(.medium)
                        Text("Round: \(gameModel.round)")
                            .foregroundColor(.white)
                            .fontWeight(.medium)
                        Button(action: {
                            rulesPage = true
                        }) {
                            // info button to show the game rules
                            Image("info")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                        }.help(Text("Game Rules")).fullScreenCover(isPresented: $rulesPage){
                            RulesView() // this will call the RulesView page
                        }
                    }.padding(.top,10)
                    // initializing the dice image view
                    DiceImageView(playerDiceImg1: Image("Dice\(gameModel.playerDice1)"),
                                  playerDiceImg2: Image("Dice\(gameModel.playerDice2)"),
                                  computerDiceImg1: Image("Dice\(gameModel.computerDice1)"),
                                  computerDiceImg2: Image("Dice\(gameModel.computerDice2)")
                                  )
                    .padding(.top,-80)
                    //selection of bet amount
                    Text("Select bet Amount:")
                        .foregroundColor(.white).fontWeight(.medium)
                        .fontWeight(.medium)
                    HStack{
                        // The slider to select the bet amount
                        SliderView(slidervalue: $gameModel.moneyBet).frame(width: 200)
                        Text("\(Int(gameModel.moneyBet))")
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                    }
                    // Roll button to roll the dice
                    Button("Roll"){
                        if(gameModel.moneyBet == 0.0)
                        {
                            sliderAlert = true
                        }
                        else
                        {
                            gameModel.RollButton() // this call invokes the RollButton function
                        }
                    }
                    .foregroundColor(.white)
                    .alert(isPresented: $sliderAlert){
                        // Slider alert to inform the user to place a bet before rolling the dice.
                        Alert(title: Text("Alert"), message: Text("Please place a Bet before rolling the Dice!!"), dismissButton: .default(Text("OK")))
                    }
                    // reset button to reset game
                    Button("Reset"){
                        resetGame = true
                    }
                    .foregroundColor(.red)
                    .alert(isPresented: $resetGame){
                        // alert to inform the user that they will lose all game progress.
                        Alert(title: Text("Alert"),
                              message: Text("If you click 'OK' this will reset your game and you will lose your current Progress."),
                              primaryButton: .default((Text("OK"))){
                            gameModel.reset()
                        },
                              secondaryButton: .cancel((Text("Cancel")))
                              {
                            resetGame = false
                        }
                        )
                    }
                    // This button will take the user to AuthorView page.
                    Button("About Creator!"){
                        authorPage = true
                    }
                    .foregroundColor(.white)
                    .fullScreenCover(isPresented: $authorPage){
                        AuthorView()
                    }
                }
            }
            
        }
        else // for all other type of devices
        {
        ZStack{
            //set background image
            Image("BGD")
                .resizable()
                .frame(maxWidth: .infinity,maxHeight: .infinity)
                .ignoresSafeArea()
            VStack{
                // set game title
                Text("The Dice Gambler")
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.heavy)
                HStack{
                    // horizontal stack to display the total money and number of rounds played.
                    Text("Total Money: \(gameModel.totalMoney)$")
                        .foregroundColor(.white)
                        .padding(.trailing,20)
                        .fontWeight(.medium)
                    Text("Round: \(gameModel.round)")
                        .foregroundColor(.white)
                        .fontWeight(.medium)
                        .padding(.trailing,20)
                    Button(action: {
                        rulesPage = true
                    }) {
                        // info button to show the game rules
                        Image("info")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                    }.help(Text("Game Rules")).fullScreenCover(isPresented: $rulesPage){
                        RulesView() // this will call the RulesView page
                    }
                }.padding(.top,20)
                // initializing the dice image view
                DiceImageView(playerDiceImg1: Image("Dice\(gameModel.playerDice1)"),
                              playerDiceImg2: Image("Dice\(gameModel.playerDice2)"),
                              computerDiceImg1: Image("Dice\(gameModel.computerDice1)"),
                              computerDiceImg2: Image("Dice\(gameModel.computerDice2)")
                              )
                // selection of bet amount
                Text("Select bet Amount:")
                    .foregroundColor(.white).fontWeight(.medium)
                    .multilineTextAlignment(.leading)
                HStack{
                    // The slider to select the bet amount
                    SliderView(slidervalue: $gameModel.moneyBet).frame(width: 200)
                    Text("\(Int(gameModel.moneyBet))")
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                }
                    // Roll button to roll the dice
                    Button("Roll"){
                        if(gameModel.moneyBet == 0)
                        {
                            sliderAlert = true
                        }
                        else
                        {
                            gameModel.RollButton() // this call invokes the RollButton function
                        }
                    }.foregroundColor(.white)
                    .padding(.top,10)
                        .alert(isPresented: $sliderAlert){
                            // Slider alert to inform the user to place a bet before rolling the dice.
                            Alert(title: Text("Alert"), message: Text("Please place a Bet before rolling the Dice!!"), dismissButton: .default(Text("OK")))
                        }
                    Button("Reset"){
                        // reset button to reset game
                        resetGame = true
                    }.foregroundColor(.red)
                    .padding(.top,10)
                        .alert(isPresented: $resetGame){
                            // alert to inform the user that they will lose all game progress.
                            Alert(title: Text("Alert"),
                                  message: Text("If you click 'OK' this will reset your game and you will lose your current Progress."),
                                  primaryButton: .default((Text("OK"))){
                                gameModel.reset()
                            },
                                  secondaryButton: .cancel((Text("Cancel")))
                                  {
                                resetGame = false
                            }
                            )
                        }
                // This button will take the user to AuthorView page.
                Button("About Creator!"){
                    authorPage = true
                }.foregroundColor(.white)
                .padding(.top,10)
                .fullScreenCover(isPresented: $authorPage){
                    AuthorView()
                }
            }
        }
        
    }
            }
            
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
            .environmentObject(GameModel())
    }
}

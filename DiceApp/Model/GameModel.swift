//
//  GameModel.swift
//  DiceApp
//
//  Created by Vinay Desiraju on 2/22/23.
//

import Foundation
import Combine

 class GameModel: ObservableObject{
     //variable for totalmoney in account
     @Published var totalMoney: Int = 0
     
     //variables for player dice
     @Published var playerDice1:Int = 0
     @Published var playerDice2:Int = 0
     
     //variables for computer dice
     @Published var computerDice1: Int = 0
     @Published var computerDice2: Int = 0
     
     //variable for number of rounds
     @Published var round: Int = 0
     
     //variable for amount being bet
     @Published var moneyBet: Double = 10.0
     
     //Action being performed when roll button is clicked
     func RollButton(){
         //generate player dice number randomly
         self.playerDice1 = Int.random(in: 1...6)
         self.playerDice2 = Int.random(in: 1...6)
         
         //generate computer dice numbers randomly
         self.computerDice1 = Int.random(in: 1...6)
         self.computerDice2 = Int.random(in: 1...6)
         
         //update money earned/lost
         
         //if playerDice1 >= computerDice1 and playerDice2 >= computerDice2, player gets twice the amount of money they bet.
         if(self.playerDice1>=self.computerDice1 && self.playerDice2>=self.computerDice2){
             self.totalMoney += 2*Int(self.moneyBet)
         }
         
         //if playerDice1 < computerDice1 and playerDice2 < computerDice2, player loses the money they bet.
         else if (self.playerDice1<self.computerDice1 && self.playerDice2<self.computerDice2){
             self.totalMoney += 0
         }
         
         // Any ther case, player gets their money back.
         else {self.totalMoney += Int(self.moneyBet)}
            
         //reset moneythat can be bet to 10 (minimum is 10$)
         self.moneyBet = 10.0
         
         //increase round
         self.round += 1
     }
     
     func reset()
     {
         //reset all fields to default
         self.totalMoney = 0
         
         self.playerDice1 = 0
         self.playerDice2 = 0
         
         self.computerDice1 = 0
         self.computerDice2 = 0
         
         self.round = 0
         
         self.moneyBet = 10.0
     }
    
}

//
//  AuthorView.swift
//  SimpleDiceGame
//
//  Created by Vinay Desiraju on 2/23/23.
//

import SwiftUI

struct AuthorView: View {
    
    @State private var showAlert = false
    //Environment variables to read values stored in a view’s environment
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    // for horizontal = compact and vertical = compact traits
    var body: some View {
        if(horizontalSizeClass == .compact && verticalSizeClass == .compact)
        {
            ZStack{
                //set background to BGD image from assets
                Image("BGD")
                    .resizable()
                    .frame(maxWidth: .infinity,maxHeight: .infinity)
                    .ignoresSafeArea()
                VStack{
                    //set Author image
                    Image("Author")
                        .clipShape(Circle())
                        .padding(.top,70)
                        .frame(height: 200)
                        //Author intro
                    Text("Hi, I am Vinay Desiraju, an enthusiastic and proactive coder. I am currently learning IOS development and will create more apps in the future. I am pursuing my Master's in Computer Science at Syracuse University.")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                        .padding(.top,50)
                        .fixedSize(horizontal: false, vertical: true)
                    //contact me button, which displays email of author when pressed.
                    Button("Contact me"){
                        showAlert = true
                    }
                    .alert(isPresented: $showAlert){
                        Alert(title: Text("Contact"), message: Text("adesiraj@syr.edu'").font(.largeTitle), dismissButton: .default(Text("OK")))
                    }
                    .foregroundColor(.white)
                    .padding(.top, 10)
                    //button to go back to the game.
                    Button("Back to Game"){
                        presentationMode.wrappedValue.dismiss()
                    }
                    .foregroundColor(.white)
                    .padding(.top, 5)
                }
            }
        }
            
        else // for all other type of devices
        {
            ZStack{
                //set background to BGD image from assets
                Image("BGD")
                    .resizable()
                    .frame(maxWidth: .infinity,maxHeight: .infinity)
                    .ignoresSafeArea()
                VStack{
                    //set Author image.
                    Image("Author")
                        .clipShape(Circle())
                        .padding(.bottom,80)
                    //Author intro
                    Text("Hi, I am Vinay Desiraju, an enthusiastic and proactive coder. I am currently learning IOS development and will create more apps in the future. I am pursuing my Master's in Computer Science at Syracuse University.")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                    //contact me button, which displays email of author when pressed.
                    Button("Contact me"){
                        showAlert = true
                    }
                    .alert(isPresented: $showAlert){
                        Alert(title: Text("Contact"), message: Text("adesiraj@syr.edu").font(.largeTitle), dismissButton: .default(Text("OK")))
                    }
                    .foregroundColor(.white)
                    .padding(.top, 20)
                    //button to go back to the game.
                    Button("Back to Game"){
                        presentationMode.wrappedValue.dismiss()
                    }
                    .foregroundColor(.white)
                    .padding(.top, 10)
                }
            }
        }
            }
            
}
struct AuthorView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorView()
    }
}

//
//  GameList.swift
//  GameAPI
//
//  Created by faiz on 16/04/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct GameList: View {
  @ObservedObject var gameViewModel = GameViewModel()
  
  var body: some View {
    NavigationView{
      List(gameViewModel.data){ item in
        NavigationLink(destination: GameDetail(game: item)){
          HStack{
            // jika fotonya ada
            if item.image != ""{
              WebImage(url: URL(string: item.image)!)
                .resizable()
                .scaledToFill()
                .frame(width: 120, height: 170)
                .background(Image("loader")
                              .resizable()
                              .aspectRatio(contentMode: .fill)
                              .frame(width: 60, height: 30))
                .cornerRadius(10)
            }
            else{
              Image("loader")
                .resizable()
                .frame(width: 120, height: 170)
                .cornerRadius(10)
            }
            
            VStack(alignment: .leading, spacing: 10){
              Text(item.title).fontWeight(.bold)
              
              Text(item.released).font(.caption)
                .lineLimit(4)
                .multilineTextAlignment(.leading)
            }
          }
        }
        
      }
      .navigationBarTitle(Text("Game"))
    }.navigationViewStyle(StackNavigationViewStyle())
    
  }
}

struct GameList_Previews: PreviewProvider {
  static var previews: some View {
    GameList()
  }
}


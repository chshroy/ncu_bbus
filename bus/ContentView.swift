//
//  ContentView.swift
//  bus
//
//  Created by royyaha on 19.12.19.
//  Copyright © 2019 royyaha. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    // @EnvironmentObject var favoriteRoutes: Order
    // @State var favoriteRoutes: [Route] = [Route.example, Route.example]
    @EnvironmentObject var favoriteRoutes: FavoriteRoutes
    @EnvironmentObject var allRoutes: AllRoutes
    
    var body: some View {
        List {
            Section(header:
                GeometryReader { geometry in
                    HStack {
                        Text("❤️最愛路線")
                            .foregroundColor(Color.red)
                        .frame(minWidth: 0, maxWidth: .infinity,alignment: .leading)
                            .padding(.leading)
                        Spacer()
                        Button (action: {
                            print("hehe")
                            print("hehe")
                            print("hehe")
                            print("hehe")
                            print("ok")
                        }) {
                            HStack {
                                Text("刷新")
                                    .foregroundColor(Color.red)
                                Image("renew")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30)
                                    .padding([.leading, .trailing], 2)
                                
                                    .foregroundColor(Color.red)
                            }.padding(.trailing)
                            
                        }
                    }
                }.background(Color.white)
                
            ) {
                ForEach(favoriteRoutes.routes) { favoriteRoute in
                    TimeTableCell(route: favoriteRoute, type: "favorite")
                    .frame(height: 100)
                }.onDelete(perform: deleteItems)
            }.listRowInsets(EdgeInsets())
            
            Section(header:
                GeometryReader { geometry in
                    HStack {
                        Text("全部")
                        .frame(minWidth: 0, maxWidth: .infinity,alignment: .leading)
                    }.padding(.leading)
                }
                .background(Color.white)
                
            ) {
                ForEach(allRoutes.routes) { route in
                    TimeTableCell(route: route, type: "")
                    .frame(height: 100)
                }
            }.listRowInsets(EdgeInsets())
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        favoriteRoutes.routes.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        .environmentObject(FavoriteRoutes())
        .environmentObject(AllRoutes())
    }
}

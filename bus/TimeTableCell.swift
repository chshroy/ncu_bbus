//
//  TimeTableCell.swift
//  bus
//
//  Created by royyaha on 28.12.19.
//  Copyright © 2019 royyaha. All rights reserved.
//

import SwiftUI

struct TimeTableCell: View {
    @EnvironmentObject var favoriteRoutes: FavoriteRoutes
    @EnvironmentObject var allRoutes: AllRoutes
    var route: Route!
    var type: String!
    var body: some View {
        
        HStack {
            Rectangle()
                .fill(type == "favorite" ? Color.red : Color.gray)
                .frame(width: 20, height: 70)
            
             GeometryReader { geometry in
                VStack(alignment: .leading, spacing: 0){
                HStack {
                    Text(self.route!.name["zh_tw"]!)
                        .font(.system(size: 20))
                        .fontWeight(.heavy)
                        .padding(.leading)
                        
                    Spacer()
                }
                
               
                HStack(alignment: VerticalAlignment.center, spacing: 0) {
                    Text(self.route.stops[0].name["zh_tw"]!)
                        .font(.system(size: 20))
                        .fontWeight(.heavy)
                        .padding(.leading)
                        .frame(width: geometry.size.width / 3, alignment: .leading)
                        
                    Image("route")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                        .padding([.leading, .trailing])
                    .frame(width: geometry.size.width / 3)
                    Text(self.route.stops[self.route.stops.count-1].name["zh_tw"]!)
                        .font(.system(size: 20))
                        .frame(width: geometry.size.width / 3, alignment: .leading)
                }.frame(minWidth: 0, maxWidth: .infinity)
                    
                
                HStack {
                    Spacer()
                    Text("7分鐘")
                        .foregroundColor(Color.red)
                    .padding(.trailing, 10)
                        .opacity(self.type == "favorite" ? 1 : 0)
                }
                
                
                }
            }
            if(type == "favorite") {
                Button(action: {
                  print("button pressed")

                }) {
                    CustomButton(image: "exchange").padding([.leading, .trailing])
                }
            } else {
                Button(action: {
                    self.allRoutes.routes.firstIndex(of: self.route).map { self.allRoutes.routes.remove(at: $0) }
                    self.favoriteRoutes.routes.append(self.route)
                    print("Hello")
                }) {
                    CustomButton(image: "plus").padding([.leading, .trailing])
                }
            }
        }
    }
}

struct TimeTableCell_Previews: PreviewProvider {
    static var previews: some View {
        List {
            ForEach(0 ..< 2, id: \.self) { _ in
                TimeTableCell(route: Route.example, type: "favorite")
                    .frame(height: 100)
                .environmentObject(FavoriteRoutes())
                .environmentObject(AllRoutes())
                
            }
            .listRowInsets(EdgeInsets())
            
        }
    }
}

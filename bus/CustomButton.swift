//
//  CustomButtom.swift
//  bus
//
//  Created by royyaha on 28.12.19.
//  Copyright © 2019 royyaha. All rights reserved.
//

import SwiftUI

struct CustomButton: View {
    var image: String!
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(Color.white)
                .frame(width: 40.0, height: 40.0).overlay(Circle().stroke(Color .white,lineWidth:1).shadow(color: Color.gray, radius: 1.7))
            
            Circle() .foregroundColor(Color.white)
            .frame(width: 40.0, height: 40.0)
            
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
    //                                    .clipShape(Circle())
                .frame(width: 30.0, height: 30.0)
            
        }
    }
}

struct CustomButtom_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(image: "exchange")
    }
}

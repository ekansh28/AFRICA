//
//  CreditsView.swift
//  AFRICA
//
//  Created by Ekansh  on 13/12/23.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack{
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width:128, height:128)
            
        Text("""
        Copyright © Ekansh Sharma
        All right reserved
        Better Apps ♡ Less Code
        """)
        
        }
        .padding()
        .opacity(0.4)
    }
}

#Preview {
    CreditsView()
}

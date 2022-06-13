//
//  CampusView.swift
//  swiftui-fhooe-app
//
//  Created by Ali Eren Çelebi on 13.06.2022.
//

import SwiftUI

struct CampusView: View {
    var campusArr = [Program]()
    var campusName: String
    
    var body: some View {
       
        Text(campusName).bold().foregroundColor(.white)
        ScrollView(.horizontal) {
            
            HStack(spacing: 10) {
                ForEach(campusArr, id: \.self) { p in
                    NavigationLink(destination: ProgramView(name: p.name, desc: p.desc), label: {
                        Text(p.name)
                            .foregroundColor(.black)
                            .font(.subheadline)
                            .frame(width: 100, height: 100)
                            .background(.red)
                        }
                    ).cornerRadius(15)
                }
            }
        }
       
    }
}

struct CampusView_Previews: PreviewProvider {
    static var previews: some View {
        CampusView(campusName: "Hagenberg")
    }
}


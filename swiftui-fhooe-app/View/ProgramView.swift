//
//  ProgramView.swift
//  swiftui-fhooe-app
//
//  Created by Ali Eren Çelebi on 13.06.2022.
//

import SwiftUI

struct ProgramView: View {
    
    var name: String
    var desc: String
    
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
        VStack( spacing: 20){
            Text(self.name).bold().foregroundColor(.red).font(.title)
            Text(self.desc).padding().multilineTextAlignment(.center).foregroundColor(.white)
            Text("ECTS: 180 Credits").bold().foregroundColor(.white).font(.headline)
        }.frame( alignment: .center).offset(y:-100)
            
        }
    }
}

struct ProgramView_Previews: PreviewProvider {
    static var previews: some View {
        ProgramView(name: "SE", desc: "String")
    }
}

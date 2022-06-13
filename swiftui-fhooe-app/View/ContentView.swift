//
//  ContentView.swift
//  swiftui-fhooe-app
//
//  Created by Ali Eren Çelebi on 11.06.2022.
//

import SwiftUI


struct ContentView: View {
    
    @State var hagenberg = [Program]()
    @State var linz = [Program]()
    @State var wels = [Program]()
    @State var steyr = [Program]()
    
    var body: some View {
        
        NavigationView{
            ZStack {
                Color.black.ignoresSafeArea()
                
                HStack(spacing:40){
                    Image("logo")
                    Text("Bachelor Programs")
                        .foregroundColor(.white)
                        .bold()
                        .font(.title)
                        .multilineTextAlignment(.center)
                    
                }.offset(y: -360)
                
                VStack(alignment: .leading){
                    
                    CampusView(campusArr: hagenberg, campusName: "Hagenberg").onAppear(){
                        getProgramsData(campus: "Hagenberg")
                    }
                    
                    CampusView(campusArr: linz, campusName: "Linz").onAppear(){
                        getProgramsData(campus: "Linz")
                    }
                    
                    CampusView(campusArr: steyr, campusName: "Steyr").onAppear(){
                        getProgramsData(campus: "Steyr")
                    }
                    CampusView(campusArr: wels, campusName: "Wels").onAppear(){
                        getProgramsData(campus: "Wels")
                    }
                }
            }
        }
    }
}

extension ContentView{
    
    func getProgramsData(campus: String){
        Network().getBachelors { (result) in
            switch result{
            case .success(let bachelors):
                DispatchQueue.main.async {
                    switch campus{
                    case "Hagenberg": do {
                        self.hagenberg = bachelors.Hagenberg
                    }
                    case "Linz": do {
                        self.linz = bachelors.Linz
                    }
                    case "Wels": do {
                        self.wels = bachelors.Wels
                    }
                    case "Steyr": do {
                        self.steyr = bachelors.Steyr
                    }
                        
                    default:
                        print("error")
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}

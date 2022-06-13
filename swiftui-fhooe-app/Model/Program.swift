//
//  Program.swift
//  swiftui-fhooe-app
//
//  Created by Ali Eren Çelebi on 11.06.2022.
//

import Foundation

struct ApiResponse: Codable {
    let Hagenberg: [Program]
    let Linz: [Program]
    let Wels: [Program]
    let Steyr: [Program]
}

struct Program: Hashable, Codable{
    let name: String
    let desc: String
}

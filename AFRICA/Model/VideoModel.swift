//
//  VideoModel.swift
//  AFRICA
//
//  Created by Ekansh  on 12/12/23.
//

import Foundation

struct Video: Codable, Identifiable{
    let id: String
    let name: String
    let headline: String
    
    var thumbnail: String{
        "video-\(id)"
    }
}

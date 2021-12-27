//
//  PhotoDescription.swift
//  MyFinalProject
//
//  Created by Максим on 27.12.2021.
//

import Foundation

struct PhotoDescription: Decodable {
    let id: Int
    let title: String
    let url: String
    let albumId: Int
}

//
//  Cat.swift
//  MyFinalProject
//
//  Created by Максим on 24.12.2021.
//

struct Cat{
    var name: String
    var breed: String
    var weight: Double
    
    enum CodingKeys: String,CodingKey{
        case name
        case breed
        case weight
    }
}

extension Cat: Decodable{
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        breed = try values.decode(String.self, forKey: .breed)
        weight = try values.decode(Double.self, forKey: .weight)
    }
}

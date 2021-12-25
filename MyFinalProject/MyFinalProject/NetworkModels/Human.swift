//
//  Human.swift
//  MyFinalProject
//
//  Created by Максим on 24.12.2021.
//

struct Human {
    var name: String
    var height: Double
    var weight: Double
    
    enum CodingKeys: String, CodingKey{
        case name
        case height
        case weight
    }
}

extension Human: Decodable{
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        height = try values.decode(Double.self, forKey: .height)
        weight = try values.decode(Double.self, forKey: .weight)
    }
}

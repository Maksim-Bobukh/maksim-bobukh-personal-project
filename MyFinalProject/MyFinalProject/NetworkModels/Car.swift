//
//  Car.swift
//  MyFinalProject
//
//  Created by Максим on 24.12.2021.

struct Car{
    var model: String
    var colour: String
    var hoursePowerAmount: Int
    
    enum CodingKeys: String, CodingKey{
        case model
        case colour
        case hoursePowerAmount
    }
}

extension Car: Decodable{
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        model = try values.decode(String.self, forKey: .model)
        colour = try values.decode(String.self, forKey: .colour)
        hoursePowerAmount = try values.decode(Int.self, forKey: .hoursePowerAmount)
    }
}

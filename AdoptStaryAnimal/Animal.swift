//
//  Animal.swift
//  AdoptStaryAnimal
//
//  Created by kevin on 2018/5/26.
//  Copyright © 2018 KevinChang. All rights reserved.
//

import Foundation

struct Animal: Codable{
        var animal_id: String
        var shelter_name: String
        var animal_place: String
        var animal_kind: String
        var animal_sex: String
        var animal_bodytype: String
        var animal_colour: String
        var animal_age: String
        var animal_sterilization: String?
        var animal_status: String?
        var animal_remark: String?
        var animal_opendate: String?
        var animal_closedate: String?
        var animal_update: String?
        var album_file: URL
        var shelter_address: String?
        var shelter_tel: String?
}

struct StrayAnimals: Codable{
    var animals: [Animal]
}

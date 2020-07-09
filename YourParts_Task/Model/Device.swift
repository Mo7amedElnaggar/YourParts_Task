//
//  Device.swift
//  YourParts_Task
//
//  Created by Mohamed El-Naggar on 7/9/20.
//  Copyright © 2020 Mohamed El-Naggar. All rights reserved.
//

import Foundation

struct Device: Codable {
    // There area a lot of attributes from API , but for simplicity i choose 12 attr only
    var deviceName: String?
    var brand: String?
    var technology: String?
    var released: String?
    var dimensions: String?
    var weight: String?
    var type: String?
    var size: String?
    var resolution: String?
    var battery: String?
    var cpu: String?
    var cardSlot: String?
    
    
    enum DeviceKeys: String, CodingKey {
        case deviceName = "DeviceName"
        case brand      = "Brand"
        case technology = "technology"
        case released   = "status"
        case dimensions = "dimensions"
        case weight     = "weight"
        case type       = "type"
        case size       = "size"
        case resolution = "resolution"
        case battery    = "battery_c"
        case cpu        = "cpu"
        case cardSlot   = "card_slot"
    }
   
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: DeviceKeys.self)
        deviceName = try values.decode(String.self, forKey: .deviceName)
        // Optional try because there is not all link array contains contains all properties
        // Check out the link
        brand      = try? values.decode(String.self, forKey: .brand)
        technology = try? values.decode(String.self, forKey: .technology)
        released   = try? values.decode(String.self, forKey: .released)
        dimensions = try? values.decode(String.self, forKey: .dimensions)
        weight     = try? values.decode(String.self, forKey: .weight)
        type       = try? values.decode(String.self, forKey: .type)
        size       = try? values.decode(String.self, forKey: .size)
        resolution = try? values.decode(String.self, forKey: .resolution)
        battery    = try? values.decode(String.self, forKey: .battery)
        cpu        = try? values.decode(String.self, forKey: .cpu)
        cardSlot   = try? values.decode(String.self, forKey: .cardSlot)
    }
    
    init() {
        deviceName = ""
        brand      = ""
        technology = ""
        released   = ""
        dimensions = ""
        weight     = ""
        type       = ""
        size       = ""
        resolution = ""
        battery    = ""
        cpu        = ""
        cardSlot   = ""
    }
    
/*
     "DeviceName": "Samsung Galaxy A70s",
     "Brand": "Samsung",
     "technology": "GSM / HSPA / LTE",
     "status": "Available. Released 2019, September",
     "dimensions": "164.3 x 76.7 x 7.9 mm (6.47 x 3.02 x 0.31 in)",
     "weight": "187 g (6.60 oz)",
     "sim": "Single SIM (Nano-SIM) or Dual SIM (Nano-SIM, dual stand-by)",
     "type": "Super AMOLED capacitive touchscreen, 16M colors",
     "size": "6.7 inches, 108.4 cm2 (~86.0% screen-to-body ratio)",
     "resolution": "1080 x 2400 pixels, 20:9 ratio (~393 ppi density)",
     "battery_c": "Non-removable Li-Po 4500 mAh battery",
     "cpu": "Octa-core (2x2.0 GHz Kryo 460 Gold & 6x1.7 GHz Kryo 460 Silver)",
     "price": "&#8377;&thinsp;28,999",
     "card_slot": "microSD, up to 64 GB (dedicated slot)",

     */
    
}

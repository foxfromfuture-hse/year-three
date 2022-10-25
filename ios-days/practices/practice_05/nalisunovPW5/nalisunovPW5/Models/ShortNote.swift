//
//  ShortNote.swift
//  nalisunovPW4
//
//  Created by Никита Лисунов on 06.10.2022.
//

import Foundation

//struct ShortNote {
//    var text: String
//}

class ShortNote: NSObject, NSCoding, NSSecureCoding {
    static var supportsSecureCoding: Bool = true
    
    var text: String
    
    init(text: String) {
        self.text = text
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(text, forKey: "text")
    }
    
    required init?(coder: NSCoder) {
        self.text = coder.decodeObject(forKey: "text") as? String ?? ""
    }
}

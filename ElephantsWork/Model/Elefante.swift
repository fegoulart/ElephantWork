//
//  Elefante.swift
//  ElephantsWork
//
//  Created by Jackeline Pires de Lima on 18/10/21.
//
class Elephant: Codable {
    
    enum CodingKeys: String, CodingKey {
        case _id = "id"
        case name
        case species
        case sex
        case dob
        case dod
        case wikilink
        case image
        case note
    }
    
    var _id         : String?
    var name        : String?
    var species     : String?
    var sex         : String?
    var dob         : String?
    var dod         : String?
    var wikilink    : String?
    var image       : String?
    var note        : String?
    
    init(_id        : String? = nil,
        name        : String? = nil,
        species     : String? = nil,
        sex         : String? = nil,
        dob         : String? = nil,
        dod         : String? = nil,
        wikilink    : String? = nil,
        image       : String? = nil,
        note        : String? = nil
    ) {
        self._id        = _id
        self.name       = name
        self.species    = species
        self.sex        = sex
        self.dob        = dob
        self.dod        = dod
        self.wikilink   = wikilink
        self.image      = image
        self.note       = note
    }
    
    
}


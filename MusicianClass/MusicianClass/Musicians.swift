//
//  Musicians.swift
//  MusicianClass
//
//  Created by Hakan Çağlayan on 16.12.2022.
//

import Foundation
enum MusicianType
{
    case LeadGuitar
    case Drummer
    case Bassist
    case Vocalist
}
class Musicians{
    var Name : String
    var Age : Int
    var Instrument : String
    var MusicianType : MusicianType
    
    init(Name: String, Age: Int, Instrument: String,Type: MusicianType) {
        self.Name = Name
        self.Age = Age
        self.Instrument = Instrument
        self.MusicianType=Type
    }
    
    func Sing(){
        print("singing")
    }
}


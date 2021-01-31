//
//  String+Ext.swift
//  HeroIMDBClient
//
//  Created by Horacio Guzman on 30/01/21.
//

import Foundation

extension String {
    
    func localizedString() -> String {
        return NSLocalizedString(self, comment: String())
    }
}

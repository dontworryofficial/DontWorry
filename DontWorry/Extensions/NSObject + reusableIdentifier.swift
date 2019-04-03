//
//  NSObject + reusableIdentifier.swift
//  TabBarTest
//
//  Created by Chan-Seon Park on 2019. 3. 27..
//  Copyright © 2019년 Chan. All rights reserved.
//


import Foundation

extension NSObject {
    static var reusableIdentifier: String {
        return String(describing: self)
    }
}

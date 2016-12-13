//
//  Physics.swift
//  This Game is Not Fair
//
//  Created by Nehemiah Odior on 8/5/16.
//  Copyright © 2016 Nehemiah Odior. All rights reserved.
//

import Foundation


// Physics body category bitmasks
// ------------------------------
// We'll use these to determine missle-fire collisions
struct PhysicsCategory {

static let missileCategory: UInt32 = 0b1       //000001 in binary
static let enemyCategory: UInt32   = 0b10      //000010 in binary
static let heroCategory: UInt32    = 0b100     //000100 in binary
static let noneCategory: UInt32    = 0         //000000

}
//
//  RoomHolder.swift
//  Smart Home
//
//  Created by Sebastian Gao on 3/15/21.
//

import Foundation

class RoomHolder {
    internal init(garageDoorSwitch: String, garageLightSwitch: String, mBedTv: String, mBedLight: String, mBedAcSwitch: String, mBedTem: String, gBedLight: String, gBedAc: String, ovenSwitch: String, ovenTem: String, dishWasherSwitch: String, dishWasherMode: String, freezerTem: String, refrigeratorTem: String, mBathRmHeater: String, mBathRmHeaterTem: String, mBathRmLight: String, mBathRmToiletMode: String, gBathroomSwitch: String, mainLight: String, mirrorLight: String, washingMachine: String, dryer: String, acPower: String, acTem: String, fanSpeed: String) {
        self.garageDoorSwitch = garageDoorSwitch
        self.garageLightSwitch = garageLightSwitch
        self.mBedTv = mBedTv
        self.mBedLight = mBedLight
        self.mBedAcSwitch = mBedAcSwitch
        self.mBedTem = mBedTem
        self.gBedLight = gBedLight
        self.gBedAc = gBedAc
        self.ovenSwitch = ovenSwitch
        self.ovenTem = ovenTem
        self.dishWasherSwitch = dishWasherSwitch
        self.dishWasherMode = dishWasherMode
        self.freezerTem = freezerTem
        self.refrigeratorTem = refrigeratorTem
        self.mBathRmHeater = mBathRmHeater
        self.mBathRmHeaterTem = mBathRmHeaterTem
        self.mBathRmLight = mBathRmLight
        self.mBathRmToiletMode = mBathRmToiletMode
        self.gBathroomSwitch = gBathroomSwitch
        self.mainLight = mainLight
        self.mirrorLight = mirrorLight
        self.washingMachine = washingMachine
        self.dryer = dryer
        self.acPower = acPower
        self.acTem = acTem
        self.fanSpeed = fanSpeed
    }
    
    
    
    var garageDoorSwitch: String
    var garageLightSwitch: String
    
    var mBedTv: String
    var mBedLight: String
    var mBedAcSwitch: String
    var mBedTem: String
    
    var gBedLight: String
    var gBedAc: String
    
    var ovenSwitch: String
    var ovenTem: String
    
    var dishWasherSwitch: String
    var dishWasherMode: String
    
    var freezerTem: String
    var refrigeratorTem: String
    
    var mBathRmHeater: String
    var mBathRmHeaterTem: String
    var mBathRmLight: String
    var mBathRmToiletMode: String
    
    var gBathroomSwitch: String
    var mainLight: String
    var mirrorLight: String
    
    var washingMachine: String
    var dryer: String
    
    var acPower: String
    var acTem: String
    var fanSpeed: String
}



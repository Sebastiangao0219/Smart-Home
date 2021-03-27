//
//  ViewController.swift
//  Smart Home
//
//  Created by Sebastian Gao on 3/8/21.
//

import UIKit
import SwiftUI



class ViewController: UIViewController {
    

    @IBOutlet weak var garageDoor: UILabel!
    @IBOutlet weak var garageLight: UILabel!
    
    @IBOutlet weak var mBedTv: UILabel!
    @IBOutlet weak var mBedLight: UILabel!
    @IBOutlet weak var mBedAc: UILabel!
    @IBOutlet weak var mBedAcTem: UILabel!
    
    @IBOutlet weak var gBedLight: UILabel!
    @IBOutlet weak var gBedAc: UILabel!
    @IBOutlet weak var gBedAcTem: UILabel!
    
    @IBOutlet weak var ovenPower: UILabel!
    @IBOutlet weak var ovenStartStop: UILabel!
    
    @IBOutlet weak var dishwasherPower: UILabel!
    @IBOutlet weak var dishwasherStartStop: UILabel!
    
    @IBOutlet weak var freezerTem: UILabel!
    @IBOutlet weak var refrigeratorTem: UILabel!
    
    @IBOutlet weak var mBathHeaterPower: UILabel!
    @IBOutlet weak var mBathHeaterTem: UILabel!
    @IBOutlet weak var mBathLight: UILabel!
    @IBOutlet weak var mBathToiletMode: UILabel!
    
    @IBOutlet weak var gBathLightPower: UILabel!
    @IBOutlet weak var gBathMainLightDegree: UILabel!
    @IBOutlet weak var gBathMirrorLightDegree: UILabel!
    
    @IBOutlet weak var washingMachine: UILabel!
    @IBOutlet weak var dryer: UILabel!
    
    @IBOutlet weak var cAcPower: UILabel!
    @IBOutlet weak var cAcTem: UILabel!
    @IBOutlet weak var cAcMode: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }

//    override func viewWillAppear(_ animated: Bool) {
//        
//    }
    
    func updateView() {
        garageDoor.text = garageDoorState
        garageLight.text = garageLightState
        
        mBedLight.text = mBedLightState
        mBedTv.text = mBedTvState
        mBedAc.text = mBedAcState
        mBedAcTem.text = mBedAcTemState
        
        gBedLight.text = gBedLightState
        gBedAc.text = gBedAcState
        gBedAcTem.text = gBedAcTemState
        
        ovenPower.text = ovenPowerState
        ovenStartStop.text = ovenStartState
        
        dishwasherPower.text = dishwasherPowerState
        dishwasherStartStop.text = dishwasherStartStopState
        
        freezerTem.text = freezerTemState
        refrigeratorTem.text = refrigeratorTemState
        
        mBathHeaterPower.text = mBathHeaterSwitchState
        mBathHeaterTem.text = mBathHeaterTemState
        mBathLight.text = mBathLightState
        mBathToiletMode.text = mBathToiletModeState
        
        gBathLightPower.text = gBathLightPowerState
        gBathMainLightDegree.text = gBathMainLightDegreeState
        gBathMirrorLightDegree.text = gBathMirrorLightDegreeState
        
        washingMachine.text = washingMachinePowerState
        dryer.text = dryerPowerState
        
        cAcPower.text = acPowerState
        cAcTem.text = acTemState
        cAcMode.text = acModeState
    }
    
    func setup(){
        garageDoor.text = "CLOSED"
        garageLight.text = "OFF"
        
        mBedLight.text = "OFF"
        mBedTv.text = "OFF"
        mBedAc.text = "OFF"
        mBedAcTem.text = "63"
        
        gBedLight.text = "OFF"
        gBedAc.text = "OFF"
        gBedAcTem.text = "63"
        
        ovenPower.text = "OFF"
        ovenStartStop.text = "STOP"
        
        dishwasherPower.text = "OFF"
        dishwasherStartStop.text = "STOP"
        
        freezerTem.text = "-15°C"
        refrigeratorTem.text = "0°C"
        
        mBathHeaterPower.text = "OFF"
        mBathHeaterTem.text = "25°C"
        mBathLight.text = "OFF"
        mBathToiletMode.text = "CLEANING"
        
        gBathLightPower.text = "OFF"
        gBathMainLightDegree.text = "0%"
        gBathMirrorLightDegree.text = "0%"
        
        washingMachine.text = "OFF"
        dryer.text = "OFF"
        
        cAcPower.text = "OFF"
        cAcTem.text = "65°C"
        cAcMode.text = "COOL"
    }
}


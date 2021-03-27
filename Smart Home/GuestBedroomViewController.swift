//
//  GuestBedroomViewController.swift
//  Smart Home
//
//  Created by Sebastian Gao on 3/9/21.
//

import UIKit

var gBedLightState = "OFF"
var gBedAcState = "OFF"
var gBedAcTemState = "63"
var gBedAcTemValue: Int = 0

var isGBedLightOn = false
var isGBedAcOn = false

class GuestBedroomViewController: UIViewController {
    
    @IBOutlet var lightState: UILabel!
    @IBOutlet var ACState: UILabel!
    @IBOutlet var ACDegreeState: UILabel!
    
    @IBOutlet weak var lightSwitch: UISwitch!
    @IBOutlet weak var acSwitch: UISwitch!
    @IBOutlet weak var acSlider: UISlider!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        lightState.text = gBedLightState
        ACState.text = gBedAcState
        ACDegreeState.text = gBedAcTemState
        view.backgroundColor = UIColor.guestBedroomLightOff
        
        if isGBedLightOn {
            view.backgroundColor = UIColor.guestBedroomLightOn
            lightSwitch.isOn = true
        }
        acSlider.isEnabled = false
        
        if isGBedAcOn {
            acSwitch.isOn = true
            acSlider.isEnabled = true
            acSlider.value = Float(gBedAcTemValue)
        }

        // Do any additional setup after loading the view.
    }
    
    @IBAction func setACTemperature(_ sender: UISlider) {
        let value = Int(sender.value)
        ACDegreeState.text = "\(value)"
        gBedAcTemState = "\(value)"
        gBedAcTemValue = value
        mainUpdate()
    }
    
    
    @IBAction func lightSwitch(_ sender: UISwitch) {
        if sender.isOn {
            lightState.text = "ON"
            gBedLightState = "ON"
            isGBedLightOn = true
            view.backgroundColor = UIColor.guestBedroomLightOn
        } else {
            lightState.text = "OFF"
            gBedLightState = "OFF"
            isGBedLightOn = false
            view.backgroundColor = UIColor.guestBedroomLightOff
        }
        mainUpdate()
    }
    
    
    @IBAction func acSwitch(_ sender: UISwitch) {
        if sender.isOn {
            ACState.text = "ON"
            gBedAcState = "ON"
            isGBedAcOn = true
            acSlider.isEnabled = true
        } else {
            ACState.text = "OFF"
            gBedAcState = "OFF"
            isGBedAcOn = false
            acSlider.isEnabled = false
        }
        mainUpdate()
    }
    
    func mainUpdate() {
        if let main = presentingViewController as? ViewController {
            main.updateView()
        }
    }
}

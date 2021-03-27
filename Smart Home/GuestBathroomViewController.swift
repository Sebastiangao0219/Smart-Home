//
//  GuestBathroomViewController.swift
//  Smart Home
//
//  Created by Sebastian Gao on 3/9/21.
//

import UIKit

var gBathLightPowerState = "OFF"
var gBathMainLightDegreeState = "0%"
var gBathMainLightDegreeValue = 0
var gBathMirrorLightDegreeState = "0%"
var gBathMirrorLightDegreeValue = 0

var isLightPowerOn = false

class GuestBathroomViewController: UIViewController {
    
    @IBOutlet weak var onOffLabel: UILabel!
    @IBOutlet weak var switchLabel: UISwitch!
    @IBOutlet weak var mainLightSliderLabel: UISlider!
    @IBOutlet weak var mirrorLightSliderLabel: UISlider!
    @IBOutlet weak var spotLightSliderLabel: UISlider!
    @IBOutlet weak var showMainLightLabel: UILabel!
    @IBOutlet weak var showMirrorLightLabel: UILabel!
    @IBOutlet weak var showSpotLightLabel: UILabel!
    
    @IBAction func switchToggled(_ sender: UISwitch) {
        onOffLabel.text = sender.isOn ? "On" : "Off"
        switchLabel.setOn(sender.isOn, animated: true)
        
        if sender.isOn == true {
            onOffLabel.text = "On"
            gBathLightPowerState = "On"
            isLightPowerOn = true
            mainLightSliderLabel.isEnabled = true
            mirrorLightSliderLabel.isEnabled = true
            spotLightSliderLabel.isEnabled = true
        }
        else{
            onOffLabel.text = "Off"
            gBathLightPowerState = "Off"
            showMainLightLabel.text = ""
            showMirrorLightLabel.text = ""
            gBathMainLightDegreeState = ""
            gBathMirrorLightDegreeState = ""
            isLightPowerOn = false
            mainLightSliderLabel.isEnabled = false
            mirrorLightSliderLabel.isEnabled = false
            spotLightSliderLabel.isEnabled = false
        }
        mainUpdate()
    }
    
    @IBAction func mainLightSlider(_ sender: UISlider) {
        showMainLightLabel.text = "\(Int(sender.value))%"
        gBathMainLightDegreeValue = Int(sender.value)
        gBathMainLightDegreeState = "\(Int(sender.value))%"
        mainUpdate()
    }
    
    @IBAction func mirrorLightSlider(_ sender: UISlider) {
        showMirrorLightLabel.text = "\(Int(sender.value))%"
        gBathMirrorLightDegreeState = "\(Int(sender.value))%"
        gBathMirrorLightDegreeValue = Int(sender.value)
        mainUpdate()
    }
    
    @IBAction func spotLightSlider(_ sender: UISlider) {
        showSpotLightLabel.text = "Spot Light \(Int(sender.value))"
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onOffLabel.text = gBathLightPowerState
        showMainLightLabel.text = gBathMainLightDegreeState
        showMirrorLightLabel.text = gBathMirrorLightDegreeState
        mainLightSliderLabel.value = Float(gBathMainLightDegreeValue)
        mirrorLightSliderLabel.value = Float(gBathMirrorLightDegreeValue)
        mainLightSliderLabel.isEnabled = false
        mirrorLightSliderLabel.isEnabled = false
        spotLightSliderLabel.isEnabled = false
        
        if isLightPowerOn {
            
            switchLabel.isOn = true
            mainLightSliderLabel.isEnabled = false
            mirrorLightSliderLabel.isEnabled = false
            spotLightSliderLabel.isEnabled = false
        }
        // Do any additional setup after loading the view.
    }
    
    func mainUpdate() {
        if let main = presentingViewController as? ViewController {
            main.updateView()
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

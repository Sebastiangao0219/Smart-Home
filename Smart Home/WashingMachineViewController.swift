//
//  WashingMachineViewController.swift
//  Smart Home
//
//  Created by Sebastian Gao on 3/12/21.
//

import UIKit

var washingMachinePowerState = "OFF"
var isWashingMachinePowerOn = false
class WashingMachineViewController: UIViewController {
    
    @IBOutlet weak var onOffLabel: UILabel!
    @IBOutlet weak var switchLabel: UISwitch!
    @IBOutlet weak var startStopLabel: UILabel!
    @IBOutlet weak var loadingLabel: UILabel!
    @IBOutlet weak var sizeSelected: UISegmentedControl!
    @IBOutlet weak var spinLabel: UILabel!
    @IBOutlet weak var spinSelectedLabel: UISegmentedControl!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var tempSelectedLabel: UISegmentedControl!
    @IBOutlet weak var startLabel: UIButton!
    @IBOutlet weak var stopLabel: UIButton!
    
    @IBAction func OnOffToggled(_ sender: UISwitch) {
        onOffLabel.text = sender.isOn ? "On" : "Off"
        switchLabel.setOn(sender.isOn, animated: true)
        
        if sender.isOn == true{
            onOffLabel.text = "On"
            washingMachinePowerState = "ON"
            isWashingMachinePowerOn = true
            sizeSelected.isEnabled = true
            spinSelectedLabel.isEnabled = true
            tempSelectedLabel.isEnabled = true
            startLabel.isEnabled = true
            stopLabel.isEnabled = true
            
        }
        else{
            onOffLabel.text = "Off"
            washingMachinePowerState = "OFF"
            isWashingMachinePowerOn = false
            sizeSelected.isEnabled = false
            spinSelectedLabel.isEnabled = false
            tempSelectedLabel.isEnabled = false
            startLabel.isEnabled = false
            stopLabel.isEnabled = false
        }
        mainUpdate()
    }
    
    @IBAction func loadingSize(_ sender: UISegmentedControl) {
        if let loading = sender.titleForSegment(at: sender.selectedSegmentIndex){
            loadingLabel.text = "Loading: " + loading
        }
    }
    
    @IBAction func spinPower(_ sender: UISegmentedControl) {
        if let spin = sender.titleForSegment(at: sender.selectedSegmentIndex){
            spinLabel.text = "Spin Power: " + spin
        }
    }
    
    @IBAction func tempSelected(_ sender: UISegmentedControl) {
        if let temp = sender.titleForSegment(at: sender.selectedSegmentIndex){
            tempLabel.text = "Temperature : " + temp
        }
    }
    
    @IBAction func startPressed(_ sender: UIButton) {
        startStopLabel.text = "Start"
    }
    
    @IBAction func stopPressed(_ sender: UIButton) {
        startStopLabel.text = "Stop"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onOffLabel.text = washingMachinePowerState
        startStopLabel.text = "Ready"
        sizeSelected.isEnabled = false
        spinSelectedLabel.isEnabled = false
        tempSelectedLabel.isEnabled = false
        startLabel.isEnabled = false
        stopLabel.isEnabled = false
        
        if isWashingMachinePowerOn {
            switchLabel.isOn = true
            sizeSelected.isEnabled = true
            spinSelectedLabel.isEnabled = true
            tempSelectedLabel.isEnabled = true
            startLabel.isEnabled = true
            stopLabel.isEnabled = true
        }
    }
    
    func mainUpdate() {
        if let main = presentingViewController as? ViewController {
            main.updateView()
        }
    }
}

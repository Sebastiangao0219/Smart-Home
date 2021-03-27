//
//  CentralACViewController.swift
//  Smart Home
//
//  Created by Sebastian Gao on 3/9/21.
//

import UIKit

var acPowerState = "OFF"
var acTemState = "65"
var acModeState = "COOL"

var isAcPowerOn = false


class CentralACViewController: UIViewController {
    
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var fanSpeedLabel: UILabel!
    @IBOutlet weak var coolLabel: UIButton!
    @IBOutlet weak var fanLabel: UIButton!
    @IBOutlet weak var heatLabel: UIButton!
    @IBOutlet weak var tempStepperLabel: UIStepper!
    @IBOutlet weak var onOffStatusLabel: UILabel!
    @IBOutlet weak var onOffSwitchLabel: UISwitch!
    @IBOutlet weak var fanSelectedLabel: UISegmentedControl!
    @IBOutlet weak var currentModeLabel: UILabel!
    
    @IBAction func onOffToggled(_ sender: UISwitch) {
        onOffStatusLabel.text = sender.isOn ? "On" : "Off"
        onOffSwitchLabel.setOn(sender.isOn, animated: true)
        
        if sender.isOn == true{
            onOffStatusLabel.text = "On"
            acPowerState = "ON"
            isAcPowerOn = true
            coolLabel.isEnabled = true
            fanLabel.isEnabled = true
            heatLabel.isEnabled = true
            tempStepperLabel.isEnabled = true
            fanSelectedLabel.isEnabled = true
        }
        else{
            onOffStatusLabel.text = "Off"
            acPowerState = "OFF"
            isAcPowerOn = false
            coolLabel.isEnabled = false
            fanLabel.isEnabled = false
            heatLabel.isEnabled = false
            tempStepperLabel.isEnabled = false
            fanSelectedLabel.isEnabled = false
        }
        mainUpdate()
    }
    
    @IBAction func tempChanged(_ sender: UIStepper) {
        tempLabel.text = "\(Int(sender.value))°"
        acTemState = "\(Int(sender.value))°"
        mainUpdate()
    }
    
    @IBAction func fanSpeedSelected(_ sender: UISegmentedControl) {
        if let fan = sender.titleForSegment(at: sender.selectedSegmentIndex){
            fanSpeedLabel.text = "Fan Speed: " + fan
        }
    }
    
    @IBAction func coolPressed(_ sender: UIButton) {
        ColdAlert()
        currentModeLabel.text = "Current Mode: Cool"
        acModeState = "COOL"
        mainUpdate()
    }
    
    @IBAction func fanPressed(_ sender: UIButton) {
        FanAlert()
        currentModeLabel.text = "Current Mode: Fan"
        acModeState = "FAN"
        mainUpdate()
    }
    
    @IBAction func heatPressed(_ sender: UIButton) {
        HeatAlert()
        currentModeLabel.text = "Current Mode: Heat"
        acModeState = "HEAT"
        mainUpdate()
    }
    
    func ColdAlert(){
        let alert = UIAlertController(title: "Cool Mode", message: "You have selected Cool Mode", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: { _ in}))
        alert.addAction(UIAlertAction(title: "Continue", style: UIAlertAction.Style.default, handler: {(_: UIAlertAction!) in}))
        self.present(alert, animated: true, completion: nil)
    }
    
    func FanAlert(){
        let alert = UIAlertController(title: "Fan Mode", message: "You have selected Fan Mode", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: { _ in}))
        alert.addAction(UIAlertAction(title: "Continue", style: UIAlertAction.Style.default, handler: {(_: UIAlertAction!) in}))
        self.present(alert, animated: true, completion: nil)
    }
    
    func HeatAlert(){
        let alert = UIAlertController(title: "Heat Mode", message: "You have selected Heat Mode", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: { _ in}))
        alert.addAction(UIAlertAction(title: "Continue", style: UIAlertAction.Style.default, handler: {(_: UIAlertAction!) in}))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentModeLabel.text = acModeState
        onOffStatusLabel.text = acPowerState
        tempLabel.text = acTemState
        
        coolLabel.isEnabled = false
        fanLabel.isEnabled = false
        heatLabel.isEnabled = false
        tempStepperLabel.isEnabled = false
        fanSelectedLabel.isEnabled = false
        
        if isAcPowerOn {
            onOffSwitchLabel.isOn = true
            coolLabel.isEnabled = true
            fanLabel.isEnabled = true
            heatLabel.isEnabled = true
            tempStepperLabel.isEnabled = true
            fanSelectedLabel.isEnabled = true
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

//
//  DishWasherViewController.swift
//  Smart Home
//
//  Created by Sebastian Gao on 3/12/21.
//

import UIKit

var dishwasherPowerState = "OFF"
var dishwasherStartStopState = "STOP"

var isDishwasherPowerOn = false
var isDishwasherStart = false

class DishWasherViewController: UIViewController {
    
    let mode = ["Rinse", "Cleaning", "Deep Cleaning", "Disinfect"]

    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet var switchLabel: UILabel!
    @IBOutlet var switchUI: UISwitch!
    @IBOutlet var modeUI: UILabel!
    @IBOutlet var startMode: UILabel!
    @IBOutlet var startButton: UIButton!
    @IBOutlet var stopButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.dataSource = self
        picker.delegate = self
        view.backgroundColor = UIColor.getDishWasherStopColor
        switchLabel.text = dishwasherPowerState
        startMode.text = dishwasherStartStopState
        picker.isHidden = true
        startButton.isEnabled = false
        stopButton.isEnabled = false
        
        if isDishwasherPowerOn {
            switchUI.isOn = true
            startButton.isEnabled = true
            stopButton.isEnabled = true
        }
        
        if isDishwasherStart {
            view.backgroundColor = UIColor.getDishWasherStartColor
            picker.isHidden = true
        }

    }
    
    @IBAction func start(_ sender: UIButton) {
        startMode.text = "START"
        dishwasherStartStopState = "START"
        isDishwasherStart = true
        picker.isHidden = true
        view.backgroundColor = UIColor.getDishWasherStartColor
        mainUpdate()
    }
    
    @IBAction func stop(_ sender: UIButton) {
        startMode.text = "STOP"
        dishwasherStartStopState = "STOP"
        isDishwasherStart = false
        picker.isHidden = false
        view.backgroundColor = UIColor.getDishWasherStopColor
        mainUpdate()
    }
    

    @IBAction func switchOnOff(_ sender: UISwitch) {
        if sender.isOn {
            switchLabel.text = "ON"
            dishwasherPowerState = "ON"
            isDishwasherPowerOn = true
            startButton.isEnabled = true
            stopButton.isEnabled = true
            modeUI.isEnabled = true
            picker.isHidden = false
        } else {
            switchLabel.text = "OFF"
            dishwasherPowerState = "OFF"
            startMode.text = "STOP"
            dishwasherStartStopState = "STOP"
            isDishwasherPowerOn = false
            isDishwasherStart = false
            startButton.isEnabled = false
            stopButton.isEnabled = false
            modeUI.isEnabled = false
            picker.isHidden = true
            view.backgroundColor = UIColor.getDishWasherStopColor
        }
        mainUpdate()
    }
    
    func mainUpdate() {
        if let main = presentingViewController as? ViewController {
            main.updateView()
        }
    }

}


extension DishWasherViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        mode.count
    }
    
    
}

extension DishWasherViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        modeUI.text = mode[row]
        return mode[row]
        
    }
    
}

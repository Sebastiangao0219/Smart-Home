//
//  OvenViewController.swift
//  Smart Home
//
//  Created by Sebastian Gao on 3/12/21.
//

import UIKit

var ovenPowerState = "OFF"
var ovenStartState = ""

var isOvenPowerOn = false
var isOvenStart = false
class OvenViewController: UIViewController {

    @IBOutlet var modeView: UIPickerView!
    @IBOutlet var degreeView: UIPickerView!
    @IBOutlet var switchLabel: UILabel!
    @IBOutlet var switchUI: UISwitch!
    @IBOutlet var degreeLabel: UILabel!
    @IBOutlet var degreeModeUI: UILabel!
    @IBOutlet var startMode: UILabel!
    @IBOutlet var startUI: UIButton!
    @IBOutlet var stopUI: UIButton!
    
    
    let degreeMode = ["Celsius", "Fahrenheit"]
    
    let degree = ["120", "125", "130", "135", "140", "145", "150", "155", "160", "165", "170", "175", "180", "185", "190", "195", "200", "205", "210", "215", "220", "225", "230", "235", "240", "245", "250", "255", "260", "265", "270", "275", "280", "295", "300", "305", "310", "315", "320", "325", "330", "335", "340", "345", "350", "355", "360", "375", "380", "395", "400", "405", "410", "415", "420", "425", "430", "435", "440", "445", "450", "455", "460", "465", "470", "475", "480", "485", "490", "495", "500"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        modeView.dataSource = self
        modeView.delegate = self
        
        startMode.text = ovenStartState
        switchLabel.text = ovenPowerState
        
        startUI.isEnabled = false
        stopUI.isEnabled = false
        modeView.isHidden = true
        if isOvenPowerOn {
            switchUI.isOn = true
            modeView.isHidden = false
            startUI.isEnabled = true
            stopUI.isEnabled = true
        }
        view.backgroundColor = UIColor.getOvenStopColor
        
        if isOvenStart {
            modeView.isHidden = true
            view.backgroundColor = UIColor.getOvenStartColor
        }
    }
    
    @IBAction func switchOnOff(_ sender: UISwitch){
        if sender.isOn {
            switchLabel.text = "ON"
            ovenPowerState = "ON"
            isOvenPowerOn = true
            startUI.isEnabled = true
            stopUI.isEnabled = true
            modeView.isHidden = false
        } else {
            startMode.text = "STOP"
            startUI.isEnabled = false
            stopUI.isEnabled = false
            switchLabel.text = "OFF"
            ovenPowerState = "OFF"
            ovenStartState = "STOP"
            isOvenPowerOn = false
            isOvenStart = false
            modeView.isHidden = true
            view.backgroundColor = UIColor.getOvenStopColor
        }
        mainUpdate()
    }
    
    @IBAction func startButton(_ sender: UIButton) {
        startMode.text = "START"
        ovenStartState = "START"
        isOvenStart = true
        modeView.isHidden = true
        view.backgroundColor = UIColor.getOvenStartColor
        mainUpdate()
    }
    
    @IBAction func stopButton(_ sender: UIButton) {
        startMode.text = "STOP"
        ovenStartState = "STOP"
        isOvenStart = false
        modeView.isHidden = false
        view.backgroundColor = UIColor.getOvenStopColor
        mainUpdate()
    }
    
    func mainUpdate() {
        if let main = presentingViewController as? ViewController {
            main.updateView()
        }
    }
    
}

extension OvenViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return degreeMode.count
        } else {
            return degree.count
        }
    }
    
}

extension OvenViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            degreeModeUI.text = degreeMode[row]
            return degreeMode[row]
        } else {
            degreeLabel.text = degree[row]
            return degree[row]
        }
        
    }
}

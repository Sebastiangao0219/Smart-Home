//
//  MasterBathroomViewController.swift
//  Smart Home
//
//  Created by Sebastian Gao on 3/9/21.
//

import UIKit

var mBathHeaterSwitchState = "OFF"
var mBathHeaterTemState = "25°C"
var mBathHeaterTemValue = 0
var mBathLightState = "OFF"
var mBathToiletModeState = "Cleaning"
var mBathSegIndex = 0

var isMBathHeaterOn = false
var isMBathLightOn = false

class MasterBathroomViewController: UIViewController {
    var timerStrField: UITextField?
    
    @IBOutlet weak var heaterSwitchMode: UISwitch!
    @IBOutlet weak var lightSwitchMode: UISwitch!
    
    @IBOutlet weak var heaterModeLabel: UILabel!
    @IBOutlet weak var heaterTemperatureLabel: UILabel!
    @IBOutlet weak var toiletModeLabel: UILabel!
    @IBOutlet weak var lightModeLabel: UILabel!
    @IBOutlet weak var setToiletModeLabel: UILabel!
    @IBOutlet weak var setHeaterTempLabel: UILabel!
    @IBOutlet weak var heaterLabel: UILabel!
    @IBOutlet weak var heaterTempLabel: UILabel!
    @IBOutlet weak var toiletModeTitle: UILabel!
    @IBOutlet weak var lightModeTitle: UILabel!
    @IBOutlet weak var toiletModeSegment: UISegmentedControl!
    
    @IBOutlet weak var heaterSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.getMasterBathRoomBackgroundColor
        heaterSlider.isEnabled = false
        
        heaterModeLabel.text = mBathHeaterSwitchState
        heaterTemperatureLabel.text = mBathHeaterTemState
        toiletModeLabel.text = mBathToiletModeState
        lightModeLabel.text = mBathLightState
        //toiletModeSegment.setTitle(mBathToiletModeState, forSegmentAt: mBathSegIndex)
        heaterSlider.value = Float(mBathHeaterTemValue)
        if isMBathLightOn {
            lightOnColor()
            lightSwitchMode.isOn = true
        }
        
        if isMBathHeaterOn {
            heaterSwitchMode.isOn = true
            heaterSlider.isEnabled = true
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func heaterSwitch(_ sender: UISwitch) {
        if sender.isOn {
            heaterModeLabel.text = "ON"
            mBathHeaterSwitchState = "ON"
            isMBathHeaterOn = true
            heaterSlider.isEnabled = true
        } else {
            heaterModeLabel.text = "OFF"
            mBathHeaterSwitchState = "OFF"
            isMBathHeaterOn = false
            heaterSlider.isEnabled = false
        }
        mainUpdate()
    }
    
    @IBAction func lightSwitch(_ sender: UISwitch) {
        if sender.isOn {
            lightModeLabel.text = "ON"
            mBathLightState = "ON"
            isMBathLightOn = true
            setTextColor()
        }
        else {
            lightModeLabel.text = "OFF"
            mBathLightState = "OFF"
            isMBathLightOn = false
            setTextColor()
        }
        mainUpdate()
    }
    
    @IBAction func setToiletMode(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            toiletModeLabel.text = "Cleaning"
            mBathToiletModeState = "Cleaning"
            mBathSegIndex = 0
            //toiletModeSettingAlert("Cleaning", "Set timer for cleaning.")
        }
        else if sender.selectedSegmentIndex == 1 {
            toiletModeLabel.text = "Deep Cleaning"
            mBathToiletModeState = "Deep Cleaning"
            mBathSegIndex = 1
            //toiletModeSettingAlert("Deep Cleaning", "Set timer for deep cleaning.")
        }
        else if sender.selectedSegmentIndex == 2 {
            toiletModeLabel.text = "Disinfect"
            mBathToiletModeState = "Disinfect"
            mBathSegIndex = 2
            //toiletModeSettingAlert("Disinfect", "Set timer for disinfection.")
        }
        mainUpdate()
    }
    
    @IBAction func setHeaterTemp(_ sender: UISlider) {
        let value = (Int)(sender.value)
        mBathHeaterTemValue = value
        heaterTemperatureLabel.text = "\(value)"
        mBathHeaterTemState = "\(value)" + " °C"
        mainUpdate()
    }

    func setTextColor() {
        if isMBathLightOn {
            lightOnColor()
        } else {
            lightOffColor()
        }
    }
    
    func lightOnColor() {
        view.backgroundColor = UIColor.getMasterBathRoomLightOnColor
        heaterModeLabel.textColor = UIColor.textBlue
        heaterTemperatureLabel.textColor = UIColor.textBlue
        toiletModeLabel.textColor = UIColor.textBlue
        lightModeLabel.textColor = UIColor.textBlue
        setToiletModeLabel.textColor = UIColor.textBlue
        setHeaterTempLabel.textColor = UIColor.textBlue
        heaterLabel.textColor = UIColor.textBlue
        heaterTempLabel.textColor = UIColor.textBlue
        toiletModeTitle.textColor = UIColor.textBlue
        lightModeTitle.textColor = UIColor.textBlue
        heaterSwitchMode.thumbTintColor = UIColor.textBlue
        lightSwitchMode.thumbTintColor = UIColor.textBlue
        heaterSlider.minimumTrackTintColor = UIColor.textBlue
        heaterSlider.thumbTintColor = UIColor.textBlue
    }
    
    func lightOffColor() {
        view.backgroundColor = UIColor.getMasterBathRoomBackgroundColor
        heaterModeLabel.textColor = UIColor.textGolden
        heaterTemperatureLabel.textColor = UIColor.textGolden
        toiletModeLabel.textColor = UIColor.textGolden
        lightModeLabel.textColor = UIColor.textGolden
        setToiletModeLabel.textColor = UIColor.textGolden
        setHeaterTempLabel.textColor = UIColor.textGolden
        heaterLabel.textColor = UIColor.textGolden
        heaterTempLabel.textColor = UIColor.textGolden
        toiletModeTitle.textColor = UIColor.textGolden
        lightModeTitle.textColor = UIColor.textGolden
        heaterSwitchMode.thumbTintColor = UIColor.textGolden
        lightSwitchMode.thumbTintColor = UIColor.textGolden
        heaterSlider.minimumTrackTintColor = UIColor.textGolden
        heaterSlider.thumbTintColor = UIColor.textGolden
    }
    
    func mainUpdate() {
        if let main = presentingViewController as? ViewController {
            main.updateView()
        }
    }
    
    /*
    func toiletModeSettingAlert (_ title: String, _ message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: timerStrField)
        
        alert.textFields![0].placeholder = "Set Timer"
        alert.textFields![0].keyboardType = UIKeyboardType.numberPad
        alert.addAction(UIAlertAction(title: "OK",
                                      style: .default,
                                      handler: self.okHandler)
        
        alert.addAction(UIAlertAction(title: "Cancel",
                                      style: .cancel,
                                      handler:nil)
        
        present(alert, animated: true, completion: nil)
    }
    func timerStrField(textField: UITextField!) {
        timerStrField = textField
        timerStrField?.placeholder = "Set timer."
    }
    
    func alertFunc(_ title: String, _ message: String) {
        let alert = UIAlertController(title: title
                                      , message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK",
                                      style: .default,
                                      handler: { (<#UIAlertAction#>) in
        }))
        
        present(alert, animated: true, completion: nil)
        
    }
    
    func okHandler(alert: UIApplication!) {
        let alertView = AlertViewController()
    }
 */
}

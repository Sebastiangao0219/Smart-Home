//
//  FridgeViewController.swift
//  Smart Home
//
//  Created by Sebastian Gao on 3/12/21.
//

import UIKit

var freezerTemState = "-15°C"
var refrigeratorTemState = "0°C"


class FridgeViewController: UIViewController {
    
    //MARK: - IBOutlets
    
    var isCelsius = false
    var isFahrenheit = false
    
    @IBOutlet weak var iceSwitchLabel: UILabel!
    @IBOutlet weak var iceMakerSwitch: UISwitch!
    
    @IBOutlet weak var fTemperLabel: UILabel!
    @IBOutlet weak var rTemperLabel: UILabel!
    
    @IBOutlet weak var buttonCelsius: UIButton!
    @IBOutlet weak var buttonFahrenheit: UIButton!
    @IBOutlet weak var freezer: UIButton!
    @IBOutlet weak var refrigerator: UIButton!
    @IBOutlet weak var fStepper: UIStepper!
    @IBOutlet weak var rStepper: UIStepper!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fTemperLabel.text = freezerTemState
        rTemperLabel.text = refrigeratorTemState
        
        fStepper.isEnabled = false
        rStepper.isEnabled = false
        iceSwitchLabel.text = ""

        // Do any additional setup after loading the view.
    }
    

    @IBAction func iceSwitchAction(_ sender: UISwitch) {
        if sender.isOn {
            iceSwitchLabel.text = "Woking"
        } else {
            iceSwitchLabel.text = "Stopped"
        }
    }
    
    // MARK: - RadioButton Actions
    
    @IBAction func radioButtonAction(_ sender: UIButton) {
        if sender.tag == 1 {
            buttonCelsius.isSelected = true
            buttonFahrenheit.isSelected = false
            isCelsius = true
            isFahrenheit = false
            
        } else if sender.tag == 2 {
            buttonCelsius.isSelected = false
            buttonFahrenheit.isSelected = true
            isCelsius = false
            isFahrenheit = true
            
        } else if sender.tag == 3 {
            freezer.isSelected = true
            refrigerator.isSelected = false
            fStepper.isEnabled = true
            rStepper.isEnabled = false
        } else {
            freezer.isSelected = false
            refrigerator.isSelected = true
            fStepper.isEnabled = false
            rStepper.isEnabled = true
        }
    }

    // MARK: - set temperature
    @IBAction func setFreezerTemperature(_ sender: UIStepper) {
        if sender.tag == 1 {
            if isCelsius {
                fStepper.minimumValue = -30
                fStepper.maximumValue = -8
                fTemperLabel.text = (String)(sender.value) + " °C"
                freezerTemState = "f " + (String)(sender.value) + " °C"
            } else if isFahrenheit {
                fStepper.minimumValue = -22
                fStepper.maximumValue = 18
                fTemperLabel.text = (String)(sender.value) + " °F "
                freezerTemState = "f " + (String)(sender.value) + " °F "
            } else {
                // Alert
            }
            
        } else {
            if isCelsius {
                rStepper.minimumValue = 0
                rStepper.maximumValue = 8
                rTemperLabel.text = (String)(sender.value) + " °C"
                refrigeratorTemState = "r " + (String)(sender.value) + " °C"
            } else if isFahrenheit{
                rStepper.minimumValue = 32
                rStepper.maximumValue = 45
                rTemperLabel.text = (String)(sender.value) + " °F "
                refrigeratorTemState = "r " + (String)(sender.value) + " °F"
            } else {
                //Alert
            }
        }
        
        mainUpdate()
    }
    
    func mainUpdate() {
        if let main = presentingViewController as? ViewController {
            main.updateView()
        }
    }
    
}

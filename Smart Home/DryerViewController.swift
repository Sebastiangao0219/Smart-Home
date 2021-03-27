//
//  DryerViewController.swift
//  Smart Home
//
//  Created by Sebastian Gao on 3/12/21.
//

import UIKit

let options = [
    "allergen",
    "whites",
    "heavy duty",
    "bulky",
    "cold wash",
    "sheets",
    "colors/towels",
    "rapid wash",
    "delicate"
]

var dryerPowerState = "OFF"
var isDryerPowerOn = false

class DryerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var onOffLabel: UILabel!
    @IBOutlet weak var startStoplabel: UILabel!
    @IBOutlet weak var switchLabel: UISwitch!
    @IBOutlet weak var startLabel: UIButton!
    @IBOutlet weak var stopLabel: UIButton!
    
    @IBAction func onOffToggled(_ sender: UISwitch) {
        onOffLabel.text = sender.isOn ? "On" : "Off"
        switchLabel.setOn(sender.isOn, animated: true)
        
        if sender.isOn == true{
            dryerPowerState = "ON"
            isDryerPowerOn = true
            onOffLabel.text = "On"
            picker.isHidden = false
            startLabel.isEnabled = true
            stopLabel.isEnabled = true
        }
        else{
            dryerPowerState = "OFF"
            isDryerPowerOn = false
            onOffLabel.text = "Off"
            picker.isHidden = true
            startLabel.isEnabled = false
            stopLabel.isEnabled = false
        }
        mainUpdate()
    }
    
    @IBAction func startPressed(_ sender: UIButton) {
        startStoplabel.text = "Start"
        
        let title = ""
        let message = "You have selected \(options[picker.selectedRow(inComponent: 0)])"
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        let okayAction = UIAlertAction(title: "Confirm", style: .default, handler: nil)
        alertController.addAction(cancelAction)
        alertController.addAction(okayAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func stopPressed(_ sender: UIButton) {
        startStoplabel.text = "Stop"
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        options.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent: Int) -> String? {
        return options[row]
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        onOffLabel.text = dryerPowerState
        startStoplabel.text = "Ready"
        startLabel.isEnabled = false
        stopLabel.isEnabled = false
        picker.isHidden = true
        
        if isDryerPowerOn {
            switchLabel.isOn = true
            startLabel.isEnabled = true
            stopLabel.isEnabled = true
            //picker.isHidden = false
            picker.isOpaque = false
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

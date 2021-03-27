//
//  MasterBedroomViewController.swift
//  Smart Home
//
//  Created by Sebastian Gao on 3/9/21.
//

import UIKit

var mBedTvState = "OFF"
var mBedLightState = "OFF"
var mBedAcState = "OFF"
var mBedAcTemState = "63°C"
var mBedAcTemValue: Int = 0

var isMBedTvOn = false
var isMBedLightOn = false
var isMBedAcOn = false

class MasterBedroomViewController: UIViewController {
    
    let container = UIView()
    let tvOn = UIImageView(image: UIImage(named: "tvOn"))
    let tvOff = UIImageView(image: UIImage(named: "tvOff"))
    var transitionOptions = UIView.AnimationOptions()
    
    @IBOutlet var ACDegreeLabel: UILabel!
    @IBOutlet var TVLabel: UILabel!
    @IBOutlet var LightLabel: UILabel!
    @IBOutlet var ACLabel: UILabel!
    @IBOutlet var sliderUI: UISlider!
    @IBOutlet weak var tvSwitch: UISwitch!
    @IBOutlet weak var lightSwitch: UISwitch!
    @IBOutlet weak var acSwitch: UISwitch!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        sliderUI.isEnabled = false
        TVLabel.text = mBedTvState
        LightLabel.text = mBedLightState
        ACLabel.text = mBedAcState
        ACDegreeLabel.text = mBedAcState
        view.backgroundColor = UIColor.bedroomLightOff
        
        if isMBedLightOn {
            view.backgroundColor = UIColor.bedroomLightOn
            lightSwitch.isOn = true
        }
        
        if isMBedAcOn {
            acSwitch.isOn = true
            sliderUI.isEnabled = true
            sliderUI.value = Float(mBedAcTemValue)
        }
         
        let w = view.bounds.width - 50
        let h = view.bounds.height - 600
        container.frame = CGRect(x: 25, y: 120, width: w, height: h)
        view.addSubview(container)
        
        tvOn.frame = CGRect(x: 0, y: 0, width: w, height: h)
        tvOff.frame = tvOn.frame
        container.addSubview(tvOff)
        
        if isMBedTvOn {
            transitionOptions = .transitionCrossDissolve
            transition(transitionOptions, tvOn)
            tvSwitch.isOn = true
        }
        
    }
    
    @IBAction func setACTemperature(_ sender: UISlider) {
        let value = Int(sender.value)
        ACDegreeLabel.text = "\(value)"
        mBedAcTemState = "\(value)"
        mBedAcTemValue = value
        mainUpdate()
    }
    
    @IBAction func tvSwitch(_ sender: UISwitch) {
        if sender.isOn {
            TVLabel.text = "ON"
            mBedTvState = "ON"
            isMBedTvOn = true
            transitionOptions = .transitionCrossDissolve
            transition(transitionOptions, tvOn)
        } else {
            TVLabel.text = "OFF"
            mBedTvState = "OFF"
            isMBedTvOn = false
            transitionOptions = .transitionCrossDissolve
            transition(transitionOptions, tvOff)
        }
        mainUpdate()
    }
    
    
    @IBAction func lightSwitch(_ sender: UISwitch) {
        if sender.isOn {
            LightLabel.text = "ON"
            mBedLightState = "ON"
            isMBedLightOn = true
            view.backgroundColor = UIColor.bedroomLightOn
        } else {
            LightLabel.text = "OFF"
            mBedLightState = "OFF"
            isMBedLightOn = false
            view.backgroundColor = UIColor.bedroomLightOff
        }
        mainUpdate()
    }
    
    @IBAction func ACSwitch(_ sender: UISwitch) {
        if sender.isOn {
            ACLabel.text = "ON"
            mBedAcState = "ON"
            mBedAcTemState = "63°C"
            ACDegreeLabel.text = "63°C"
            isMBedAcOn = true
            sliderUI.isEnabled = true
        } else {
            ACLabel.text = "OFF"
            mBedAcState = "OFF"
            mBedAcTemState = ""
            isMBedAcOn = false
            sliderUI.isEnabled = false
        }
        mainUpdate()
    }
    
    func transition(_ transitionOptions: UIView.AnimationOptions, _ tvState: UIImageView) {
        UIView.transition(with: self.container, duration: 1.0, options: transitionOptions, animations: {
            self.container.addSubview(tvState)
            }, completion: nil)
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

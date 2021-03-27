//
//  GarageViewController.swift
//  Smart Home
//
//  Created by Sebastian Gao on 3/9/21.
//

import UIKit
var garageDoorState = "CLOSED"
var garageLightState = "OFF"
var isSlideUp = false
var isLightUp = false
class GarageViewController: UIViewController {
    
    
    let container = UIView()
    let doorOpened = UIImageView(image: UIImage(named: "garageDoorOpened"))
    let doorClosed = UIImageView(image: UIImage(named: "garageDoorClosed"))
    var transitionOptions = UIView.AnimationOptions()
    
    @IBOutlet var garageSwitchUI: UISwitch!
    @IBOutlet var lightSwitchUI: UISwitch!
    @IBOutlet weak var nameUI: UILabel!
    @IBOutlet weak var doorStateUI: UILabel!
    @IBOutlet weak var lightStateUI: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.garageSlideDownLightColor
        
        doorStateUI.text = garageDoorState
        lightStateUI.text = garageLightState
        
        
        let w = view.bounds.width - 50
        let h = view.bounds.height - 600
        container.frame = CGRect(x: 25, y: 120, width: w, height: h)
        view.addSubview(container)
        
        doorOpened.frame = CGRect(x: 0, y: 0, width: w, height: h)
        doorClosed.frame = doorOpened.frame
        container.addSubview(doorClosed)
        
        if isSlideUp {
            view.backgroundColor = UIColor.garageSlideUpLightColor
            garageSwitchUI.isOn = true
            transitionOptions = .transitionCurlUp
            transition(transitionOptions, doorOpened)
        }
        
        if isLightUp {
            view.backgroundColor = UIColor.garageLightOnColor
            lightSwitchUI.isOn = true
        }

        // Do any additional setup after loading the view.
    }
    
    @IBAction func garageSwitch(_ sender: UISwitch) {
        if sender.isOn {
            view.backgroundColor = UIColor.garageSlideUpLightColor
            transitionOptions = .transitionCurlUp
            transition(transitionOptions, doorOpened)
            nameUI.textColor = UIColor.garageNameColor
            doorStateUI.text = "OPEN"
            garageDoorState = "OPEN"
            isSlideUp = true
        } else {
            view.backgroundColor = UIColor.garageSlideDownLightColor
            transitionOptions = .transitionCurlDown
            transition(transitionOptions, doorClosed)
            nameUI.textColor = .black
            doorStateUI.text = "CLOSED"
            garageDoorState = "CLOSED"
            isSlideUp = false
        }
        mainUpdate()
    }
    
    @IBAction func lightSwitch(_ sender: UISwitch) {
        if sender.isOn {
            view.backgroundColor = UIColor.garageLightOnColor
            lightStateUI.text = "ON"
            garageLightState = "ON"
            isLightUp = true
        } else {
            lightStateUI.text = "OFF"
            garageLightState = "OFF"
            isLightUp = false
            if isSlideUp {
                view.backgroundColor = UIColor.garageSlideUpLightColor
            } else {
                view.backgroundColor = UIColor.garageSlideDownLightColor
            }
        }
        mainUpdate()
    }
    
    func transition(_ transitionOptions: UIView.AnimationOptions, _ doorState: UIImageView) {
        UIView.transition(with: self.container, duration: 1.0, options: transitionOptions, animations: {
            self.container.addSubview(doorState)
            }, completion: nil)
    }

    
    func mainUpdate() {
        if let main = presentingViewController as? ViewController {
            main.updateView()
        }
    }

}

//
//  AlertViewController.swift
//  Smart Home
//
//  Created by Sebastian Gao on 3/13/21.
//

import UIKit

class AlertViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    
    var timerStr: String?
    override func viewDidLoad() {
        super.viewDidLoad()

        timerLabel.text = timerStr
        // Do any additional setup after loading the view.
    }

    func customInit(timerStr: String) {
        self.timerStr = timerStr
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

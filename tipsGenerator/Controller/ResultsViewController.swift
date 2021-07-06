//
//  ResultsViewController.swift
//  tipsGenerator
//  Created by Anisha Lamichhane on 7/5/21.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    var totalPrice: String?
    var tipPercentage: Int?
    var numOfPeople: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = totalPrice
        settingsLabel.text = "Split between \(numOfPeople ?? 2) people, with \(tipPercentage ?? 1)% tip"
        
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        
    }
    
    /*1
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

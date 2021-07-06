//
//  ViewController.swift
//  tipsGenerator
//
//  Created by Anisha Lamichhane on 7/2/21.
//

import UIKit

class CalculatorViewController: UIViewController {
    var tipCalculator = TipCalculator()
    var tipAmount:Float = 0.0
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tipsSelector: UISegmentedControl!
    @IBOutlet weak var splitNumberLabel: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tipChanged(_ sender: UISegmentedControl) {
        guard let title = sender.titleForSegment(at: sender.selectedSegmentIndex) else { return }
        tipAmount = tipCalculator.tipToFloat(tip: title)
        }
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.f", sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        guard let billAmount = billTextField.text else { return}
        guard let splitNumber = splitNumberLabel.text else { return}
        tipCalculator.calculateBill(billAmount: billAmount, tip: tipAmount, splitNo: splitNumber)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        guard case segue.identifier = "goToResult" else { return}
        let destinationVC = segue.destination as! ResultsViewController
        destinationVC.tipPercentage = tipCalculator.gettipInPc()
        destinationVC.numOfPeople = tipCalculator.getSplitNumber()
        destinationVC.totalPrice = tipCalculator.getSplitedPrice()
       
    }
}


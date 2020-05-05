//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        updateHeight(sender: sender)
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        updateWeight(sender: sender)
    }
    
    
        func updateHeight(sender: UISlider) {
            let height = (String(format: "%.2f", sender.value))
            heightLabel.text = height + " m"
        }
    
        func updateWeight(sender: UISlider) {
            let weight = (String(format: "%.0f", sender.value))
            weightLabel.text = weight + " kg"
        }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let weight = weightSlider.value
        let height = heightSlider.value
        
        
        calculatorBrain.calculateBMI(height: height, weight: weight)
        
        self.performSegue(withIdentifier: "goToresult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToresult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
    
}

//
//  ViewController.swift
//  QuickCalc
//
//  Created by Cristian Macovei on 09.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    //calculator objects
    
   
    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var calculationsLabel: UILabel!
    @IBOutlet var resultLabel: UILabel!
    
    var auxiliary: String = ""
    
    
    override func viewDidLoad() {
        clearAll()
        
        //for the background and title
        let randomRed: CGFloat = CGFloat.random(in: 0...1)
        let randomGreen: CGFloat = CGFloat.random(in: 0...1)
        let randomBlue: CGFloat = CGFloat.random(in: 0...1)
        
        let finalBackgroundColor = UIColor(red: randomRed, green: randomBlue, blue: randomGreen, alpha: 1)
        
        super.viewDidLoad()
        
        self.view.backgroundColor = finalBackgroundColor
        titleLabel.backgroundColor = finalBackgroundColor
        titleLabel.backgroundColor?.withAlphaComponent(0.7)
        //titleLabel.textColor = .red
    }
    
    func clearAll() {
        auxiliary = ""
        calculationsLabel.text = ""
        resultLabel.text = ""
    }

    @IBAction func allClearTapped(_ sender: Any) {
        clearAll()
    }
    @IBAction func backspaceTapped(_ sender: Any) {
        if (!auxiliary.isEmpty) {
            auxiliary.removeLast()
            calculationsLabel.text = auxiliary
        }
    }
    @IBAction func percentTapped(_ sender: Any) {
        addToAux(value: "%")
    }
    @IBAction func dividedTapped(_ sender: Any) {
        addToAux(value: "/")
    }
    @IBAction func multiplierTapped(_ sender: Any) {
        addToAux(value: "*")
    }
    @IBAction func subtractTapped(_ sender: Any) {
        addToAux(value: "-")
    }
    @IBAction func addTapped(_ sender: Any) {
        addToAux(value: "+")
    }
    @IBAction func equalsTapped(_ sender: Any) {
        if validInput() {
            print("lala")
            let checkedAuxForPercent = auxiliary.replacingOccurrences(of: "%", with: "*0.01")
            let exp = NSExpression(format: checkedAuxForPercent)
            let finalResult = exp.expressionValue(with: nil, context: nil) as! Double
            let resultStr = formatResult(finalResult: finalResult)
            resultLabel.text = resultStr
        } else {
            let alert = UIAlertController(title: "Invalid Input", message: "Calculator unable to perform calculation based on input", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func validInput() -> Bool {
        
        var count = 0
        var funcCharIndex = [Int]()
        
        for char in auxiliary {
            if specialChar(char: char) {
                funcCharIndex.append(count)
            }
            count += 1
        }
        
        var previousChar = -1
        
        for index in funcCharIndex {
            if index == 0 {
                return false
            }
            if index == auxiliary.count - 1 {
                return false
            }
            
            if previousChar != -1 {
                if index - previousChar == 1 {
                    return false
                }
            }
            previousChar = index
            
        }
        
        return true
    }
    
    func specialChar(char: Character) -> Bool {
        if char == "X" || char == "-" || char == "/" || char == "+"{
            return true
        }
        
        /*
        if char == "-" {
            return true
        }
        if char == "/" {
            return true
        }*/
        return false
    }
    
    
    @IBAction func decimalTapped(_ sender: Any) {
        addToAux(value: ".")
    }
    
    func formatResult(finalResult: Double) -> String {
        if (finalResult.truncatingRemainder(dividingBy: 1) == 0) {
            return String(format: "%.0f", finalResult)
        } else {
            return String(format: "%.2f", finalResult)
        }
    }
    
    func addToAux(value: String) {
        auxiliary = auxiliary + value
        calculationsLabel.text = auxiliary
    }
    
    @IBAction func zeroTapped(_ sender: Any) {
        addToAux(value: "0")
    }
    @IBAction func oneTapped(_ sender: Any) {
        addToAux(value: "1")
    }
    @IBAction func twoTapped(_ sender: Any) {
        addToAux(value: "2")
    }
    @IBAction func threeTapped(_ sender: Any) {
        addToAux(value: "3")
    }
    @IBAction func fourTapped(_ sender: Any) {
        addToAux(value: "4")
    }
    @IBAction func fiveTapped(_ sender: Any) {
        addToAux(value: "5")
    }
    @IBAction func sixTapped(_ sender: Any) {
        addToAux(value: "6")
    }
    @IBAction func sevenTapped(_ sender: Any) {
        addToAux(value: "7")
    }
    @IBAction func eightTapped(_ sender: Any) {
        addToAux(value: "8")
    }
    @IBAction func nineTapped(_ sender: Any) {
        addToAux(value: "9")
    }
    
    
}


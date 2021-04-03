//
//  ViewController.swift
//  Calculator
//
//  Created by Dawid Jóźwiak on 4/2/21.
//

import UIKit

class ViewController: UIViewController {

    var check: Bool = true
    var number: String = ""
    @IBOutlet weak var calcOutput: UILabel!
    @IBOutlet weak var operation: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func append(num: String){
        if(operation.text != ""){
            if(check){
                calcOutput.text = num
                if(calcOutput.text == "."){
                    calcOutput.text = "0."
                }
                check = false
            }
            
            else{
                if((calcOutput.text == "0.0" || calcOutput.text == "0") && num != "."){
                    calcOutput.text = num
                }
                else if(calcOutput.text == "."){
                    calcOutput.text = "0."
                }
                else{
                calcOutput.text! += num
                }
            }
            
        }
        else{
            if((calcOutput.text == "0.0" || calcOutput.text == "0") && num != "."){
            calcOutput.text = num
        }
            else if(calcOutput.text == "."){
                calcOutput.text = "0."
            }
        else{
            calcOutput.text! += num
        }
        }
    }
    
    func changeOperation(op: String){
        operation.text = op
        number = calcOutput.text!
    }
    
    func calculateResult(){
        let x = Double(number)
        let y = Double(calcOutput.text!)
        var result = 0.0
        switch operation.text{
        case "+":
            result = Double(x! + y!)
        case "-":
            result = Double(x! - y!)
        case "x":
            result = Double(x! * y!)
        case "÷":
            if(y! == Double(0.0) || y! == Double(0) ){
                let alert = UIAlertController(title: "Divison by 0 is forbidden", message: "Change the divisor", preferredStyle: UIAlertController.Style.alert
                )
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return
            }
            result = Double(x! / y!)
        default:
            break
        }
        operation.text = "="
        check = true
        var result1: Int
        if(floor(result) == result){
            result1 = Int(floor(result))
            let r = String(result1)
            calcOutput.text = r
        }
        else{
        let r = String(result)
        calcOutput.text = r
        }
    }
    
    @IBAction func zeroButton(_ sender: Any) {self.append(num: "0")}
    @IBAction func oneButton(_ sender: Any) {self.append(num: "1")}
    @IBAction func twoButton(_ sender: Any) {self.append(num: "2")}
    @IBAction func threeButton(_ sender: Any) {self.append(num: "3")}
    @IBAction func fourButton(_ sender: Any) {self.append(num: "4")}
    @IBAction func fiveButton(_ sender: Any) {self.append(num: "5")}
    @IBAction func sixButton(_ sender: Any) {self.append(num: "6")}
    @IBAction func sevenButton(_ sender: Any) {self.append(num: "7")}
    @IBAction func eightButton(_ sender: Any) {self.append(num: "8")}
    @IBAction func nineButton(_ sender: Any) {self.append(num: "9")}
    @IBAction func plusButton(_ sender: Any) {self.changeOperation(op: "+")}
    @IBAction func minusButton(_ sender: Any) {self.changeOperation(op: "-")}
    @IBAction func multiplyButton(_ sender: Any) {self.changeOperation(op: "x")}
    @IBAction func divideButton(_ sender: Any) {self.changeOperation(op: "÷")}
    @IBAction func equalButton(_ sender: Any) {self.calculateResult()}
    @IBAction func deleteButton(_ sender: Any) {
        calcOutput.text = "0"
        operation.text = ""
        check = true
    }
    @IBAction func backButton(_ sender: Any) {
        calcOutput.text = String(calcOutput.text!.dropLast())
    }
    @IBAction func dotButton(_ sender: Any){self.append(num: ".")}
}
    


//
//  ViewController.swift
//  guessNumber
//
//  Created by Yolanda H. on 2019/2/20.
//  Copyright © 2019 Yolanda H. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var numbers = [0,0,0,0]
    var textInt = [0,0,0,0]
    var rangestar = ""
    @IBOutlet weak var showTextView: UITextView!
    @IBOutlet weak var firstText: UITextField!
    @IBOutlet weak var secondText: UITextField!
    @IBOutlet weak var thirdText: UITextField!
    @IBOutlet weak var fourthText: UITextField!
    @IBOutlet weak var rangestarLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func newBirth(_ sender: UIButton) {
        let randomNumber = Int.random(in: 8...374)
        let newdate = Calendar.current.date(byAdding: .day, value: randomNumber, to: Date())
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        if newdate! < formatter.date(from: "2019-03-21")!{
            rangestar = "雙魚座"
        }else if newdate! > formatter.date(from: "2019-03-20")!, newdate! < formatter.date(from: "2019-04-20")!{
            rangestar = "白羊座"
        }else if newdate! > formatter.date(from: "2019-04-19")!, newdate! < formatter.date(from: "2019-05-21")!{
            rangestar = "金牛座"
        }else if newdate! > formatter.date(from: "2019-05-20")!, newdate! < formatter.date(from: "2019-06-22")!{
            rangestar = "雙子座"
        }else if newdate! > formatter.date(from: "2019-06-21")!, newdate! < formatter.date(from: "2019-07-23")!{
            rangestar = "巨蟹座"
        }else if newdate! > formatter.date(from: "2019-07-22")!, newdate! < formatter.date(from: "2019-08-23")!{
            rangestar = "獅子座"
        }else if newdate! > formatter.date(from: "2019-08-22")!, newdate! < formatter.date(from: "2019-09-23")!{
            rangestar = "處女座"
        }else if newdate! > formatter.date(from: "2019-09-22")!, newdate! < formatter.date(from: "2019-10-24")!{
            rangestar = "天秤座"
        }else if newdate! > formatter.date(from: "2019-10-23")!, newdate! < formatter.date(from: "2019-11-22")!{
            rangestar = "天蠍座"
        }else if newdate! > formatter.date(from: "2019-11-21")!, newdate! < formatter.date(from: "2019-12-21")!{
            rangestar = "射手座"
        }else
        if newdate! > formatter.date(from: "2019-12-20")!, newdate! < formatter.date(from: "2020-01-21")! {
            rangestar = "摩羯座"
        }else if newdate! > formatter.date(from: "2020-01-20")!, newdate! < formatter.date(from: "2020-02-20")! {
            rangestar = "水瓶座"
        }else if newdate! > formatter.date(from: "2020-02-19")!{
            rangestar = "雙魚座"
        }
        rangestarLabel.text = "範圍：" + rangestar
        let month = DateFormatter()
        month.dateFormat = "MM"
        let day = DateFormatter()
        day.dateFormat = "dd"
        let monthInt = Int(month.string(from: newdate!))
        let dayInt = Int(day.string(from: newdate!))
        if dayInt! < 10 {
            numbers[3] = dayInt!
            numbers[2] = 0
        }else if dayInt! < 20 {
            numbers[3] = dayInt! - 10
            numbers[2] = 1
        }else if dayInt! < 30 {
            numbers[3] = dayInt! - 20
            numbers[2] = 2
        }else {
            numbers[3] = dayInt! - 30
            numbers[2] = 3
        }
        if monthInt! < 10 {
            numbers[1] = monthInt!
            numbers[0] = 0
        }else {
            numbers[1] = monthInt! - 10
            numbers[0] = 1
        }
        
    }
    @IBAction func showButton(_ sender: UIButton) {
        var righta = 0
        var wrongb = 0
        let firstInt = Int(firstText.text!)
        let secondInt = Int(secondText.text!)
        let thirdInt = Int(thirdText.text!)
        let fourthInt = Int(fourthText.text!)
        textInt[0] = firstInt!
        textInt[1] = secondInt!
        textInt[2] = thirdInt!
        textInt[3] = fourthInt!
        for i in 0...3 {
            if textInt[i] == numbers[i]{
                    righta = righta + 1
            } else {
                for j in 0...3 {
                    if i != j,textInt[i] == numbers[i]{
                        wrongb += 1
                    }
                    
                }
            }
            
        }
        showTextView.text = firstText.text! + secondText.text! + thirdText.text! + fourthText.text! + ": " + String(righta) + "A" + String(wrongb) + "B\n" +  showTextView.text!
        if righta == 4{
            showTextView.text = "猜對了！\n" + showTextView.text!
        }
        
    }
    @IBAction func dissKeyboard(_ sender: UIButton) {
        firstText.endEditing(true)
        secondText.endEditing(true)
        thirdText.endEditing(true)
        fourthText.endEditing(true)
    }
    
}


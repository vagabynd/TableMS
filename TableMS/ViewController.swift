//
//  ViewController.swift
//  TableMS
//
//  Created by Евгений Ротарь on 08.06.2018.
//  Copyright © 2018 Евгений Ротарь. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate,UIPickerViewDataSource {
 
    @IBOutlet weak var notOfStepper: UIStepper!
    @IBOutlet weak var ofStepper: UIStepper!
    @IBOutlet weak var notOfLable: UILabel!
    @IBOutlet weak var ofLable: UILabel!
    @IBOutlet weak var timeTable: UITableView!
    @IBOutlet weak var dayOfWeek: UIPickerView!
    @IBOutlet weak var week: UISegmentedControl!
    var nowDayOfWeek = 0
    var nowWeek = 0
    var ofLeft = 0
    var notOfLeft = 0
    let indentifire = "firstCell"
    var array = ["Понедельник","Вторник","Среда","Четверг","Пятница","Суббота","Воскресенье"]
    override func viewDidLoad() {
        super.viewDidLoad()
        dayOfWeek.dataSource = self
        dayOfWeek.delegate = self
        
        week.addTarget(self, action: #selector(selectedValue), for: .valueChanged)
        ofLeft = UserDefaults.standard.integer(forKey: "of")
        notOfLeft = UserDefaults.standard.integer(forKey: "notof")
        ofLable.text = "\(ofLeft)"
        notOfLable.text = "\(notOfLeft)"
        notOfStepper.value = Double(notOfLeft)
        ofStepper.value = Double(ofLeft)
        
        createTable()
    }
    
    @IBAction func notOfStepperValueChanged(_ sender: UIStepper) {
        notOfLeft = Int(Int(sender.value).description)!
        UserDefaults.standard.set(notOfLeft, forKey: "notof")
        UserDefaults.standard.set(ofLeft, forKey: "of")
        
        notOfLable.text = "\(notOfLeft)"
    }
    @IBAction func ofStepperValueChanged(_ sender: UIStepper) {
        ofLeft = Int(Int(sender.value).description)!
        UserDefaults.standard.set(ofLeft, forKey: "of")
        UserDefaults.standard.set(notOfLeft, forKey: "notof")
        
        ofLable.text = "\(ofLeft)"
    }
    @objc func selectedValue(target: UISegmentedControl){
        if target == self.week{
            nowWeek = target.selectedSegmentIndex
            timeTable.reloadData()
            createTable()
            print(nowWeek)
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return array[row]
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return array.count
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        nowDayOfWeek = row
        timeTable.reloadData()
        createTable()
        print(row)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createTable(){
        timeTable.register(UITableViewCell.self, forCellReuseIdentifier: indentifire)
        timeTable.delegate = self
        timeTable.dataSource = self
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 4
        default:
            break
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: indentifire, for: indexPath)
        //cell.textLabel?.text = "section = \(indexPath.section) cell = \(indexPath.row)"
        if (nowDayOfWeek == 0 && nowWeek == 0){
            switch indexPath.row {
            case 0:
                cell.textLabel?.text = "1 понедельник по верх"
            case 1:
                cell.textLabel?.text = "2 понедельник по верх"
            case 2:
                cell.textLabel?.text = "3 понедельник по верх"
            case 3:
                cell.textLabel?.text = "4 понедельник по верх"
            default:
                print("err")
            }
        }
        if (nowDayOfWeek == 0 && nowWeek == 1){
            switch indexPath.row {
            case 0:
                cell.textLabel?.text = "1 понедельник по низ"
            case 1:
                cell.textLabel?.text = "2 понедельник по низ"
            case 2:
                cell.textLabel?.text = "3 понедельник по низ"
            case 3:
                cell.textLabel?.text = "4 понедельник по низ"
            default:
                print("err")
            }
        }
        if (nowDayOfWeek == 1 && nowWeek == 0){
            switch indexPath.row {
            case 0:
                cell.textLabel?.text = "1 вторник по верх"
            case 1:
                cell.textLabel?.text = "2 вторник по верх"
            case 2:
                cell.textLabel?.text = "3 вторник по верх"
            case 3:
                cell.textLabel?.text = "4 вторник по верх"
            default:
                print("err")
            }
        }
        if (nowDayOfWeek == 1 && nowWeek == 1){
            switch indexPath.row {
            case 0:
                cell.textLabel?.text = "1 вторник по низ"
            case 1:
                cell.textLabel?.text = "2 вторник по низ"
            case 2:
                cell.textLabel?.text = "3 вторник по низ"
            case 3:
                cell.textLabel?.text = "4 вторник по низ"
            default:
                print("err")
            }
        }
        if (nowDayOfWeek == 2 && nowWeek == 0){
            switch indexPath.row {
            case 0:
                cell.textLabel?.text = "1 среда по верх"
            case 1:
                cell.textLabel?.text = "2 среда по верх"
            case 2:
                cell.textLabel?.text = "3 среда по верх"
            case 3:
                cell.textLabel?.text = "4 среда по верх"
            default:
                print("err")
            }
        }
        if (nowDayOfWeek == 2 && nowWeek == 1){
            switch indexPath.row {
            case 0:
                cell.textLabel?.text = "1 среда по низ"
            case 1:
                cell.textLabel?.text = "2 среда по низ"
            case 2:
                cell.textLabel?.text = "3 среда по низ"
            case 3:
                cell.textLabel?.text = "4 среда по низ"
            default:
                print("err")
            }
        }
        if (nowDayOfWeek == 3 && nowWeek == 0){
            switch indexPath.row {
            case 0:
                cell.textLabel?.text = "1 четверг по верх"
            case 1:
                cell.textLabel?.text = "2 четверг по верх"
            case 2:
                cell.textLabel?.text = "3 четверг по верх"
            case 3:
                cell.textLabel?.text = "4 четверг по верх"
            default:
                print("err")
            }
        }
        if (nowDayOfWeek == 3 && nowWeek == 1){
            switch indexPath.row {
            case 0:
                cell.textLabel?.text = "1 четверг по низ"
            case 1:
                cell.textLabel?.text = "2 четверг по низ"
            case 2:
                cell.textLabel?.text = "3 четверг по низ"
            case 3:
                cell.textLabel?.text = "4 четверг по низ"
            default:
                print("err")
            }
        }
        if (nowDayOfWeek == 4 && nowWeek == 0){
            switch indexPath.row {
            case 0:
                cell.textLabel?.text = "1 пятница по верх"
            case 1:
                cell.textLabel?.text = "2 пятница по верх"
            case 2:
                cell.textLabel?.text = "3 пятница по верх"
            case 3:
                cell.textLabel?.text = "4 пятница по верх"
            default:
                print("err")
            }
        }
        if (nowDayOfWeek == 4 && nowWeek == 1){
            switch indexPath.row {
            case 0:
                cell.textLabel?.text = "1 пятница по низ"
            case 1:
                cell.textLabel?.text = "2 пятница по низ"
            case 2:
                cell.textLabel?.text = "3 пятница по низ"
            case 3:
                cell.textLabel?.text = "4 пятница по низ"
            default:
                print("err")
            }
        }
        if (nowDayOfWeek == 5 && nowWeek == 0){
            switch indexPath.row {
            case 0:
                cell.textLabel?.text = "1 суббота по верх"
            case 1:
                cell.textLabel?.text = "2 суббота по верх"
            case 2:
                cell.textLabel?.text = "3 суббота по верх"
            case 3:
                cell.textLabel?.text = "4 суббота по верх"
            default:
                print("err")
            }
        }
        if (nowDayOfWeek == 5 && nowWeek == 1){
            switch indexPath.row {
            case 0:
                cell.textLabel?.text = "1 суббота по низ"
            case 1:
                cell.textLabel?.text = "2 суббота по низ"
            case 2:
                cell.textLabel?.text = "3 суббота по низ"
            case 3:
                cell.textLabel?.text = "4 суббота по низ"
            default:
                print("err")
            }
        }
        if (nowDayOfWeek == 6 && nowWeek == 0){
            switch indexPath.row {
            case 0:
                cell.textLabel?.text = "Отдохни, глупец"
            default:
                cell.textLabel?.text = "Отдохни, глупец"
            }
        }
        if (nowDayOfWeek == 6 && nowWeek == 1){
            switch indexPath.row {
            case 0:
                cell.textLabel?.text = "Отдохни, глупец"
            default:
                cell.textLabel?.text = "Отдохни, глупец"
            }
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 57.5
    }

}

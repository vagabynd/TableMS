//
//  ViewController.swift
//  TableMS
//
//  Created by Евгений Ротарь on 08.06.2018.
//  Copyright © 2018 Евгений Ротарь. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate,UIPickerViewDataSource {
 
    @IBOutlet weak var timeTable: UITableView!
    @IBOutlet weak var notOfStepper: UIStepper!
    @IBOutlet weak var ofStepper: UIStepper!
    @IBOutlet weak var notOfLable: UILabel!
    @IBOutlet weak var ofLable: UILabel!
    @IBOutlet weak var dayOfWeek: UIPickerView!
    @IBOutlet weak var week: UISegmentedControl!
    var nowDayOfWeek = 0
    var nowWeek = 0
    var ofLeft = 0
    var notOfLeft = 0
    let indentifire = "cell"
    var array = ["Понедельник","Вторник","Среда","Четверг","Пятница","Суббота","Воскресенье"]
    var dayUp: DayUp = DayUp()
    var textLabelText = ""
    let math: Pair = Pair(namePair: "Матем", numOfLab: 7)
    let fiz: Pair = Pair(namePair: "Физика", numOfLab: 4)
    let fizra: Pair = Pair(namePair: "Физ-ра", numOfLab: 2)
    let proga: Pair = Pair(namePair: "Прога", numOfLab: 5)
    
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
        //timeTable.register(UITableViewCell.self, forCellReuseIdentifier: indentifire)
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
            dayUp = DayUp(dayName: "MondayU",pair: [math,fizra,proga,fiz])
            cell.textLabel?.text = "\(dayUp.getAllPair()[indexPath.row].getName())"
        }
        if (nowDayOfWeek == 0 && nowWeek == 1){
            dayUp = DayUp(dayName: "MondayD",pair: [math,fizra,proga,fiz])
            cell.textLabel?.text = "\(dayUp.getAllPair()[indexPath.row].getName())"
        }
        if (nowDayOfWeek == 1 && nowWeek == 0){
            dayUp = DayUp(dayName: "TuesdayU",pair: [math,fizra,proga,fiz])
            cell.textLabel?.text = "\(dayUp.getAllPair()[indexPath.row].getName())"
        }
        if (nowDayOfWeek == 1 && nowWeek == 1){
            dayUp = DayUp(dayName: "TuesdayD",pair: [math,fizra,proga,fiz])
            cell.textLabel?.text = "\(dayUp.getAllPair()[indexPath.row].getName())"
        }
        if (nowDayOfWeek == 2 && nowWeek == 0){
            dayUp = DayUp(dayName: "WednesdayU",pair: [math,fizra,proga,fiz])
            cell.textLabel?.text = "\(dayUp.getAllPair()[indexPath.row].getName())"
        }
        if (nowDayOfWeek == 2 && nowWeek == 1){
            dayUp = DayUp(dayName: "WednesdayD",pair: [math,fizra,proga,fiz])
            cell.textLabel?.text = "\(dayUp.getAllPair()[indexPath.row].getName())"
        }
        if (nowDayOfWeek == 3 && nowWeek == 0){
            dayUp = DayUp(dayName: "ThursdayU",pair: [math,fizra,proga,fiz])
            cell.textLabel?.text = "\(dayUp.getAllPair()[indexPath.row].getName())"
        }
        if (nowDayOfWeek == 3 && nowWeek == 1){
            dayUp = DayUp(dayName: "ThursdayD",pair: [math,fizra,proga,fiz])
            cell.textLabel?.text = "\(dayUp.getAllPair()[indexPath.row].getName())"
        }
        if (nowDayOfWeek == 4 && nowWeek == 0){
            dayUp = DayUp(dayName: "FridayU",pair: [math,fizra,proga,fiz])
            cell.textLabel?.text = "\(dayUp.getAllPair()[indexPath.row].getName())"
        }
        if (nowDayOfWeek == 4 && nowWeek == 1){
            dayUp = DayUp(dayName: "FridayD",pair: [math,fizra,proga,fiz])
            cell.textLabel?.text = "\(dayUp.getAllPair()[indexPath.row].getName())"
        }
        if (nowDayOfWeek == 5 && nowWeek == 0){
            dayUp = DayUp(dayName: "SaturdayU",pair: [math,fizra,proga,fiz])
            cell.textLabel?.text = "\(dayUp.getAllPair()[indexPath.row].getName())"
        }
        if (nowDayOfWeek == 5 && nowWeek == 1){
            dayUp = DayUp(dayName: "SaturdayD",pair: [math,fizra,proga,fiz])
            cell.textLabel?.text = "\(dayUp.getAllPair()[indexPath.row].getName())"
        }
        if (nowDayOfWeek == 6 && nowWeek == 0){
            dayUp = DayUp(dayName: "SundayU",pair: [math,fizra,proga,fiz])
            cell.textLabel?.text = "\(dayUp.getAllPair()[indexPath.row].getName())"
        }
        if (nowDayOfWeek == 6 && nowWeek == 1){
            dayUp = DayUp(dayName: "SundayD",pair: [math,fizra,proga,fiz])
            cell.textLabel?.text = "\(dayUp.getAllPair()[indexPath.row].getName())"
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 57.5
    }
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        let currentCellValue = tableView.cellForRow(at: indexPath)! as UITableViewCell
        textLabelText = currentCellValue.textLabel!.text!
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC: LabViewController = segue.destination as! LabViewController
        switch textLabelText {
        case "Матем":
            destinationVC.mathPair = math
        case "Физика":
            destinationVC.mathPair = fiz
        case "Физ-ра":
            destinationVC.mathPair = fizra
        case "Прога":
            destinationVC.mathPair = proga
        default:
            print("err")
        }
        
    }
    
}

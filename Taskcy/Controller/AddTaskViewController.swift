//
//  AddTaskViewController.swift
//  Taskcy
//
//  Created by 김시연 on 2023/11/30.
//

import UIKit

class AddTaskViewController: UIViewController {
    
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var startTimeTextField: UITextField!
    @IBOutlet weak var endTimeTextField: UITextField!
    
    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet weak var todoButton: UIButton!
    @IBOutlet weak var ongoingButton: UIButton!
    @IBOutlet weak var completeButton: UIButton!
    
    
    let datePicker = UIDatePicker()
    let startTimePicker = UIDatePicker()
    let endTimePicker = UIDatePicker()
    
    let taskViewModel = TaskViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setDatePicker()
        setupToolBar()
        setUI()
    }
    
    func setUI(){
        taskNameTextField.delegate = self
        taskNameTextField.makeRoundTextField()
        dateTextField.makeRoundTextField()
        startTimeTextField.makeRoundTextField()
        endTimeTextField.makeRoundTextField()
        
        todoButton.makeRoundButton(enableTextColor: UIColor(named: "848A94")!, disableTextColor: UIColor(named: "848A94")!, radius: 8)
        todoButton.layer.borderWidth = 1
        todoButton.layer.borderColor = UIColor(named: "E9F1FF")?.cgColor
        
        ongoingButton.makeRoundButton(enableTextColor: UIColor(named: "848A94")!, disableTextColor: UIColor(named: "848A94")!, radius: 8)
        ongoingButton.layer.borderWidth = 1
        ongoingButton.layer.borderColor = UIColor(named: "E9F1FF")?.cgColor
        
        completeButton.makeRoundButton(enableTextColor: UIColor(named: "848A94")!, disableTextColor: UIColor(named: "848A94")!, radius: 8)
        completeButton.layer.borderWidth = 1
        completeButton.layer.borderColor = UIColor(named: "E9F1FF")?.cgColor
        
        addButton.makeRoundButton(enableTextColor: UIColor(named: "FFFFFF")!, disableTextColor: UIColor(named: "FFFFFF")!, radius: 12)
    }
    
    @IBAction func todoButtonTapped(_ sender: Any) {
        todoButton.layer.borderColor = UIColor(named: "756EF3")?.cgColor
        ongoingButton.layer.borderColor = UIColor(named: "E9F1FF")?.cgColor
        completeButton.layer.borderColor = UIColor(named: "E9F1FF")?.cgColor
        todoButton.isSelected = true
        ongoingButton.isSelected = false
        completeButton.isSelected = false
    }
    
    @IBAction func ongoingButtonTapped(_ sender: Any) {
        ongoingButton.layer.borderColor = UIColor(named: "756EF3")?.cgColor
        todoButton.layer.borderColor = UIColor(named: "E9F1FF")?.cgColor
        completeButton.layer.borderColor = UIColor(named: "E9F1FF")?.cgColor
        ongoingButton.isSelected = true
        todoButton.isSelected = false
        completeButton.isSelected = false
    }
    
    @IBAction func completeButtonTapped(_ sender: Any) {
        completeButton.layer.borderColor = UIColor(named: "756EF3")?.cgColor
        todoButton.layer.borderColor = UIColor(named: "E9F1FF")?.cgColor
        ongoingButton.layer.borderColor = UIColor(named: "E9F1FF")?.cgColor
        completeButton.isSelected = true
        todoButton.isSelected = false
        ongoingButton.isSelected = false
    }
    
    func setDatePicker(){
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(changeDate(datePicker:)), for: UIControl.Event.valueChanged)
        datePicker.frame.size = CGSize(width: 0, height: 300)
        datePicker.preferredDatePickerStyle = .wheels
                
        dateTextField.inputView = datePicker
        dateTextField.text = formatDate(date: Date())
        
        startTimePicker.datePickerMode = .time
        startTimePicker.addTarget(self, action: #selector(changeTime(datePicker:)), for: UIControl.Event.valueChanged)
        startTimePicker.preferredDatePickerStyle = .wheels
        
        endTimePicker.datePickerMode = .time
        endTimePicker.addTarget(self, action: #selector(changeTime(datePicker:)), for: UIControl.Event.valueChanged)
        endTimePicker.preferredDatePickerStyle = .wheels
        
        startTimeTextField.inputView = startTimePicker
        
        endTimeTextField.inputView = endTimePicker
        
    }
    
    @objc func changeDate(datePicker: UIDatePicker) {
        dateTextField.text = formatDate(date: datePicker.date)
    }
    
    @objc func changeTime(datePicker: UIDatePicker) {
        if datePicker == startTimePicker {
            startTimeTextField.text = formatTime(date: datePicker.date)
        } else if datePicker == endTimePicker {
            endTimeTextField.text = formatTime(date: datePicker.date)
        }
    }
        
    func formatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd, yyyy"
        
        return formatter.string(from: date)
    }
    
    func formatTime(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        
        return formatter.string(from: date)
    }
    
    func setupToolBar() {
        let toolBar = UIToolbar()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonHandeler))

        toolBar.items = [flexibleSpace, doneButton]
        toolBar.sizeToFit()

        dateTextField.inputAccessoryView = toolBar
    }

    @objc func doneButtonHandeler(_ sender: UIBarButtonItem) {
        dateTextField.text = formatDate(date: datePicker.date)
        dateTextField.makeEndEditingRoundTextField()
        dateTextField.resignFirstResponder()
    }
    
    @IBAction func addTaskButtonTapped(_ sender: Any) {
        let status = todoButton.isSelected ? Status.todo : (ongoingButton.isSelected ? Status.ongoing : Status.complete)
        taskViewModel.addTask(Task(name: taskNameTextField.text!, date: datePicker.date.getDateString(),startTime: startTimePicker.date.getTimeString(), endTime: endTimePicker.date.getTimeString(), status: status))
        self.dismiss(animated: true) {
            NotificationCenter.default.post(name: Notification.Name("AddTaskComplete"), object: nil, userInfo: [:])
        }
        
    }
    

}

extension AddTaskViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == taskNameTextField {
            taskNameTextField.makeBeginEditingRoundTextField()
        }
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == taskNameTextField {
            taskNameTextField.makeEndEditingRoundTextField()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        dateTextField.makeBeginEditingRoundTextField()
        dateTextField.becomeFirstResponder()
        return true
    }
    
}

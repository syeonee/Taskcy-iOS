//
//  CalendarViewController.swift
//  Taskcy
//
//  Created by 김시연 on 2023/11/26.
//

import UIKit
import FSCalendar

class CalendarViewController: UIViewController {
    
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var calendarView: FSCalendar!
    @IBOutlet weak var taskTableView: UITableView!
    
    var selectedDate: Date?
    var taskDates: [Date] = []
    let taskViewModel = TaskViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCalendar()
        setUI()
        loadDate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadDate()
        taskTableView.reloadData()
    }
    
    @IBAction func monthNextButtonTapped(_ sender: Any) {
        changeMonth(moveTo: 1)
    }
    
    @IBAction func monthPrevButtonTapped(_ sender: Any) {
        changeMonth(moveTo: -1)
    }
    
    func loadDate(){
        taskViewModel.loadTasks()
        taskDates.append(contentsOf: taskViewModel.tasks.map{Date($0.date)})
        for day in taskDates {
            calendarView.select(day)
        }
    }
    
    func changeMonth(moveTo: Int){
        let currentDay = calendarView.currentPage
        var components = DateComponents()
        let calendar = Calendar(identifier: .gregorian)
        components.month = moveTo
        let moveMonth = calendar.date(byAdding: components, to: currentDay)!
        calendarView.setCurrentPage(moveMonth, animated: true)
    }
    
    func setCalendar() {
        calendarView.appearance.headerDateFormat = "MMM YYYY"
        calendarView.appearance.headerMinimumDissolvedAlpha = 0
        calendarView.appearance.headerTitleFont = UIFont.Poppins.semiBold.font(size: 18)
        calendarView.appearance.titleFont = UIFont.Poppins.medium.font(size: 13)
        calendarView.headerHeight = 65
        
        calendarView.today = nil
        calendarView.scope = .month
    }
    
    func setUI() {
        calendarView.layer.cornerRadius = 12
        calendarView.layer.borderWidth = 1
        calendarView.layer.borderColor = UIColor(named: "E9F1FF")?.cgColor
    }
    
}


extension CalendarViewController: FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance{
      
//      //Dot 표시
//      func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
//          if self.taskDates.contains(date){
//              return 1
//          }
//          return 0
//      }
//
//      //Dot 색상
//      func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, eventDefaultColorsFor date: Date) -> [UIColor]?{
//          if self.taskDates.contains(date){
//              return [UIColor.green]
//          }
//          return nil
//      }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        if self.taskDates.contains(date){
        }else{
            calendarView.deselect(date)
        }
    }
    
    func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
        if self.taskDates.contains(date){
            selectedDate = date
            taskTableView.reloadData()
            calendarView.select(date)
        }else{
        }
    }

}

extension CalendarViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskViewModel.tasks.filter{$0.date == selectedDate?.getDateString()}.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath) as? TodoCell else {
            return UITableViewCell()
        }
        cell.todoLabel.text = taskViewModel.tasks.filter{$0.date == selectedDate?.getDateString()}[indexPath.item].name
        
        return cell
    }
    
    
}

extension Date {
    init(_ dateString:String) {
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        dateStringFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale
        let date = dateStringFormatter.date(from: dateString)!
        self.init(timeInterval:0, since:date)
    }
}

//
//  HomeViewController.swift
//  Taskcy
//
//  Created by 김시연 on 2023/11/26.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    @IBOutlet weak var addTaskButton: UIButton!
    
    @IBOutlet weak var taskTableView: UITableView!
    @IBOutlet weak var timeLineView: UIView!
    
    let taskViewModel = TaskViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        taskViewModel.loadTasks()
        setTimeBoard()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTaskTableView), name: Notification.Name("AddTaskComplete"), object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: Notification.Name("AddTaskComplete"), object: nil)
    }
    
    func setUI() {
        taskTableView.separatorColor = UIColor(named: "E9F1FF")
        taskTableView.layer.cornerRadius = 10
        taskTableView.layer.borderWidth = 1
        taskTableView.layer.borderColor = UIColor(named: "E9F1FF")?.cgColor
    }
    
    func setTimeBoard() {
        for (index, event) in taskViewModel.events.enumerated() {
            let timeBoard = TimeBoardView()
            timeBoard.backgroundColor = UIColor(named: "756EF3")
            timeBoard.layer.cornerRadius = 16
            timeBoard.titleLabel.text = event.name
            timeBoard.timeLabel.text = "\(event.startTime ?? "") ~ \(event.endTime ?? "")"
            timeBoard.translatesAutoresizingMaskIntoConstraints = false
            print(getTimeDiff(start: event.startTime ?? "", end: event.endTime ?? ""))
            
            let eventTimeDiff = getTimeDiff(start: event.startTime ?? "", end: event.endTime ?? "")/60/30
            let startTimeDiff = getTimeDiff(start: "09:00", end: event.startTime ?? "")/60/30
            
            self.timeLineView.addSubview(timeBoard)
            
            NSLayoutConstraint.activate([
//                timeBoard.heightAnchor.constraint(equalToConstant: CGFloat(75/2*eventTimeDiff)),
//                timeBoard.topAnchor.constraint(equalTo: timeLineView.topAnchor, constant: CGFloat( ((75/2)*startTimeDiff) + (1*startTimeDiff/2)) ),
                timeBoard.heightAnchor.constraint(equalToConstant: 75),
                timeBoard.topAnchor.constraint(equalTo: timeLineView.topAnchor, constant: CGFloat( 75*index + 1*index) ),
                timeBoard.leadingAnchor.constraint(equalTo: timeLineView.leadingAnchor, constant: 70),
                timeBoard.trailingAnchor.constraint(equalTo: timeLineView.trailingAnchor, constant: -24)

            ])
        }
    }
    
    @objc func reloadTaskTableView(){
        print(taskViewModel.tasks)
        taskTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskViewModel.todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath) as? TodoCell else {
            return UITableViewCell()
        }
        cell.todoLabel.text = taskViewModel.todos[indexPath.item].name
        
        return cell
    }

    func getTimeDiff(start: String, end: String) -> Int {
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd HH:mm:ss"
                
        guard let startTime = format.date(from: "2023-01-01 \(start):00") else {return 0}
        guard let endTime = format.date(from: "2023-01-01 \(end):00") else {return 0}
        print(Int(endTime.timeIntervalSince(startTime)))
        
        return Int(endTime.timeIntervalSince(startTime))
    }
}


class TodoCell: UITableViewCell{
    @IBOutlet weak var dotImageVIew: UIImageView!
    @IBOutlet weak var todoLabel: UILabel!
    
}

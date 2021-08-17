//
//  AlarmSettingViewController.swift
//  LetsSaveEarth
//
//  Created by 김상진 on 2021/07/26.
//

import UIKit
import Then
import SnapKit

class AlarmSettingViewController: UIViewController {
    
    let titleLabel = UILabel().then {
        $0.text = "+ 알림 설정"
        $0.font = .boldSystemFont(ofSize: 30)
    }
    let nickNameTextField = RoundedGrayTextField().then {
        $0.textField.placeholder = "닉네임"
        $0.textField.setCustomPlaceholder(placeholderColor: .systemGray2, font: .boldSystemFont(ofSize: 20))
    }
    let timeTextField = RoundedGrayTextField().then {
        $0.textField.placeholder = "시간 선택"
        $0.textField.setCustomPlaceholder(placeholderColor: .systemGray2, font: .boldSystemFont(ofSize: 20))
    }
    let datePicker = UIDatePicker().then {
        $0.datePickerMode = .time
    }
    let setAlarmButton = UIButton().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.systemGray4.cgColor
        $0.setTitleColor(.blue, for: .normal)
        $0.titleLabel?.font = .boldSystemFont(ofSize: 20)
        $0.setTitleColor(.black, for: .normal)
        $0.setTitle("완료", for: .normal)
        $0.addTarget(self, action: #selector(setAlarm), for: .touchUpInside)
        // shadow
        $0.layer.shadowColor = UIColor.black.cgColor    // 조금만 연하게 하면 좋을듯
        $0.layer.shadowOpacity = 0.8
        $0.layer.shadowRadius = 3.0
        $0.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
    }
    
    let viewModel = AlarmSettingViewModel()

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupView()
        self.setDatePicker()
    }
    
    private func setupView() {
        self.view.backgroundColor = .white
        
        [titleLabel, nickNameTextField, timeTextField, setAlarmButton].forEach {
            self.view.addSubview($0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        nickNameTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(70)
        }
        timeTextField.snp.makeConstraints {
            $0.top.equalTo(nickNameTextField.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(70)
        }
        
        setAlarmButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalTo(150)
            $0.height.equalTo(50)
            $0.bottom.equalToSuperview().offset(-50)
        }
    }
    
    private func setDatePicker() {
        if #available(iOS 14, *) {
            datePicker.preferredDatePickerStyle = .wheels
            datePicker.sizeToFit()
        }
        
        datePicker.addTarget(self, action: #selector(timeChanged(sender:)), for: .valueChanged)
        
        let toolBar = UIToolbar()
        let flexibleButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneBtn = UIBarButtonItem(title: "완료", style: .done, target: self, action: #selector(donePressed))
        toolBar.setItems([flexibleButton, doneBtn], animated: true)
        toolBar.sizeToFit()
        
        
        timeTextField.textField.inputAccessoryView = toolBar
        timeTextField.textField.inputView = datePicker
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(gestureRecognizer:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func timeChanged(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh : mm a"
        timeTextField.textField.text = dateFormatter.string(from: sender.date)
    }
    
    @objc func donePressed() {
        view.endEditing(true)
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }
        
    @objc func setAlarm() {
        for i in 0..<7 {
            let task = makeReminder(dayAdded: i,
                                    title: viewModel.reminderMessages[i].title,
                                    body: viewModel.reminderMessages[i].body)
            NotificationManager.shared.scheduleNotification(task: task)
        }
    }
    
    private func makeReminder(dayAdded: Int, title: String, body: String) -> Task {
        var date = datePicker.date
        date.addTimeInterval(TimeInterval(60*60*24*dayAdded))   // TimeInterval은 기존 단위가 second
        
        let reminder = Reminder(date: date)
        let task = Task(name: title, body: body, reminder: reminder)
        
        return task
    }
}

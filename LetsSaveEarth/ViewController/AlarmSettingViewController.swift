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
    
    let nickNameTextField = RoundedGrayTextField().then {
        $0.textField.placeholder = "닉네임"
        $0.textField.setCustomPlaceholder(placeholderColor: .systemGray2, font: .boldSystemFont(ofSize: 20))
    }
    
    let datePicker = UIDatePicker().then {
        $0.datePickerMode = .time
        $0.locale = Locale(identifier: "ko_KR")
        // 추후 timeZone은 local로 수정
//        $0.timeZone = TimeZone.init(identifier: "UTC")xq
    }
    let setAlarmButton = UIButton().then {
        $0.backgroundColor = .systemGray
        $0.setTitleColor(.blue, for: .normal)
        $0.titleLabel?.font = UIFont(name: "BMHANNAAir", size: 15)
        $0.setTitle("알림 설정", for: .normal)
        $0.addTarget(self, action: #selector(setAlarm), for: .touchUpInside)
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
    }
    
    private func setupView() {
        self.view.backgroundColor = .white
        
        [nickNameTextField, datePicker, setAlarmButton].forEach {
            self.view.addSubview($0)
        }
        
        nickNameTextField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(50)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(100)
        }
        
        datePicker.snp.makeConstraints {
            $0.top.equalToSuperview().offset(200)
            $0.width.equalTo(200)
            $0.height.equalTo(100)
            $0.centerX.equalToSuperview()
        }
        
        setAlarmButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalTo(100)
            $0.height.equalTo(50)
            $0.bottom.equalToSuperview().offset(-50)
        }
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
        print("루루\(date)")
        
        let reminder = Reminder(date: date)
        let task = Task(name: title, body: body, reminder: reminder)
        
        return task
    }
}

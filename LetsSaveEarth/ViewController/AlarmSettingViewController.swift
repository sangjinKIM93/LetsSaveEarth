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
    
    let setAlarmButton = UIButton().then {
        $0.backgroundColor = .systemGray
        $0.setTitleColor(.blue, for: .normal)
        $0.setTitle("알림 설정", for: .normal)
        $0.addTarget(self, action: #selector(setAlarm), for: .touchUpInside)
    }

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
        
        [setAlarmButton].forEach {
            self.view.addSubview($0)
        }
        
        setAlarmButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalTo(100)
            $0.height.equalTo(50)
            $0.bottom.equalToSuperview().offset(-50)
        }
    }
        
    @objc func setAlarm() {
        // for문 돌릴 필요없이 그냥 repeat 하고 시작한 날짜 기준으로 날짜 세기?
        // Nope! 왜냐면 매일 알림 내용이 달라
        NotificationManager.shared.scheduleNotification(task: makeReminder())
    }
    
    private func makeReminder() -> Task {
        let currentDate = Date()
        var dateComponent = DateComponents()
        dateComponent.hour = 18
        dateComponent.minute = 30
        let futureDate = Calendar.current.date(byAdding: dateComponent, to: currentDate)
        
        print("루루\(futureDate)")
        
        let reminder = Reminder(date: futureDate)
        let task = Task(name: "test", reminder: reminder)
        
        return task
    }
}

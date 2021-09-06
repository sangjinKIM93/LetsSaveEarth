//
//  ViewController.swift
//  LetsSaveEarth
//
//  Created by 김상진 on 2021/07/25.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    let tableView = UITableView().then {
        $0.register(MeditationContentTableViewCell.self, forCellReuseIdentifier: MeditationContentTableViewCell.identifier)
    }
    
    let viewModel = ContentViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationManager.shared.requestAuthorization { _ in
            print("권한 요청")
        }
        
        self.setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        let viewController = AlarmSettingViewController()
//        self.present(viewController, animated: true, completion: nil)
        
    }
    
    private func setupView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.contents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MeditationContentTableViewCell.identifier) as! MeditationContentTableViewCell
        cell.titleLabel.text = viewModel.contents[indexPath.row].title
        cell.descriptionLabel.text = viewModel.contents[indexPath.row].description
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let position = indexPath.row
        let vc = PlayerViewController()
        
        present(vc, animated: true)
    }
}


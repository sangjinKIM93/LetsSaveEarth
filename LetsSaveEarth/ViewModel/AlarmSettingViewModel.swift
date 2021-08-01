//
//  AlarmSettingViewModel.swift
//  LetsSaveEarth
//
//  Created by 김상진 on 2021/08/01.
//

import Foundation

struct ReminderMessage {
    let title: String
    let body: String
}

struct AlarmSettingViewModel {
    
    let reminderMessages: [ReminderMessage]
        = [
            ReminderMessage(title: "지구를 지켜주 Day1", body: "집 나갈때 안 쓰는 전원을 뽑아요"),
            ReminderMessage(title: "지구를 지켜주 Day2", body: "대중교통을 활용해요"),
            ReminderMessage(title: "지구를 지켜주 Day3", body: "분리 수거를 잘 해요"),
            ReminderMessage(title: "지구를 지켜주 Day4", body: "안 쓰는 물건을 재활용 해봐요"),
            ReminderMessage(title: "지구를 지켜주 Day5", body: "냉난방을 사용하지 않아요"),
            ReminderMessage(title: "지구를 지켜주 Day6", body: "용기내 챌린지"),
            ReminderMessage(title: "지구를 지켜주 Day7", body: "줍깅. 길 가면서 쓰레기를 주워보아요")
        ]
}

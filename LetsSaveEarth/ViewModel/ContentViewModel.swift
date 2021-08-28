//
//  ContentViewModel.swift
//  LetsSaveEarth
//
//  Created by 김상진 on 2021/08/28.
//

import Foundation

struct MeditationContent {
    let title: String
    let description: String
    let step: Int
    let fileUrl: String  // 음악 파일은 저장 형식을 어떻게 해야할까?
}

struct ContentViewModel {
    
    let contents: [MeditationContent]
    
    init() {
        contents = [
            MeditationContent(title: "명상 기본 자세",
                              description: "명상 기본 자세에 대해서 알아보고, 5분간 호흡 명상을 해봅니다",
                              step: 1,
                              fileUrl: "??"),
            MeditationContent(title: "호흡에 집중하기",
                              description: "명상 기본 자세에 대해서 알아보고, 5분간 호흡 명상을 해봅니다",
                              step: 2,
                              fileUrl: "??"),
            MeditationContent(title: "바디 스캔",
                              description: "명상 기본 자세에 대해서 알아보고, 5분간 호흡 명상을 해봅니다",
                              step: 3,
                              fileUrl: "??"),
            MeditationContent(title: "걷기 명상",
                              description: "명상 기본 자세에 대해서 알아보고, 5분간 호흡 명상을 해봅니다",
                              step: 4,
                              fileUrl: "??"),
            MeditationContent(title: "다시 호흡으로",
                              description: "명상 기본 자세에 대해서 알아보고, 5분간 호흡 명상을 해봅니다",
                              step: 5,
                              fileUrl: "??"),
            MeditationContent(title: "명상 심화 1",
                              description: "명상 기본 자세에 대해서 알아보고, 5분간 호흡 명상을 해봅니다",
                              step: 6,
                              fileUrl: "??"),
            MeditationContent(title: "명상 심화 2",
                              description: "명상 기본 자세에 대해서 알아보고, 5분간 호흡 명상을 해봅니다",
                              step: 7,
                              fileUrl: "??"),
            
        ]
    }
}

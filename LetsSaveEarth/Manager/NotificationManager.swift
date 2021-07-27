//
//  NotificationManager.swift
//  LetsSaveEarth
//
//  Created by 김상진 on 2021/07/25.
//

import Foundation
import UserNotifications

enum NotificationManagerConstants {
  static let timeBasedNotificationThreadId =
    "TimeBasedNotificationThreadId"
  static let calendarBasedNotificationThreadId =
    "CalendarBasedNotificationThreadId"
  static let locationBasedNotificationThreadId =
    "LocationBasedNotificationThreadId"
}

final class NotificationManager {

    static let shared = NotificationManager()
    
    private init() {}
    
    func requestAuthorization(completion: @escaping  (Bool) -> Void) {
      UNUserNotificationCenter.current()
        .requestAuthorization(options: [.alert, .sound, .badge]) { granted, _  in
          // TODO: Fetch notification settings
          completion(granted)
        }
    }
    
    func scheduleNotification(task: Task) {
      // 2
      let content = UNMutableNotificationContent()
      content.title = task.name
      content.body = "Gentle reminder for your task!"

      // 3
      var trigger: UNNotificationTrigger?
      switch task.reminder.reminderType {
      case .time:
        if let timeInterval = task.reminder.timeInterval {
          trigger = UNTimeIntervalNotificationTrigger(
            timeInterval: timeInterval,
            repeats: task.reminder.repeats)
        }
      case .calendar:
        if let date = task.reminder.date {
          trigger = UNCalendarNotificationTrigger(
            dateMatching: Calendar.current.dateComponents(
              [.day, .month, .year, .hour, .minute],
              from: date),
            repeats: task.reminder.repeats)
        }
        content.threadIdentifier =
          NotificationManagerConstants.calendarBasedNotificationThreadId
      default:
        return
      }

      // 4
      if let trigger = trigger {
        let request = UNNotificationRequest(
          identifier: task.id,
          content: content,
          trigger: trigger)
        // 5
        UNUserNotificationCenter.current().add(request) { error in
          if let error = error {
            print(error)
          }
        }
      }
    }
}

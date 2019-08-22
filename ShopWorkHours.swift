// This one is very messy, but it is the best I can do for now (since I am running out of time :])
// Basically, I create a mirror of WorkSchedule structure, so I could iterate its properties (unwrappedWorkHours method). After that, I am able to unwrap WorkHours from these properties so I could use them later on.
// After that I start grouping days that have same WorkHours in a row. Algorithm is simple: I check if previous WorkHours is the same as the current one and if day number is one less than current (meaning its the previous day). This is to prevent grouping Monday and Wednesday (when Tuesday have different hours), for example, even though they have same WorkHours. For this I use 3 arrays: workDays, daysInSuccess and workHours. More detailed explanation can be found in the method itself.
// Later on, we have two ready-to-go arrays (one for hours, one for days), which are displayed.

import Foundation

// MARK: - Task data structure

struct Shop {

  let name: String
  let adress: String
  let workSchedule: WorkSchedule

  struct WorkSchedule {
    let monday: WorkHours?
    let tuesday: WorkHours?
    let wednesday: WorkHours?
    let thursday: WorkHours?
    let friday: WorkHours?
    let saturday: WorkHours?
    let sunday: WorkHours?
  }

  struct WorkHours {
    let from: String
    let to: String
  }
}

// MARK: - Implementation

func equal(_ firstElement: Shop.WorkHours?, _ secondElement: Shop.WorkHours?) -> Bool {
  return firstElement?.from == secondElement?.from && firstElement?.to == secondElement?.to
}

// I pass schedule as a parameter, which is unwrapped WorkHours from struct properties. Two arrays are returned - workDays and workHours.
// workDays array - this is a two-dimensional array, which holds daysInSuccess arrays. Its purpose is to group days that have same WorkHours
// daysInSuccess array - this holds days with the same WorkHours that goes one after another
// workHours array - the purpose of this is to hold distinctive hours (without repetitions)
func groupedWorkHours(schedule: [Shop.WorkHours?]) -> ([[Int]], [Shop.WorkHours?]) {
  var workDays: [[Int]] = []
  var daysInSuccess: [Int] = []
  var workHours: [Shop.WorkHours?] = []

  for (index, hour) in schedule.enumerated() {
    if workHours.isEmpty {
      workHours.append(hour)
      daysInSuccess.append(index)
    } else {
      guard let previousWorkHour = workHours.last else { break }
      if equal(hour, previousWorkHour) && daysInSuccess.last == index - 1 {
        daysInSuccess.append(index)
      } else {
        workHours.append(hour)
        workDays.append(daysInSuccess)
        daysInSuccess.removeAll()
        daysInSuccess.append(index)
      }
    }
  }
  workDays.append(daysInSuccess)
  return (workDays, workHours)
}

func romanDay(from: Int) -> String {
  switch from {
  case 0:
    return "I"
  case 1:
    return "II"
  case 2:
    return "III"
  case 3:
    return "IV"
  case 4:
    return "V"
  case 5:
    return "VI"
  case 6:
    return "VII"
  default:
    return ""
  }
}

// Here I pass grouped workHours as a parameter. Return is two ready-to-go arrays, one for days, one for hours
func formattedSchedule(workHours: [Shop.WorkHours?]) -> ([String], [String]) {
  var displayDays: [String] = []
  var displayHours: [String] = []
  let (workDays, workHours) = groupedWorkHours(schedule: workHours)
//  This "for" cycle formats grouped days to roman numbers and required format by the task
  for (_, workDay) in workDays.enumerated() {
    guard let firstDay = workDay.first else { break }
    if workDay.count > 1 {
      guard let lastDay = workDay.last else { break }
      displayDays.append(romanDay(from: firstDay) + "-" + romanDay(from: lastDay))
    } else {
      displayDays.append(romanDay(from: firstDay))
    }
  }
//  This "for" cycle formats work hours to required format by the task
  for workHour in workHours {
    guard let displayHour = workHour else {
      displayHours.append("Closed")
      break
    }
    displayHours.append(displayHour.from + " - " + displayHour.to)
  }
  return (displayDays, displayHours)
}

// Helper function to unwrap object of type "Any"
func unwrap(_ element: Any) -> Any {
  let mirroredElement = Mirror(reflecting: element)
  if mirroredElement.displayStyle != .optional {
    return element
  }
  if mirroredElement.children.count == 0 { return NSNull() }
  guard let firstChildren = mirroredElement.children.first else { return element }
  let (_, some) = firstChildren
  return some
}

// This is to unwrap workHours from the struct properties
func unwrappedWorkHours(_ shop: Shop) -> [Shop.WorkHours?] {
  let mirroredSchedule = Mirror(reflecting: shop.workSchedule)
  var workHours: [Shop.WorkHours?] = []

  for element in mirroredSchedule.children {
    let unwrappedValue = unwrap(element.value)
    if unwrappedValue is NSNull {
      workHours.append(nil)
    } else {
      let castedValue = unwrappedValue as! Shop.WorkHours
      workHours.append(castedValue)
    }
  }
  return workHours
}

func displaySchedule(shop: Shop) {
  let (days, hours) = formattedSchedule(workHours: unwrappedWorkHours(shop))
  for (index, day) in days.enumerated() {
    print(day + " " + hours[index])
  }
}

// MARK: - Testing data

func formWorkHours(_ from: String, _ to: String) -> Shop.WorkHours {
  return Shop.WorkHours(from: from, to: to)
}

let testShopWorkSchedule = Shop.WorkSchedule(
  monday: formWorkHours("9:00", "18:00"),
  tuesday: formWorkHours("9:00", "18:00"),
  wednesday: formWorkHours("9:00", "18:00"),
  thursday: formWorkHours("7:00", "18:00"),
  friday: formWorkHours("7:00", "18:00"),
  saturday: formWorkHours("9:00", "20:00"),
  sunday: nil
)
let testShop = Shop(
  name: "Iki",
  adress: "Didlaukio g. 59",
  workSchedule: testShopWorkSchedule
)
displaySchedule(shop: testShop)

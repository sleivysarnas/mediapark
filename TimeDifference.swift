import Foundation

enum DateFormatError: Error {
  case time
}

// I use DateFormatter() to have insurance against wrong inputs. The algorithm is pretty straight-forward.
// First, we format input strings to a desired format and if everything goes right, we divide by 60 to get time
// difference in minutes, since by default it is in seconds.
func differenceInMinutes(time: String, from secondTime: String) throws -> Int {
  let formatter = DateFormatter()
  formatter.dateFormat = "HH:mm"

  guard let firstTime = formatter.date(from: time),
    let secondTime = formatter.date(from: secondTime) else { throw DateFormatError.time }

  return Int(secondTime.timeIntervalSince(firstTime) / 60)
}

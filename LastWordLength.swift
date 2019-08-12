import Foundation

// Self-explanatory. Just a simple extension, where we separate string by white spaces and new lines, take the last
// element and return its character count.

extension NSString {
  func lastWordLength() -> Int? {
    return components(separatedBy: NSCharacterSet.whitespacesAndNewlines).last?.count
  }
}

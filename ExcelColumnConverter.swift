// String extension, makes it easy to call.
// Idea is that if we have, for example 'ABC', we calculate its numeric value like this:
// 'ABC' -> 'CBA' = Int(C) + Int(B) * multiplier(26) + Int(A) * multiplier(26 * 26) and so on.

extension StringProtocol {
  func columnNumber() -> Int? {
    var columnNumber = 0
    var multiplier = 1
    var asciiInt: Int

//    We reverse the string, since we need to start multiplying from the end, not beggining.
    for character in reversed() {
//      If we cannot get ASCII representation of the character, we return nil.
      guard let asciiValue = character.asciiValue else { return nil }
//      By default, above function returns UInt8 value, so we need to cast it to Int.
      asciiInt = Int(asciiValue)
//      This guard is to make sure, that we are dealing with the uppercase alphabet only.
      guard asciiInt >= 65, asciiInt <= 90 else { return nil }
//      We subtract 64 because ASCII values start from 65, not 1.
      columnNumber += (asciiInt - 64) * multiplier
//      We need to increase multiplier times 26 every character.
      multiplier *= 26
    }
    return columnNumber
  }
}

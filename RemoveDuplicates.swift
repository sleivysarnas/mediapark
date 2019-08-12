// Simple self-explanatory extension, makes it easy to call. Ex. array.withoutDuplicates()
// Also, easy to apply to all Equatable elements, just need to change 'BinaryInteger' to 'Equatable'

extension Array where Element: BinaryInteger {
  func withoutDuplicates() -> [Element] {

    var filtered: [Element] = []

    for element in self {
      if !filtered.contains(element) {
        filtered.append(element)
      }
    }
    return filtered
  }
}

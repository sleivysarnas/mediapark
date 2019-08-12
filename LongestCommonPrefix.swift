import Foundation

// We find the longest and the shortest strings in the array. After that we determine the common prefix between them.

func longestCommonPrefix(from strings: [String]) -> String {
  guard let longest = strings.max(by: {$1.count > $0.count}) else { return "" }
  guard let shortest = strings.min(by: {$1.count > $0.count}) else { return "" }
  return shortest.commonPrefix(with: longest)
}

// We could also use simple 'for' loop instead of min and max methods, but this solution is more elegant for me.
// If performance is very important, we should use 'for' loop instead, since it will use only one traversal through
// the array, instead of two with 'min' and 'max'

// Moreover, we can use extension here, but since I am using Swift 4, I would need to
// write 'extension Collection where Element: StringProtocol, Index == String.Index' which does not look very nice.

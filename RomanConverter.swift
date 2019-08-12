// This one is not very sexy, I believe it can be reworked into simpler and more compact extension. But this is the
// best I can think on the spot.

extension Int {

  enum RomanParsingError: Error {
    case invalidNumber
  }

  func romanValue() throws -> String {
    //    Since roman numbers can only be positive, we need to throw an error if it is otherwise
    guard isPositive() == true else { throw RomanParsingError.invalidNumber }
    //    All possible arabic-roman number values mapping
    let romanArabicMap = [(1000, "M"),
                          (900, "CM"),
                          (500, "D"),
                          (400, "CD"),
                          (100, "C"),
                          (90, "XC"),
                          (50, "L"),
                          (40, "XL"),
                          (10, "X"),
                          (9, "IX"),
                          (5, "V"),
                          (4, "IV"),
                          (1, "I")]

    var arabicValue = self
    var romanValue = ""

    //    The idea is to go from the highest possible roman number, which is 'M' or 1000 in arabic. If it is smaller or
    //    equal as the initial arabic value, we append 'M' to our result string. After that, we subtract appended arabic
    //    value from our initial arabic value and this cycle goes till we have 0.
    for tuple in romanArabicMap {
      while (arabicValue >= tuple.0) {
        arabicValue -= tuple.0
        romanValue.append(tuple.1)
      }
    }
    return romanValue
  }

  //  Simple helper function which is moved as a separate one, because I believe it could be reused in other places too.
  func isPositive() -> Bool {
    return self > 0
  }
}

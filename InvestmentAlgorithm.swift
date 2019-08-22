// This one was pretty interesting to do. The idea is to find local minimums and local maximums over and over again, till we reach the end.
import Foundation

struct Transaction {
  var buyDay: Int
  var sellDay: Int
}

func localMaximum(day: Int, days: Int, stockPrices: [Int]) -> Int {
  var localDay = day
  while localDay < days && stockPrices[localDay] >= stockPrices[localDay - 1] {
    localDay += 1
  }
  return localDay
}

func localMinimum(day: Int, days: Int, stockPrices: [Int]) -> Int {
  var localDay = day
  while localDay < days - 1 && stockPrices[localDay + 1] <= stockPrices[localDay] {
    localDay += 1
  }
  return localDay
}

func maximumProfit(from stockPrices: [Int]) -> [Transaction] {
  var transactions: [Transaction] = []
  var buyDay: Int
  var sellDay: Int
  let days = stockPrices.count

//  If we have only one day with stock prices, no need to calculate anything - it is impossible to make profit from one day
  guard days > 1 else { return [] }
  var day = 0

  while day < days - 1 {
    day = localMinimum(day: day, days: days, stockPrices: stockPrices)
//    This is to deal with situation, where we reach the end of stockPrices array
    if day == days - 1 { break }
    buyDay = day
    day += 1
    day = localMaximum(day: day, days: days, stockPrices: stockPrices)
    sellDay = day - 1

    transactions.append(Transaction(buyDay: buyDay, sellDay: sellDay))
  }
  return transactions
}

func displayProfit(from stockPrices: [Int]) {
  let transactions = maximumProfit(from: stockPrices)
  var totalProfit = 0
  var buyDay: Int
  var sellDay: Int

  if transactions.count < 1 {
    print("It is impossible to make profit")
  }
  for transaction in transactions {
    sellDay = transaction.sellDay
    buyDay = transaction.buyDay
    totalProfit += stockPrices[sellDay] - stockPrices[buyDay]
    print("Buy on day \(buyDay + 1) for price \(stockPrices[buyDay])")
    print("Sell on day \(sellDay + 1) for price \(stockPrices[sellDay])")
  }
  print("\nTotal profit \(totalProfit)")
}

let stockPrices = [1, 4, 5, 6, 2, 8]
displayProfit(from: stockPrices)

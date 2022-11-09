import Foundation


func findLuckyTicketsCount(_ number: Int) {
    
    // 1. Get max number
    // 999 ...
    let maxCount = Int(
        Array(repeating: 9, count: number)
            .map(String.init)
            .joined()
        ) ?? 0
    
    // 2. Get divider digits to find all combination
    // digits = [1, 10, 100 ...]
    var digits: [Int] = Array(repeating: 1, count: number)
    
    var multiply = 1
    for i in digits.indices {
        digits[i] *= multiply
        multiply *= 10
    }
    
    
    // 3. init dict for sum of combinations
    // dict sum
    var dictSum: [Int: Int] = [:]
    for i in 0...maxCount {

        let variosOfDigits = digits.map { (i / $0) % 10}
        let sum = variosOfDigits.reduce(0, +)
        dictSum[sum, default: 0] += 1
        
    }
    
    // 4. Multiply sum and get total sum
    let result = Array(dictSum.values).map{ $0*$0 }.reduce(0, +)
    
    print("result", result)
}
findLuckyTicketsCount(7)

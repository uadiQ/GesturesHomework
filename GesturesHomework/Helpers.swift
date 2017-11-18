import UIKit

struct Helpers {
    static func generateRandomArray(quantity: Int, maxBound: Int) -> [CGFloat] {
        var randomNumbersArray = [CGFloat]()
        for _ in 1...quantity {
            let randomNumber = CGFloat(arc4random_uniform(UInt32(maxBound)))
            randomNumbersArray.append(randomNumber)
        }
        return randomNumbersArray
    }
}

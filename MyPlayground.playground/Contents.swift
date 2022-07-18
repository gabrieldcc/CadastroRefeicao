var numbers: [Int] = []

func inputNumbers(quantityOfNumbers: Int) {
    for n in 1...quantityOfNumbers {
        numbers.append(n)
    }
}

func sumNumbers() -> Int {
    var total = 0
    for n in numbers {
        total += n
    }
    return total
}

inputNumbers(quantityOfNumbers: 100)
print(numbers)
print(sumNumbers())


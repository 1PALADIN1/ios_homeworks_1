import Foundation

// MARK: - 1. Написать функцию, которая определяет, четное число или нет.
func isNumberEven(number: Int) -> Bool {
    return number % 2 == 0
}

var number = 5
print("Число \(number) четное? \(isNumberEven(number: number))")
number = 8
print("Число \(number) четное? \(isNumberEven(number: number))")
number = 21
print("Число \(number) четное? \(isNumberEven(number: number))")

// MARK: - 2. Написать функцию, которая определяет, делится ли число без остатка на 3.
func isNumberDivisiblyByThree(number: Int) -> Bool {
    return number % 3 == 0
}

number = 4
print("Число \(number) делится на 3? \(isNumberDivisiblyByThree(number: number))")
number = 9
print("Число \(number) делится на 3? \(isNumberDivisiblyByThree(number: number))")
number = 21
print("Число \(number) делится на 3? \(isNumberDivisiblyByThree(number: number))")

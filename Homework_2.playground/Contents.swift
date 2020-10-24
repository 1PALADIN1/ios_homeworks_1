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

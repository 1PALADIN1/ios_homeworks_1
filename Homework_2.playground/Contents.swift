import Foundation

// MARK: - 1. Написать функцию, которая определяет, четное число или нет.
func isNumberEven(_ number: Int) -> Bool {
    return number % 2 == 0
}

var number = 5
print("Число \(number) четное? \(isNumberEven(number))")
number = 8
print("Число \(number) четное? \(isNumberEven(number))")
number = 21
print("Число \(number) четное? \(isNumberEven(number))")

// MARK: - 2. Написать функцию, которая определяет, делится ли число без остатка на 3.
func isNumberDivisiblyByThree(_ number: Int) -> Bool {
    return number % 3 == 0
}

number = 4
print("Число \(number) делится на 3? \(isNumberDivisiblyByThree(number))")
number = 9
print("Число \(number) делится на 3? \(isNumberDivisiblyByThree(number))")
number = 21
print("Число \(number) делится на 3? \(isNumberDivisiblyByThree(number))")

// MARK: - 3. Создать возрастающий массив из 100 чисел.
func generateArray() -> [Int] {
    var array: [Int] = []

    for i in 1...100 {
        array.append(i)
    }
    
    return array
}


print(generateArray())

// MARK: - 4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

//1 способ
var array = generateArray()
var index = 0
while index < array.count {
    let number = array[index]
    if (isNumberEven(number) || isNumberDivisiblyByThree(number)) {
        array.remove(at: index)
        index -= 1
    }
    index += 1
}

print(array)

//2 способ
array = generateArray().filter{ !isNumberEven($0) && !isNumberDivisiblyByThree($0) }
print(array)

//3 способ
array = generateArray()
var resultArray: [Int] = []

for item in array {
    if (isNumberEven(item) || isNumberDivisiblyByThree(item)) {
        continue
    }
    
    resultArray.append(item)
}

print(resultArray)

// MARK: - 5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов.
func addFiboNumber(_ fiboNumbers: [Decimal]) -> [Decimal] {
    guard fiboNumbers.count >= 2 else {
        print("Fibo function error")
        return fiboNumbers
    }
    
    let lastIndex = fiboNumbers.count - 1
    let nextNumber = fiboNumbers[lastIndex] + fiboNumbers[lastIndex - 1]
    
    var result = Array(fiboNumbers)
    result.append(nextNumber)
    return result
}

var fiboNumbers: [Decimal] = [ 0, 1 ]
for _ in 1...100 {
    fiboNumbers = addFiboNumber(fiboNumbers)
}

print("Fibo: ", fiboNumbers)

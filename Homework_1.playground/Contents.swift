import Foundation

// MARK: - Task 1
func solveQuadraticEq(a: Float, b: Float, c: Float) {
    let d = b * b - 4 * a * c
    
    if d < 0 {
        print("Корней нет!")
        return
    }
    
    if d == 0 {
        let x = -b / 2 * a
        print("Единственный корень: \(x)")
        return
    }
    
    let x1 = (-b + sqrt(d)) / (2 * a)
    let x2 = (-b - sqrt(d)) / (2 * a)
    
    print("Корни уравнения x1 = \(x1), x2 = \(x2)")
}

solveQuadraticEq(a: 1, b: -2, c: 3)
solveQuadraticEq(a: 1, b: -2, c: -3)
solveQuadraticEq(a: 1, b: 12, c: 36)

// MARK: - Task 2
func findHypotenuse(cathetusA: Float, cathetusB: Float) -> Float {
    return sqrt(cathetusA * cathetusA + cathetusB * cathetusB)
}

func findPerimeter(sideA: Float, sideB: Float, sideC: Float) -> Float {
    return sideA + sideB + sideC
}

func findArea(cathetusA: Float, cathetusB: Float) -> Float {
    return cathetusA * cathetusB / 2
}

let catA: Float = 12
let catB: Float = 10

let hypotenuse = findHypotenuse(cathetusA: catA, cathetusB: catB)
print("Гипотенуза: \(hypotenuse)")

let perimeter = findPerimeter(sideA: catA, sideB: catB, sideC: hypotenuse)
print("Периметр: \(perimeter)")

let area = findArea(cathetusA: catA, cathetusB: catB)
print("Площадь: \(area)")

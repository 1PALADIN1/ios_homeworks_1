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

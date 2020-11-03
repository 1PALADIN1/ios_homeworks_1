import Foundation

enum Action {
    case openWindow
    case closeWindow
    case useNitro(value: Int)
    case addNitro(value: Int)
    case loadCargo(value: Int)
    case unloadAllCargo
}

class Car {
    
    var isWindowOpened: Bool = false
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func applyAcion(action: Action) {
        switch action {
        case .openWindow:
            if (isWindowOpened) {
                print("Окно уже открыто")
                break
            }
            
            isWindowOpened = true
        case .closeWindow:
            if (!isWindowOpened) {
                print("Окно уже закрыто")
                break
            }
            
            isWindowOpened = false
        default:
            print("Неизвестная команда")
        }
    }
    
    func printInfo() {
        print("\(name). Is window opend? \(isWindowOpened)")
    }
}

class SportCar: Car {
    
    var nitroValue: Int
    var maxNitroValue: Int
    
    init(name: String, maxNitroValue: Int) {
        self.maxNitroValue = maxNitroValue
        self.nitroValue = maxNitroValue
        super.init(name: name)
    }
    
    override func applyAcion(action: Action) {
        
        switch action {
        case .useNitro(let value):
            if nitroValue - value < 0 {
                print("Нет такого количества нитро")
                break
            }
            
            nitroValue -= value
        case .addNitro(let value):
            nitroValue = nitroValue + value > maxNitroValue ? maxNitroValue : nitroValue + value
        default:
            super.applyAcion(action: action)
        }
    }
    
    override func printInfo() {
        print("\(name). Is window opend? \(isWindowOpened). Nitro: \(nitroValue)/\(maxNitroValue)")
    }
}

class TrunkCar: Car {
    
    var maxCargo: Int
    var cargo: Int
    
    init(name: String, maxCargo: Int) {
        self.maxCargo = maxCargo
        self.cargo = 0
        super.init(name: name)
    }
    
    override func applyAcion(action: Action) {
        switch action {
        case .loadCargo(let value):
            if cargo + value > maxCargo {
                print("Столько груза не влезет...")
                break
            }
            
            cargo += value
        case .unloadAllCargo:
            cargo = 0
        default:
            super.applyAcion(action: action)
        }
    }
    
    override func printInfo() {
        print("\(name). Is window opend? \(isWindowOpened). Cargo: \(cargo)/\(maxCargo)")
    }
}

var mustang = SportCar(name: "Ford mustang", maxNitroValue: 800)
mustang.printInfo()
mustang.applyAcion(action: .openWindow)
mustang.applyAcion(action: .useNitro(value: 400))
mustang.printInfo()
mustang.applyAcion(action: .addNitro(value: 300))
mustang.printInfo()
mustang.applyAcion(action: .addNitro(value: 400))
mustang.printInfo()

var kamaz = TrunkCar(name: "Kamaz", maxCargo: 1500)
kamaz.printInfo()
kamaz.applyAcion(action: .openWindow)
kamaz.applyAcion(action: .loadCargo(value: 1000))
kamaz.printInfo()
kamaz.applyAcion(action: .closeWindow)
kamaz.applyAcion(action: .loadCargo(value: 1000))
kamaz.printInfo()
kamaz.applyAcion(action: .unloadAllCargo)
kamaz.printInfo()

import Foundation

enum Action {
    case startEngine
    case stopEngine
    case openWindow
    case closeWindow
    case loadTrunk(weight: Int)
    case unloadTrunk(weight: Int)
    case loadBody(weight: Int)
    case unloadBody(weight: Int)
}

struct SportCar {
    let brand: String
    let issueYear: Int
    let trunkVolume: Int
    
    var filledVolume: Int
    
    var isEngineStarted: Bool
    var isWindowsOpened: Bool
    
    init(brand: String, issueYear: Int, trunkVolume: Int) {
        self.brand = brand
        self.issueYear = issueYear
        self.trunkVolume = trunkVolume
        self.filledVolume = 0
        self.isEngineStarted = false
        self.isWindowsOpened = false
    }
    
    mutating func applyAction(action: Action) {
        switch action {
        case .startEngine:
            if (isEngineStarted) {
                print("Двигатель уже запущен")
                break
            }
            
            isEngineStarted = true
        case .stopEngine:
            if (!isEngineStarted) {
                print("Двигатель уже остановлен")
                break
            }
            
            isEngineStarted = false
        case .openWindow:
            if (isWindowsOpened) {
                print("Окно уже открыто")
                break
            }
            
            isWindowsOpened = true
        case .closeWindow:
            if (!isWindowsOpened) {
                print("Окно уже закрыто")
                break
            }
            
            isWindowsOpened = false
        case let .loadTrunk(weight):
            if (weight + filledVolume > trunkVolume) {
                print("\(brand) перегружен...")
                break
            }
            
            filledVolume += weight
        case let .unloadTrunk(weight):
            filledVolume -= weight
            
            if (filledVolume < 0) {
                filledVolume = 0
            }
        default:
            print("Такого действия не существует")
        }
    }
    
    func printInfo() {
        print("\(brand), year: \(issueYear), max volume: \(trunkVolume), filled volume \(filledVolume), engine statred? \(isEngineStarted), windows opened? \(isWindowsOpened)")
    }
}

struct TrunkCar {
    let brand: String
    let issueYear: Int
    let bodyVolume: Int
    
    var filledVolume: Int
    
    var isEngineStarted: Bool
    var isWindowsOpened: Bool
    
    init(brand: String, issueYear: Int, bodyVolume: Int) {
        self.brand = brand
        self.issueYear = issueYear
        self.bodyVolume = bodyVolume
        self.filledVolume = 0
        self.isEngineStarted = false
        self.isWindowsOpened = false
    }
    
    mutating func applyAction(action: Action) {
        switch action {
        case .startEngine:
            if (isEngineStarted) {
                print("Двигатель уже запущен")
                break
            }
            
            isEngineStarted = true
        case .stopEngine:
            if (!isEngineStarted) {
                print("Двигатель уже остановлен")
                break
            }
            
            isEngineStarted = false
        case .openWindow:
            if (isWindowsOpened) {
                print("Окно уже открыто")
                break
            }
            
            isWindowsOpened = true
        case .closeWindow:
            if (!isWindowsOpened) {
                print("Окно уже закрыто")
                break
            }
            
            isWindowsOpened = false
        case let .loadBody(weight):
            if (weight + filledVolume > bodyVolume) {
                print("\(brand) перегружен...")
                break
            }
            
            filledVolume += weight
        case let .unloadBody(weight):
            filledVolume -= weight
            
            if (filledVolume < 0) {
                filledVolume = 0
            }
        default:
            print("Такого действия не существует")
        }
    }
    
    func printInfo() {
        print("\(brand), year: \(issueYear), max volume: \(bodyVolume), filled volume \(filledVolume), engine statred? \(isEngineStarted), windows opened? \(isWindowsOpened)")
    }
}


var ladaGranta = SportCar(brand: "Lada", issueYear: 2016, trunkVolume: 300)
ladaGranta.applyAction(action: .startEngine)
ladaGranta.applyAction(action: .openWindow)
ladaGranta.applyAction(action: .loadTrunk(weight: 200))
ladaGranta.printInfo()

var kamaz = TrunkCar(brand: "Kamaz", issueYear: 1998, bodyVolume: 1800)
kamaz.applyAction(action: .loadBody(weight: 800))
kamaz.applyAction(action: .startEngine)
kamaz.applyAction(action: .openWindow)
kamaz.printInfo()

kamaz.applyAction(action: .loadBody(weight: 1800))
kamaz.applyAction(action: .closeWindow)
kamaz.applyAction(action: .stopEngine)
kamaz.applyAction(action: .unloadBody(weight: 400))
kamaz.printInfo()

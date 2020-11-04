import Foundation

enum Action {
    case addFuel(value: Int)
    case startRace
    case addCargo(value: Int)
    case removeAllCargo
}

protocol Car: AnyObject{
    
    var isWindowOpened: Bool { get set }
    var isEngineStarted: Bool { get set }
    
    func openWindow()
    func closeWindow()
    func startEngine()
    func stopEngine()
    
    func applyAction(action: Action)
}

extension Car {
    
    func openWindow() {
        guard !isWindowOpened else {
            print("Окно уже открыто!")
            return
        }
        
        isWindowOpened = true
    }
    
    func closeWindow() {
        guard isWindowOpened else {
            print("Окно уже закрыто!")
            return
        }
        
        isWindowOpened = false
    }
    
    func startEngine() {
        guard !isEngineStarted else {
            print("Двигатель уже запущен!")
            return
        }
        
        isEngineStarted = true
    }
    
    func stopEngine() {
        guard isEngineStarted else {
            print("Двигатель уже остановлен!")
            return
        }
        
        isEngineStarted = false
    }
}

class SportCar: Car, CustomStringConvertible {
    
    var isWindowOpened: Bool = false
    var isEngineStarted: Bool = false
    
    var maxFuel: Int
    var fuel: Int
    var raceRequireFuel: Int
    
    init(maxFuel: Int, raceRequireFuel: Int) {
        self.maxFuel = maxFuel
        self.raceRequireFuel = raceRequireFuel
        self.fuel = maxFuel
    }
    
    func applyAction(action: Action) {
        switch action {
        case .addFuel(value: let value):
            fuel = value + fuel > maxFuel ? maxFuel : value + fuel
            break
        case .startRace:
            guard fuel - raceRequireFuel >= 0 else {
                print("Недостаточно топлива, чтобы начать гонку")
                return
            }
            
            fuel -= raceRequireFuel
            break
        default:
            print("Действие не распознано")
            break
        }
    }
    
    var description: String {
        return "SportCar. Окно открыто? \(isWindowOpened) Двигатель запущен? \(isEngineStarted). Топливо \(fuel)/\(maxFuel)"
    }
}

class TrunkCar: Car, CustomStringConvertible {
    
    var isWindowOpened: Bool = false
    var isEngineStarted: Bool = false
    
    var maxCargo: Int
    var cargo: Int
    
    init(maxCargo: Int) {
        self.maxCargo = maxCargo
        self.cargo = 0
    }
    
    func applyAction(action: Action) {
        switch action {
        case .addCargo(value: let value):
            guard cargo + value <= maxCargo else {
                print("Грузовик переполнен")
                return
            }
            
            cargo += value
            break
        case .removeAllCargo:
            guard cargo > 0 else {
                print("Грузовик пустой, разгружать нечего")
                return
            }
            
            cargo = 0
            break
        default:
            print("Действие не распознано")
            break
        }
    }
    
    var description: String {
        return "TrunkCar. Окно открыто? \(isWindowOpened) Двигатель запущен? \(isEngineStarted). Загруженность \(cargo)/\(maxCargo)"
    }
}

let sportCar: Car = SportCar(maxFuel: 200, raceRequireFuel: 80)
print(sportCar)

sportCar.openWindow()
sportCar.openWindow()
sportCar.closeWindow()
print(sportCar)

sportCar.startEngine()
sportCar.startEngine()
sportCar.stopEngine()
print(sportCar)

sportCar.applyAction(action: .startRace)
print(sportCar)
sportCar.applyAction(action: .startRace)
sportCar.applyAction(action: .startRace)
sportCar.applyAction(action: .addFuel(value: 40))
print(sportCar)

let trunkCar: Car = TrunkCar(maxCargo: 800)
print(trunkCar)

trunkCar.startEngine()
trunkCar.applyAction(action: .addCargo(value: 350))
print(trunkCar)
trunkCar.applyAction(action: .addCargo(value: 400))
trunkCar.applyAction(action: .addCargo(value: 200))
trunkCar.applyAction(action: .removeAllCargo)
print(trunkCar)
trunkCar.applyAction(action: .addCargo(value: 400))
print(trunkCar)

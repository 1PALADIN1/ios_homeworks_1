import Foundation

/*
 Придумать класс, методы которого могут выбрасывать ошибки.
 Реализуйте несколько throws-функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch.
 */

enum StoreError: Error {
    case notRegisteredDevice
    case deviceAlreadyRegistered
    case devicesRunOut
}

enum DeviceType {
    case iPhone12
    case iPhone12Mini
    case macBookAir
    case macMini
}

struct Device {
    let deviceType: DeviceType
    let fullName: String
    let cost: Int
    
    init(deviceType: DeviceType, fullName: String, cost: Int) {
        self.deviceType = deviceType
        self.fullName = fullName
        self.cost = cost
    }
}

class AppleStore {
    let address: String
    
    private var registerDevices: [DeviceType: Device]
    private var shippedDevices: [DeviceType: Int]
    
    init(address: String) {
        self.address = address
        self.registerDevices = [:]
        self.shippedDevices = [:]
    }
    
    func registerDevice(device: Device) throws {
        if registerDevices[device.deviceType] != nil {
            throw StoreError.deviceAlreadyRegistered
        }
        
        registerDevices[device.deviceType] = device
    }
    
    //отгрузить товар
    func addDevicesToStore(deviceType: DeviceType, amount: Int) throws {
        guard registerDevices[deviceType] != nil else {
            throw StoreError.notRegisteredDevice
        }
        
        if let deviceAmount = shippedDevices[deviceType] {
            shippedDevices[deviceType] = deviceAmount + amount
        } else {
            shippedDevices[deviceType] = amount
        }
    }
    
    func getDevicePrice(deviceType: DeviceType) throws -> Int {
        if let device = registerDevices[deviceType] {
            return device.cost
        }
        
        throw StoreError.notRegisteredDevice
    }
    
    func sellDevice(deviceType: DeviceType, amount: Int) throws {
        guard registerDevices[deviceType] != nil else {
            throw StoreError.notRegisteredDevice
        }
        
        if let storeAmount = shippedDevices[deviceType] {
            guard storeAmount >= amount else {
                throw StoreError.devicesRunOut
            }
            
            shippedDevices[deviceType] = storeAmount - amount
        } else {
            throw StoreError.devicesRunOut
        }
        
    }
}


let store = AppleStore(address: "767 5th Ave, New York, NY 10153, Соединенные Штаты")
let iPhone12 = Device(deviceType: .iPhone12, fullName: "iPhone 12", cost: 799)
let iPhone12Mini = Device(deviceType: .iPhone12Mini, fullName: "iPhone 12 Mini", cost: 599)
let macBookAir = Device(deviceType: .macBookAir, fullName: "Macbook Air", cost: 999)
let macMini = Device(deviceType: .macMini, fullName: "Mac Mini", cost: 899)

//test registerDevice
do {
    try store.registerDevice(device: iPhone12)
    try store.registerDevice(device: iPhone12)
} catch StoreError.deviceAlreadyRegistered {
    print("Устройство уже зарегистрировано в магазине!")
}

//test addDevicesToStore
do {
    try store.addDevicesToStore(deviceType: .iPhone12Mini, amount: 5)
} catch StoreError.notRegisteredDevice {
    print("Не удалось найти устройство в базе данных!")
}

try store.registerDevice(device: iPhone12Mini)
try store.registerDevice(device: macBookAir)
try store.addDevicesToStore(deviceType: .iPhone12Mini, amount: 5)
try store.addDevicesToStore(deviceType: .macBookAir, amount: 10)

//test getDevicePrice
do {
    var devicePrice = try store.getDevicePrice(deviceType: .iPhone12)
    print("Цена на устройство: \(devicePrice)")
    
    devicePrice = try store.getDevicePrice(deviceType: .macMini)
} catch StoreError.notRegisteredDevice {
    print("Не удалось найти устройство в базе данных!")
}

try store.registerDevice(device: macMini)
try store.addDevicesToStore(deviceType: .macMini, amount: 15)

//test sellDevice
do {
    try store.sellDevice(deviceType: .macMini, amount: 10)
    try store.sellDevice(deviceType: .macMini, amount: 10)
} catch StoreError.notRegisteredDevice {
    print("Не удалось найти устройство в базе данных!")
} catch StoreError.devicesRunOut {
    print("Устройства закончились, увы...")
}

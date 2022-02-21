//
//  main.swift
//  Course_1
//
//  Created by Kirill on 09.02.2022.
//

import Foundation

/*
1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
5. Создать несколько объектов каждого класса. Применить к ним различные действия.
6. Вывести значения свойств экземпляров в консоль.
 */

enum Actions {
    case startEngine
    case stopEngine
    case openWindow
    case closeWindow
    case putInTrunk
    case takeFromTrunk
    case installFastWheels
    case installSlowWheels
    case checkTint
    case installBigTruckBusket
    case installSmallTruckBasket
    case status
}

///Супер класс Car
class Car {
    
    var carBrand: String
    let carAge: Int
    let carMileage: Int
    let ownerAmount: Int
    let isTrunkFull: Bool
    let isWindowOpened: Bool
    
    init(carBrand: String,
         carAge: Int,
         carMileage: Int,
         ownerAmont: Int,
         isTrunkFull: Bool,
         isWindowOpened: Bool)
    {
        self.carBrand = carBrand
        self.carAge = carAge
        self.carMileage = carMileage
        self.ownerAmount = ownerAmont
        self.isTrunkFull = isTrunkFull
        self.isWindowOpened = isWindowOpened
    }
    
    func method(value: Actions) {
    }
}

/// Наследник SportCar
final class SportCar: Car {
    
    let wheelSize: Int
    var maxSpeed: Int
    var isTinted: Bool
    
    init(wheelSize: Int,
         maxSpeed: Int,
         isTinted: Bool)
    {
        self.wheelSize = wheelSize
        self.maxSpeed = maxSpeed
        self.isTinted = isTinted
        super.init(carBrand: "Tesla",
                   carAge: 1,
                   carMileage: 22800,
                   ownerAmont: 1,
                   isTrunkFull: false,
                   isWindowOpened: false)
    }
    
    override func method(value: Actions) {
        
        switch value {
        
        // Смена колес
        case .installFastWheels:
            let speedChange = 30
            maxSpeed = maxSpeed + speedChange
            print("Максимальная скорость увеличена на \(speedChange)км/ч")
        case .installSlowWheels:
            let speedChange = 30
            maxSpeed = maxSpeed - speedChange
            print("Максимальная скорость уменьшена на \(speedChange)км/ч")
            
        // Проверка тонировки
        case .checkTint:
            isTinted == true ? print("Штраф 500 рублей!") : print("Все супер!")
            
        default: break
        }
    }
    
    func info() -> String {
        return """
            Марка: \(carBrand)
            Возраст: \(carAge) лет
            Пробег: \(carMileage) км
            Кол-во владельцев: \(ownerAmount)
            Максимальная скорость: \(maxSpeed) км/ч
            """
    }
    }

/// Наследник TrunkCar
final class TrunkCar: Car {
    
    let trunkVolume: Int
    var maxWeight = 600
    let isTrunkCarOverloaded: Bool
    
    init (trunkVolume: Int,
          isTrunkCarOverloaded: Bool)
    {
        self.trunkVolume = trunkVolume
        self.isTrunkCarOverloaded = isTrunkCarOverloaded
        super.init(carBrand: "Volvo",
                   carAge: 12,
                   carMileage: 239000,
                   ownerAmont: 5,
                   isTrunkFull: true,
                   isWindowOpened: false)
    }
    
    override func method(value: Actions) {
        
        switch value {
        
        // Смена корзины грузовика
        case .installBigTruckBusket:
            maxWeight += 200
            print("Грузоподъемность трака целых \(maxWeight)кг")
        case .installSmallTruckBasket:
            maxWeight -= 200
            print("Грузоподъемность трака всего \(maxWeight)кг")
        default: break
        }
    }
}

//MARK: - Вывод в консоль
let actionsWithSportCar = SportCar(wheelSize: 20, maxSpeed: 200, isTinted: false)
actionsWithSportCar.method(value: .checkTint)
actionsWithSportCar.method(value: .installFastWheels)
print(actionsWithSportCar.maxSpeed)
actionsWithSportCar.method(value: .installSlowWheels)
print(actionsWithSportCar.maxSpeed)

let actionsWithTrunkCar = TrunkCar(trunkVolume: 200, isTrunkCarOverloaded: false)
actionsWithTrunkCar.carBrand = "KAMAZ"
print(actionsWithTrunkCar.carBrand)

actionsWithTrunkCar.method(value: .installBigTruckBusket)
print(actionsWithTrunkCar.maxWeight)

let trunkClone = actionsWithTrunkCar
trunkClone.carBrand = "Truuunk"
print(trunkClone.carBrand)
print(actionsWithTrunkCar.carBrand)

actionsWithTrunkCar.carBrand = "Volkswagen"
print(actionsWithTrunkCar.carBrand)
print(trunkClone.carBrand)

print(actionsWithSportCar.info())
actionsWithSportCar.method(value: .installFastWheels)
print(actionsWithSportCar.info())




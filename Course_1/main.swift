//
//  main.swift
//  Course_1
//
//  Created by Kirill on 09.02.2022.
//

import Foundation

/*
 1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
 2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
 3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
 4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
 5. Создать несколько объектов каждого класса. Применить к ним различные действия.
 6. Вывести сами объекты в консоль.
 */


//MARK: - Протокол CarProtocol

protocol CarProtocol {
    var carBrand: String { get }
    var carAge: Int { get }
    var totalMileage: Int { get }
    var enginePower: Double { get }
    var isEngineOn: Bool { get set }
    var isDoorOpened: Bool { get set }
    var isWindowOpened: Bool { get set }
    func carActions()
}


//MARK: - Расширение протокола CarProtocol

extension CarProtocol {
    
    // Запуск/остановка двигателя
    mutating func startEngine() {
        isEngineOn = true
        print("Engine is on")
    }
    
    mutating func stopEngine() {
        isEngineOn.toggle()
        print("Engine is off")
    }
    
    // Открытие/закрытие окна
    mutating func openWindow() {
        isWindowOpened = true
        print("Window is opened")
    }
    
    mutating func closeWindow() {
        isWindowOpened.toggle()
        print("Window is opened")
    }
    
    
    // Открытие/закрытие двери
    mutating func openDoor() {
        isDoorOpened = true
        print("Door is opened")
    }
    
    mutating func closeDoor() {
        isDoorOpened.toggle()
        print("Door is opened")
    }
}

//MARK: - Класс SportCar

final class SportCar: CarProtocol {
    let carBrand: String
    let carAge: Int
    let totalMileage: Int
    let enginePower: Double
    var isEngineOn: Bool
    var isDoorOpened: Bool
    var isWindowOpened: Bool
    func carActions() {}
    
    private var color: String
    private let wheelDiameter: Int
    private let seatAmount: Int
    
    init (carBrand: String,
          carAge: Int,
          totalMileage: Int,
          wheelDiameter: Int,
          seatAmount: Int,
          enginePower: Double,
          isEngineOn: Bool = false,
          isDoorOpened: Bool = false,
          isWindowOpened: Bool = false,
          color: String)
    {
        self.carBrand = carBrand
        self.carAge = carAge
        self.totalMileage = totalMileage
        self.wheelDiameter = wheelDiameter
        self.seatAmount = seatAmount
        self.enginePower = enginePower
        self.isEngineOn = isEngineOn
        self.isDoorOpened = isDoorOpened
        self.isWindowOpened = isWindowOpened
        self.color = color
    }
}


//MARK: - Расширение класса SportCar, имплементирующее протокол CustomStringConvertible

extension SportCar: CustomStringConvertible {
    var description: String {
        return """
            ----------------------------------
            Info about Sport Car
            ----------------------------------
            Car brand: \(carBrand)
            Color: \(color)
            Car age: \(carAge)
            Total mileage: \(totalMileage)
            Wheels diameter: \(wheelDiameter)
            Seats amount: \(seatAmount)
            Engine power: \(enginePower)
            ----------------------------------
            """
    }
}

//MARK: - Класс TrunkCar

final class TrunkCar: CarProtocol {
    let carBrand: String
    let carAge: Int
    let totalMileage: Int
    let enginePower: Double
    var isEngineOn: Bool
    var isDoorOpened: Bool
    var isWindowOpened: Bool
    func carActions() {}
    
    private let loadCapacity: Int
    private let trunkCapacity: Int
    private var isBedInstalled: Bool
    
    init (carBrand: String,
          carAge: Int,
          totalMileage: Int,
          loadCapacity: Int,
          trunkCapacity: Int,
          enginePower: Double,
          isEngineOn: Bool = false,
          isDoorOpened: Bool = false,
          isWindowOpened: Bool = false,
          isBedInstalled: Bool = false)
    {
        self.carBrand = carBrand
        self.carAge = carAge
        self.totalMileage = totalMileage
        self.loadCapacity = loadCapacity
        self.trunkCapacity = trunkCapacity
        self.enginePower = enginePower
        self.isEngineOn = isEngineOn
        self.isDoorOpened = isDoorOpened
        self.isWindowOpened = isWindowOpened
        self.isBedInstalled = isBedInstalled
    }
}


//MARK: - Расширение класса TrunkCar, имплементирующее протокол CustomStringConvertible

extension TrunkCar: CustomStringConvertible {
    var description: String {
        return """
            ----------------------------------
            Info about Trunk Car
            ----------------------------------
            Car brand: \(carBrand)
            CarAge: \(carAge)
            Total mileage: \(totalMileage)
            Engine power: \(enginePower)
            Load capacity: \(loadCapacity)kg
            Trunk capacity: \(trunkCapacity)kg
            Bed inside: \(isBedInstalled)
            ----------------------------------
            """
    }
}


//MARK: - Расширение класса TrunkCar(установка кровати)

extension TrunkCar {
    
    func installBed() {
        isBedInstalled = true
        print("Bed is istalled")
    }
    
    func uninstallBed() {
        isBedInstalled = false
        print("Bed isn't istalled")
    }
}

//MARK: - Объекты и вывод действий в консоль

let porshe = SportCar(carBrand: "Porshe",
                      carAge: 2,
                      totalMileage: 2333,
                      wheelDiameter: 22,
                      seatAmount: 2,
                      enginePower: 450,
                      isEngineOn: false,
                      isDoorOpened: false,
                      isWindowOpened: false,
                      color: "yellow")

print(porshe.description)

let volvo = TrunkCar(carBrand: "Volvo",
                      carAge: 9,
                      totalMileage: 248_455,
                      loadCapacity: 4000,
                      trunkCapacity: 3200,
                      enginePower: 600)

print(volvo.description)
volvo.installBed()
print(volvo.description)




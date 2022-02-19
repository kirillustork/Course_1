//
//  main.swift
//  Course_1
//
//  Created by Kirill on 09.02.2022.
//

import Foundation

//MARK: - Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.

enum ActionsWithSportCar {
    case startEngine
    case stopEngine
    case openWindow
    case closeWindow
    case putInTrunk
    case takeFromTrunk
}


//MARK: - Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.

struct SportCar {
    let carBrand: String
    let age: Int
    var trunkVolume = 50
    var trunkFullness: Int
    var isEngineOn = false
    var isWindowOpened = false
    

//MARK: - Инициализировать несколько экземпляров структур. Применить к ним различные действия.
    
    init(carBrand1: String,
         age1: Int,
         trunkVolume1: Int,
         trunkFullness: Int)
    {
        carBrand = carBrand1
        age = age1
        trunkVolume = trunkVolume1
        self.trunkFullness = trunkFullness //можно через self
        //self дает компиллятору понять, какое имя внутреннее, а какое внешнее
    }
    
    
//MARK: - Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
    
    mutating func actions(value : ActionsWithSportCar) {
    //делаем функцию мутабельной иначе не сможем менять св-во внутри структуры
        
        switch value {
        
        //Запуск или остановка двигателя
        case .startEngine:
            isEngineOn = true //вот это свойство меняем
            print("Двигатель запущен")
        case .stopEngine:
            isEngineOn = false
            print("Двигатель заглушен")
            
        //Открытие или закрытие окон
        case .openWindow:
            isWindowOpened = true //вот это свойство меняем
            print("Окна открыты")
        case .closeWindow:
            isWindowOpened = false
            print("Окна закрыты")
            
        //Положить/выложить груз из багажника
        case .putInTrunk:
            trunkFullness != trunkVolume ? trunkFullness += 50 : print("Багажник заполнен")
        case .takeFromTrunk:
            trunkFullness != 0 ? trunkFullness -= 50 : print("Багажник пуст")
        }
    }
    func autoStatus() {
        print("Машина марки \(carBrand), \(age) лет эксплуатации, вместимость багажника \(trunkVolume) литров, \(trunkFullness), \(isEngineOn), \(isWindowOpened)")
    }
}


//MARK: - Вывести значения свойств экземпляров в консоль.

var car = SportCar(carBrand1: "Porshe", age1: 5, trunkVolume1: 50, trunkFullness: 0)
print(car) // Багажник пустой
car.actions(value: .putInTrunk) // заполняет багажник
print(car) // багажник полный
car.actions(value: .putInTrunk) // показывает, что багажник заполнен


//MARK: - Практика с get/set

struct MuscleCar {
    var wheelsize: Int
    var clearance: Int {
        get {
            return wheelsize + 15
        }
        set{
            wheelsize = newValue - 15 // сработает только при изменении значения
        }
    }
}

var myMuscleCar = MuscleCar(wheelsize: 18)
print(myMuscleCar.clearance)
myMuscleCar.clearance = 40
print(myMuscleCar.clearance)
print(myMuscleCar.wheelsize)


//MARK: - Практика с willSet/didSet

struct Mileage {
    var totalMileage: Int = 0 {
        willSet(newValue) { // работает с newValue
            print("Следующее значение будет равно \(newValue)")
        }
        didSet { // работает с oldValue
            print("Добавлено \(oldValue) километров пробега")
        }
    }
}

var myMileage = Mileage()

print(myMileage.totalMileage)
myMileage.totalMileage = 1115
print(myMileage.totalMileage)
myMileage.totalMileage = 9860
print(myMileage.totalMileage)



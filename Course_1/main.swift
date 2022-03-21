//
//  main.swift
//  Course_1
//
//  Created by Kirill on 09.02.2022.
//

/*
 1. Придумать класс, методы которого могут завершаться неудачей и возвращать либо значение, либо ошибку Error?. Реализовать их вызов и обработать результат метода при помощи конструкции if let, или guard let.
 2. Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch.
 */



import Foundation


//MARK: - Errors

enum BuyCarErrors: Error {
    case errorStock
    case errorBudget
    case errorName
}

//MARK: - Model

struct Item {
    let price: Int
    var stock: Int
    let model: TaxiCar
}

struct TaxiCar {
    let name: String
}


//MARK: - View and Controller

final class CarFactory {
    
    var carsInStock = [
        "Kia Rio": Item(price: 1_200_000, stock: 8, model: TaxiCar(name: "Kia Rio")),
        "Volkswagen Polo": Item(price: 1_220_000, stock: 12, model: TaxiCar(name: "Volkswagen Polo")),
        "Hyundai Solaris": Item(price: 1_100_000, stock: 4, model: TaxiCar(name: "Hyundai Solaris"))
    ]
    
    var budget = 0
    
    func buyCar(carName name: String) throws -> TaxiCar {
        guard let car = carsInStock[name] else { throw BuyCarErrors.errorName }
        guard car.stock > 0 else { throw BuyCarErrors.errorStock }
        guard car.price <= budget else { throw BuyCarErrors.errorBudget }
        
        budget -= car.price
        
        var newCar = car
        newCar.stock -= 1
        carsInStock[name] = newCar
        
        print("В таксопарке новая \(name)")
        return newCar.model
    }
}

//MARK: - Console test

let carfactory = CarFactory()
carfactory.budget = 8_000_000

do {
    let model = try carfactory.buyCar(carName: "Kia Rio")
    print(model.name)
} catch let error {
    print(error)
}

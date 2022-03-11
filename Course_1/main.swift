//
//  main.swift
//  Course_1
//
//  Created by Kirill on 09.02.2022.
//

import Foundation

/*
 1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
 2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
 3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.
 */

//MARK: - Variables

var emptyArrayPeople = [String]()
var emptyArrayAges = [Int]()


//MARK: - Structure

struct Queue<T> {

    var items = [T]()

    
    //MARK: - Methods
    
    mutating func addItem(item: T) {
        items.append(item)
    }

    mutating func delLastItem() {
        if items.isEmpty {
            print("There are no items")
        } else {
            items.removeLast()
        }
    }
    
    func filter(array: [T], value: (T) -> Bool) -> [T] {
        var filteredArray = [T]()
        for i in array {
            if value(i) {
                filteredArray.append(i)
            }
        }
        return filteredArray
    }
}


//MARK: - Console

var people = Queue(items: emptyArrayPeople)
people.addItem(item: "Ivanov")
people.addItem(item: "Petrov")
people.addItem(item: "Sidorov")
people.addItem(item: "Kaktus")
people.addItem(item: "Kokorin")
print(people.items)
print(people.filter(array: people.items, value: {$0.hasPrefix("K")}))


var ages = Queue(items: emptyArrayAges)
ages.addItem(item: 22)
ages.addItem(item: 40)
ages.addItem(item: 60)
ages.addItem(item: 44)
print(ages.items)
print(ages.filter(array: ages.items, value: {$0 % 3 == 0}))

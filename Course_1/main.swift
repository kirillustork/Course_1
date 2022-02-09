//
//  main.swift
//  Course_1
//
//  Created by Kirill on 09.02.2022.
//

import Foundation

// MARK: - 1. Написать функцию, которая определяет, четное число или нет.

let numbers = [2, 3, 4, 4, 12, 9, 8, 7]

func parityCheck () {
    for number in numbers {
        if number % 2 == 0 {
            print("Число \(number) чётное")
        } else {
            print("Число \(number) нечётное")
        }
    }
}

parityCheck()


// MARK: - 2. Написать функцию, которая определяет, делится ли число без остатка на 3.

let randomNumbers = [2, 3, 4, 4, 12, 9, 8, 7]

func division () {
    for number in randomNumbers {
        if number % 3 == 0 {
            print("Число \(number) делится на 3 без остатка")
        } else {
            print("Число \(number) не делится на 3 без остатка")
        }
    }
}

division()


// MARK: - 3. Создать возрастающий массив из 100 чисел.

var oneHundred: Array = [1, 2]

for i in 3...100{
    oneHundred.append(i)
}

print(oneHundred)


// MARK: - 4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

var arrayHundred: Array = [1, 2]

for i in 3...100{
    if i % 2 == 0 && i % 3 == 0 {
        arrayHundred.append(i)
    }
}

print(arrayHundred)


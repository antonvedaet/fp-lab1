# ФИО

---

**Студент:** Ведерников Антон Владимирович  
**ИСУ:** 367970  
**Группа:** P3323  
**Университет:** НИУ ИТМО  
**Факультет:** Программная инженерия и компьютерная техника  
**Курс:** 3-й курс  

---
# Отчет
В отчете представлены решения задач 13, 18 с сайта Project Euler с несколькими решениями. Все решения написаны на языке Haskell. Решениями я пытался показать сильные стороны этого языка программирования.

## Решения задачи 13
### 1. Рекурсивное
```haskell
task13Recursively :: [Integer] -> Integer
task13Recursively [] = 0
task13Recursively (x : xs) = x + task13Recursively xs
```
Классический рекурсивный подход


[Файл с решением](/src/Task13.hs)

### 2. С хвостовой рекурсией
```haskell
task13Tail :: [Integer] -> Integer
task13Tail x = go x 0
  where
    go :: [Integer] -> Integer -> Integer
    go [] acc = acc
    go (xx : xs) acc = go xs (acc + xx)
```
Оптимизированная рекурсия


[Файл с решением](/src/Task13.hs)

### 3. Модульное
```haskell
task13RecursiveAlt :: [Integer] -> Integer
task13RecursiveAlt = foldl (+) 0 . filter (> 0)
```
Использование встроенных функций высшего порядка и разделение алгоритма


[Файл с решением](/src/Task13.hs)

### 4. Использую ленивую коллекцию
```haskell
task13Lazy :: [Integer] -> Integer
task13Lazy = sum
```
Демонстрация работы с ленивыми коллекциями


[Файл с решением](/src/Task13.hs)

### 5. Дополнительные функции
```haskell
--Функция для того чтобы отрезать первые 10 цифр от числа
takeFirst10Digits :: Integer -> Integer 
takeFirst10Digits n = read $ take 10 (show n) :: Integer


--Пример работы map
task13NumbersDoubled :: [Integer]
task13NumbersDoubled = map (* 2) task13Numbers
```
Вспомогательные функции для обработки данных


[Файл с решением](/src/Task13.hs)

## Решения задачи 18
### 1. Рекурсивное
```haskell
task18RecursionBrute :: Int -> Int -> Int
task18RecursionBrute x y =
    (task18Triangle !! x !! y)
        + ( if x + 1 < length task18Triangle
                then max (task18RecursionBrute (x + 1) y) (task18RecursionBrute (x + 1) (y + 1))
                else 0
          )
```
Прямой рекурсивный перебор


[Файл с решением](/src/Task18.hs)

### 2. С хвостовой рекурсией
```haskell
task18RecursionTailBrute :: Int
task18RecursionTailBrute = go 0 0 0
  where
    go i j acc
        | i >= length task18Triangle = acc
        | j < length (task18Triangle !! i) =
            let currVal = task18Triangle !! i !! j
                l = go (i + 1) j (acc + currVal)
                r = go (i + 1) (j + 1) (acc + currVal)
             in max l r
        | otherwise = acc
```
Оптимизированный рекурсивный перебор


[Файл с решением](/src/Task18.hs)

### 3. С мемоизацей (и бесконечным списком)
```haskell
task18MemoizationInfiniteLists :: Int -> Int -> Int
task18MemoizationInfiniteLists x y =
    (task18Triangle !! x !! y)
        + ( if x + 1 < length task18Triangle
                then max ([[task18MemoizationInfiniteLists xx yy | yy <- [0 ..]] | xx <- [0 ..]] !! (x + 1) !! y) ([[task18MemoizationInfiniteLists xx yy | yy <- [0 ..]] | xx <- [0 ..]] !! (x + 1) !! (y + 1))
                else 0
          )
```
Использование бесконечных списков для кэширования результатов


[Файл с решением](/src/Task18.hs)
## Тестирвоание

[Тесты для задания 13](test/Task18Spec.hs)


[Тесты для задания 18](test/Task18Spec.hs)

## Заключение
В ходе выполнения задач были продемонстрированы различные подходы к решению на языке Haskell. Использовались такие функциональные концепции как рекурсия, хвостовая рекурсия, работа с бесконечными списками, мемоизация и др. Это позволило наглядно показать выразительность и мощь функционального программирования на примере Haskell.

Все решения прошли тестирование, что подтверждает их корректность
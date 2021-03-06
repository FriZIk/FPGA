# Реализация скоростных криптографических систем на ПЛИС

## Техническое задание
1. Создать функционирующую быстродействующую криптографическую систему, реализующую алгоритм шифрования и дешифровки сообщений с открытым ключом.
2. Требования к техническим характерискам: система, реализующая шифрование на основе ГОСТ или PGP- на выбор разработчика. На этом этапе длина ключа не принципиальна.
3. Реализовать алгоритм блочного шифрования ```Кузнечик``` средствами ПЛИС на языке описания аппаратуры ```VHDL```.
4. Разработать корпус для устройства и создать минимальный работоспособный продукт.


## Что за проблему призван решать проект?
Наш проект решает проблему низкой скорости шифрования трафика. Аппаратное выполнение задачи позволяет распараллеливать процессы, выполнять несколько циклов и итераций алгоритма одновременно, что позволяет достичь в разы большей скорости вычислений.

## Потенциальные клиенты
1. Потенциальная сфера применения - банки и государственные учреждения, где скорость обработки конфиденциальной информации играет ключевую роль, а её объём очень велик. 
2. Устройство подходит и для личного пользования, но в ходе разработки проекта мы не учитывали данную перспективу, так как отследить круг заинтересованных лиц представляется невозможным.

## Технология решения проблемы
Проект будет реализован с использованием ПЛИС на основе семейства ```Artix A7```, обеспечивающих достаточно ресурсов для разработки при низкой потребляемой мощности и удовлетворительном быстродействии для поставленной задачи.  Аппаратная реализация криптоалгоритмов позволяет во много раз быстрее, по сравнению с программными аналогами, проводить расчёты и распараллеливать многочисленные однотипные задачи, что так же увеличивает скорость вычислений. 

## Вид устройства на финише
Конечный продукт представляет собой миниатюрное устройство в пластиковом корпусе с необходимыми для управления индикаторами и портами ввода вывода. Дизайн будет добратываться в будущем, на данный момент команда работает над дизайном и эргономикой конечного изделия.

## Что сделанно на данный момент
1. Усепшно реализован алгоритм ```ГОСТ 34.12-2015 "Кузнечик"```.
2. Реализованный в рамках проекта алгоритм шифрования работает по “упрощенной схеме”. Для прототипа размер блока был сокращён со ```128 до 16 бит```, размер ключа так же уменьшен с ```256 до 32 бит```. Количество раундов урезано до ```5```. На функциональность устройства это не повлияло.
3. Создали первоначальный прототип корпуса устройства. Корпус был смоделирован в ```САПР Autodesk Fusion 360``` и напечатан на 3d принтере. Точные габариты составляют 11.2 x 9.2 x 2.6
4. Провели симуляционные тесты и убиделись в работоспособности описанного алгоритма.
5. Разработали архитетуру утсройства на базе 32-битного софт-процессора ```Microblaze```.

## Результат работы
Функционирующая быстродействующая криптографическая система на основе ```ПЛИС(FPGA)```, реализующая алгоритм шифрования и дешифровки сообщений.

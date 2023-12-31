﻿#language: ru

@tree
@ExportScenarios
@IgnoreOnCIMainBuild

Функционал: Создание документа продажи товара с НДС 10 и 20 %

Как тестировщик я хочу
создать документ продажи товара
чтобы использовать его дальше при прроверках учета НДС 

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Я создаю документ продажи товара с НДС 10 и 20 %
	И я закрываю все окна клиентского приложения
 * загрузка тестовых данных (документ ПТУ с НДС 10 и 20)
	И Я создаю поступление товара с НДС 10 и 20%
* провожу загруженный документ
	И В командном интерфейсе я выбираю 'Покупки' 'Поступление (акты, накладные, УПД)'
	И в таблице "Список" я перехожу к строке с переключением выделения:
		| 'Номер'      |
		| '$НомерПТУ$' |
	И я нажимаю на кнопку с именем 'ФормаПровести'
* открытие формы создания документа продажи
	И В командном интерфейсе я выбираю 'Продажи' 'Реализация (акты, накладные, УПД)'
	И я нажимаю на кнопку с именем 'ФормаСоздатьРеализацияТовары'
* создание шапки документа
	И в поле с именем 'Дата' я ввожу текст '26.10.2023  0:00:00'
	И я нажимаю кнопку выбора у поля с именем "Контрагент"
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я перехожу к строке:
		| 'Наименование в программе' |
		| 'Кафе Сказка'              |
	И в таблице "Список" я выбираю текущую строку
	И из выпадающего списка с именем "Организация" я выбираю точное значение '$ТестОрганизация$'
	И я нажимаю кнопку выбора у поля с именем "Склад"
	И в таблице "Список" я перехожу к строке
		| 'Наименование'   |
		| 'Основной склад' |
	И в таблице "Список" я выбираю текущую строку
	И из выпадающего списка с именем "ДоговорКонтрагента" я выбираю точное значение 'Без договора'
*заполнение табличной части
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыНоменклатура"
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И я нажимаю на кнопку с именем 'ФормаНайти'
	И в поле с именем 'Pattern' я ввожу текст '$ТоварНДС20$'
	И я нажимаю на кнопку с именем 'Find'
	И в таблице "Список" я выбираю текущую строку
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '2,000'
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыНоменклатура"
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И я нажимаю на кнопку с именем 'ФормаНайти'
	И в поле с именем 'Pattern' я ввожу текст '$ТоварНДС10$'
	И я нажимаю на кнопку с именем 'Find'
	И в таблице "Список" я выбираю текущую строку
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '1,000'
	И в таблице "Товары" я завершаю редактирование строки
	И я нажимаю на кнопку с именем 'ВыписатьСчетФактуру'
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
* я запоминаю используемые элементы в переменные
	И я запоминаю значение поля с именем 'Номер' как 'НомерРТУ'
	И я запоминаю значение поля с именем 'Дата' как 'ДатаРТУ'
	И я выполняю код встроенного языка
	"""bsl
		Контекст["ДатаРТУ"] = Формат(НачалоДня(Контекст["ДатаРТУ"]),"ДФ=dd.MM.yyyy");
	"""
* проверка заполнения полей шапки документа
	И реквизиты формы имеют значение:
		| 'ДоговорКонтрагента' | '12 от 01.01.2021'         |
		| 'ИтогиВсего'         | '300,00'                      |
		| 'ИтогиВсегоНДС'      | '34,85'                    |
		| 'Контрагент'         | 'Кафе Сказка'              |
		| 'Организация'        | '$ТестОрганизация$' |
		| 'Склад'              | 'Основной склад'           |
		| 'ЦеныИВалюта'        | 'НДС в сумме'              |
* проверка заполнения табличной части
	Тогда таблица "Товары" стала равной:
		| 'Номенклатура' | 'Количество' | 'Единица' | 'Цена'   | 'Сумма'  | 'НДС'   | '% НДС' | 'Всего'  |
		| '$ТоварНДС20$' | '2,000'      | 'шт'      | '50,00'  | '100,00' | '16,67' | '20%'   | '100,00' |
		| '$ТоварНДС10$' | '1,000'      | 'шт'      | '200,00' | '200,00' | '18,18' | '10%'   | '200,00' |
	И элемент формы с именем 'ИтогиВсего' стал равен '300,00'
	И элемент формы с именем 'ИтогиВсегоНДС' стал равен '34,85'
*запись и проведение документа
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна 'Реализация товаров: Накладная, УПД * от * *' в течение 20 секунд
* проверка создания документа
	И в таблице "Список" я перехожу к строке с переключением выделения:
		| 'Номер'      | 'Дата'      |
		| '$НомерРТУ$' | '$ДатаРТУ$' |
	
			

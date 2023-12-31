﻿#language: ru

@tree
@ExportScenarios
@IgnoreOnCIMainBuild

Функционал: Создание поступления товара с НДС 10% и 20 %

Как тестировщик я хочу
создать поступление товара с НДС 10 и 20%
чтобы использовать его дальше при прроверках учета НДС 

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Я создаю поступление товара с НДС 10 и 20%
	И я закрываю все окна клиентского приложения 
* загрузка тестовых данных (новая организация с приминением НДС, товар НДС10 и товар НДС20)
	Когда Я создаю ИП (индивидуальный предприниматель тестовый) с приминением общей системы налогообложения (в т.ч. с НДС)
	И Я создаю новый элемент справочника номенклатура Тест Шоколад с НДС 10 %
	И Я создаю новый элемент справочника номенклатура Тест конфета с НДС 20 %
* заполнение шапки документа
	И В командном интерфейсе я выбираю 'Покупки' 'Поступление (акты, накладные, УПД)'
	И я нажимаю на кнопку с именем 'СоздатьПоступлениеТовары'
	И в поле с именем 'НомерВходящегоДокумента' я ввожу текст '10'
	И в поле с именем 'ДатаВходящегоДокумента' я ввожу текст '25.10.2023'
	И я нажимаю кнопку выбора у поля с именем "Контрагент"
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я перехожу к строке:
		| 'Наименование в программе' |
		| 'База "Продукты" '         |
	И в таблице "Список" я выбираю текущую строку
	И я устанавливаю флаг с именем 'УПД'
	И из выпадающего списка с именем "Организация" я выбираю точное значение '$ТестОрганизация$'
	И я нажимаю кнопку выбора у поля с именем "Склад"
	И в таблице "Список" я перехожу к строке:
		| 'Наименование'   |
		| 'Основной склад' |
	И в таблице "Список" я выбираю текущую строку
	И из выпадающего списка с именем "ДоговорКонтрагента" я выбираю точное значение 'Без договора'
	И я устанавливаю флаг с именем 'ОригиналПолучен'
	И я устанавливаю флаг 'СФ получен'
* проверка заполнения шапки документа
	И реквизиты формы имеют значение:
		| 'ВалютаДокументаИтогиВсего' | 'руб.'               |
		| 'Контрагент'                | 'База \"Продукты\" ' |
		| 'Организация'               | '$ТестОрганизация$'  |
		| 'ОригиналПолучен'           | 'Да'                 |
		| 'Склад'                     | 'Основной склад'     |
		| 'ЦеныИВалюта'               | 'НДС сверху'         |
* заполнение табличной части
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыНоменклатура"
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я перехожу к строке:
		| 'Наименование' |
		| '$ТоварНДС20$' |
	И в таблице "Список" я выбираю текущую строку
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '10,000'
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '100,00'
	И в таблице "Товары" я завершаю редактирование строки
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыНоменклатура"
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я перехожу к строке:
		| 'Наименование' |
		| '$ТоварНДС10$' |
	И в таблице "Список" я выбираю текущую строку
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '5,000'
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '200,00'
	И в таблице "Товары" я завершаю редактирование строки
	И в поле с именем 'НомерСчетаФактурыПолученного' я ввожу текст '1020'
	И в поле с именем 'ДатаСчетаФактурыПолученного' я ввожу текст '25.10.2023'
	И я нажимаю на кнопку с именем 'ЗарегистрироватьСчетФактуру'
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
* я запоминаю используемые элементы в переменные
	И я запоминаю значение поля с именем 'Номер' как 'НомерПТУ'
	И я запоминаю значение поля с именем 'Дата' как 'ДатаПТУ'
	И я выполняю код встроенного языка
	"""bsl
		Контекст["ДатаПТУ"] = Формат(НачалоДня(Контекст["ДатаПТУ"]),"ДФ=dd.MM.yyyy");
	"""
* проверка заполнения табличной части
	Тогда таблица "Товары" стала равной:
		| 'Количество' | 'Единица' | 'Цена'   | '% НДС' | 'Сумма'    | 'НДС'    | 'Всего'    | 'Номенклатура' |
		| '10,000'     | 'шт'      | '100,00' | '20%'   | '1 000,00' | '200,00' | '1 200,00' | '$ТоварНДС20$' |
		| '5,000'      | 'шт'      | '200,00' | '10%'   | '1 000,00' | '100,00' | '1 100,00' | '$ТоварНДС10$' |
	И реквизиты формы имеют значение:
		| 'ИтогиВсего'    | '2 300,00' |
		| 'ИтогиВсегоНДС' | '300,00'   |
* запись и проведение документа
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна 'Поступление товаров: Накладная, УПД * от *' в течение 20 секунд	
* проверка создания документа
	И в таблице "Список" я перехожу к строке с переключением выделения:
		| 'Номер'      | 'Дата'      |
		| '$НомерПТУ$' | '$ДатаПТУ$' |
	
	
			
	
		

﻿#language: ru

@tree
@ExportScenarios
@IgnoreOnCIMainBuild

Функционал: 03 создание НСИ [ТекИмя] с НДС 20

Как тестировщик я хочу
в справочнике Номенклатура создать новый элемент с НДС 20
чтобы использовать этот элемент при дальнейших проверках  

Контекст:
	Дано я запускаю сценарий открытия TestClient или подключаю уже существующий
	
Сценарий: я создаю новый элемент Номенклатуры "ТекИмя", СтавкаНДС - "ТекСтавкаНДС"
//при вводе нового товара меняемые значения Имя и Ставка НДС
	И я закрываю все окна клиентского приложения
* Удаление дублирующего элемента
	И в командном интерфейсе я выбираю 'НСИ и администрирование' 'Номенклатура'
	Когда открылось окно 'Номенклатура'
	Если флаг 'ИспользоватьФильтры' равен 'Да' Тогда
		И я снимаю флаг с именем 'ИспользоватьФильтры'	
	Если в таблице "СписокРасширенныйПоискНоменклатура" есть строки Тогда
		| 'Наименование' |
		| '[ТекИмя]' |
		И в таблице "СписокРасширенныйПоискНоменклатура" я перехожу к строке:
			| 'Наименование' |
			| '[ТекИмя]' |
		И в таблице "СписокРасширенныйПоискНоменклатура" я выбираю текущую строку
		И я перехожу к закладке с именем "СтраницаРеквизитыНоменклатуры"	
		Если появилось предупреждение в течение 10 секунд тогда
			И я нажимаю на кнопку "Спасибо за совет"
		И в поле с именем 'Наименование' я ввожу текст 'удалить'
		И в поле с именем 'Артикул' я ввожу текст '003'
		И я нажимаю на кнопку с именем 'ФормаЗаписать'
		И Я закрываю окно 'удалить (Номенклатура)'
* Создание нового элемента в справочнике Номенклатура 
	И в командном интерфейсе я выбираю 'НСИ и администрирование' 'Номенклатура'
	И я нажимаю на кнопку с именем 'СписокРасширенныйПоискНоменклатураСоздать'
	И я нажимаю кнопку выбора у поля с именем "ВидНоменклатурыОбязательныеПоля"
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я перехожу к строке:
		| 'Наименование'      |
		| 'Изделия из дерева' |
	И я нажимаю на кнопку с именем 'ФормаВыбрать'
	И в поле с именем 'Наименование' я ввожу текст '[ТекИмя]'
	И я нажимаю кнопку выбора у поля с именем "СтранаПроисхождения"
	И в таблице "Список" я перехожу к строке:
		| 'Наименование' |
		| 'РОССИЯ'       |
	И я нажимаю на кнопку с именем 'СписокВыбрать'
	И я нажимаю кнопку выбора у поля с именем "ЕдиницаИзмерения"
	И в таблице "Список" я перехожу к строке:
		| 'Наименование' |
		| 'шт'           |
	И я нажимаю на кнопку с именем 'ФормаВыбрать'
	И из выпадающего списка с именем "СтавкаНДС" я выбираю точное значение '[ТекСтавкаНДС]'
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
* Проверка заполнения полей элемента
	И элемент формы с именем 'Наименование' стал равен '[ТекИмя]'
	И элемент формы с именем 'НаименованиеПолное' стал равен '[ТекИмя]'
	И элемент формы с именем 'ВидНоменклатуры' стал равен 'Изделия из дерева'
	Тогда элемент формы с именем "СтавкаНДС" стал равен '[ТекСтавкаНДС]'
	Тогда элемент формы с именем "ЕдиницаИзмерения" стал равен 'шт'
	Тогда элемент формы с именем "СтранаПроисхождения" стал равен 'РОССИЯ'
* Запись нового элемента [ТекИмя]
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
	И я закрываю окно '[ТекИмя] (Номенклатура)'
* запоминаю в переменную
	И в таблице 'СписокРасширенныйПоискНоменклатура' я перехожу к строке
		|'Наименование'|
		|'[ТекИмя]'|
	И я запоминаю значение поля с именем 'СписокРасширенныйПоискНоменклатураНаименование' таблицы 'СписокРасширенныйПоискНоменклатура' как '[ТекИмя]'

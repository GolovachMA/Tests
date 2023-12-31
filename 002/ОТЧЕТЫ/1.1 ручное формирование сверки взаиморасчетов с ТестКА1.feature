﻿#language: ru

@tree

Функционал: ручное формирование (через кнопку Создать) сверки взаиморасчетов с ТестКА1, организация Тест ООО

Как тестировщик я хочу
сформировать ручками сверку взаиморасчетов с ТестКА1, организация Тест ООО
чтобы проверить, что поступление, возврат по ПТУ и аванс учитываются правильно

Контекст:
	Дано я запускаю сценарий открытия TestClient или подключаю уже существующий
	И я закрываю все окна клиентского приложения

Сценарий: я формирую (ручками через кнопку Создать) сверку взаиморасчетов с ТестКА1, организация Тест ООО
* загружаю тестовые данные
	Когда я создаю и провожу возврат по тестовому документу ПТУ, организация - ТестООО, контрагент-ТестКА1
* формирую сверку взаиморасчетов между ТестООО и ТестКонтрагент1
	И я закрываю все окна клиентского приложения
	И в командном интерфейсе я выбираю 'Казначейство' 'Сверки взаиморасчетов'
	И в таблице "Список" я нажимаю на кнопку с именем 'СписокСоздатьПоПараметруСверкаВзаиморасчетов2_5_11'
	И в поле с именем 'НачалоПериода' я ввожу текст '01.01.2023'
	И я перехожу к закладке с именем "СтраницаОсновное"
	И из выпадающего списка с именем "Организация" я выбираю точное значение '$ТестООО$'
	И я нажимаю кнопку выбора у поля с именем "Контрагент"
	Тогда открылось окно 'Выбор типа данных'
	И в таблице "" я перехожу к строке
		|''|
		|'Контрагент'|
	И в таблице "" я выбираю текущую строку
	И в таблице "Список" я перехожу к строке:
		| 'Наименование'    |
		| '$ТестКА1$' |
	И в таблице "Список" я выбираю текущую строку
	И я нажимаю на кнопку с именем 'ФормаЗаполнить'
* проверка заполнения шапки документа
	Тогда элемент формы с именем "Организация" стал равен '$ТестООО$'
	Тогда элемент формы с именем "Контрагент" стал равен '$ТестКА1$'
	Тогда элемент формы с именем "Валюта" стал равен 'RUB'					
* проверка заполнения вкладки взаиморасчеты
	И я перехожу к закладке с именем "СтраницаРасчеты"
	И я меняю значение переключателя с именем 'ПоказатьИтоговыеЗаписи' на 'Детальные записи'
	И из выпадающего списка с именем "ОтборРасчеты" я выбираю точное значение '<Отбор не установлен>'
	Тогда таблица "ДетальныеЗаписи" содержит строки по шаблону
		| 'N' | 'Сумма документа' | 'Сумма дебет' | 'Сумма долга' | 'Сумма аванса' | 'Наименование документа' | 'Сумма кредит' |
		| '1' | '1 080,00'        | ''            | '1 080,00'    | ''             | 'Закупка'                | '1 080,00'     |
		| '2' | '300,00'          | '300,00'      | '-300,00'     | ''             | 'Платежное поручение'    | ''             |
		| '3' | '324,00'          | '324,00'      | ''            | '324,00'       | 'Возврат товаров'        | ''             |
* записываю и провожу сверку
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
	И я нажимаю на кнопку с именем 'ФормаПровести'
	И я перехожу к закладке с именем "СтраницаОсновное"
	И я запоминаю значение поля с именем 'Номер' как 'НомерСверки'
* открываю печатную форму акта сверки
	И я нажимаю на кнопку с именем 'ПодменюПечатьОбычное_АктСверкиВзаимныхРасчетов'
	И я нажимаю на кнопку с именем 'Сохранить'
* проверяю печатную форму акта сверки с эталоном
	Дано табличный документ 'ТекущаяПечатнаяФорма' равен макету "Акт сверки взаиморасчетов между ТестООО и ТестКА1" по шаблону
	И я закрываю окно 'Сверка взаиморасчетов (2.5.11) *от *'
* проверка создания сверки взаиморасчетов
	И в командном интерфейсе я выбираю 'Казначейство' 'Сверки взаиморасчетов'
	И в таблице "Список" я перехожу к строке:
		| 'Контрагент'        | 'Номер'         | 'Организация' |
		| '$ТестКА1$' | '$НомерСверки$' | '$ТестООО$'   |
		
		

			


















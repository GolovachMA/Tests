﻿#language: ru

@tree
@ExportScenarios
@IgnoreOnCIMainBuild

Функционал: Формирование книги ПРОДАЖ с НДС 10 и 20 для ТестИП

Как тестировщик я хочу
сформировать книгу продаж для ТестИП
чтобы использовать в дальнейшем в проверке отчетов по НДС


Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Я формирую для ТестИП книгу продаж с НДС 10 и 20
* я загружаю документ продажи для формирования книги продажи и провожу документ
	Когда Я загружаю тестовые данные для ТестИП - документ продажи Тест конфета НДС20 и Тест шоколад НДС 10
	И В командном интерфейсе я выбираю 'Продажи' 'Реализация (акты, накладные, УПД)'
	И в таблице "Список" я перехожу к строке:
		| 'Номер'       | 'Контрагент'  |
		| '0000-000011' | 'Суприм-Кунцево' |
	И я нажимаю на кнопку с именем 'ФормаПровести'
	И я закрываю все окна клиентского приложения
* формирование книги Продаж
	И В командном интерфейсе я выбираю 'Отчеты' 'Книга продаж'
	И я нажимаю на кнопку с именем 'ВыбратьПериод'
	И я нажимаю на кнопку с именем 'ВыбратьКвартал4'
	И из выпадающего списка с именем "ПолеОрганизация" я выбираю точное значение 'Тест И. П. ИП'
	И я нажимаю на кнопку с именем 'Сформировать'
	И я жду когда в табличном документе 'Результат' заполнится ячейка 'R18C18' в течение 20 секунд
* проверка сформированной книги продаж
	Дано Табличный документ 'Результат' равен макету "ТестИПКнигаПродажБазовыеНастройки" по шаблону
﻿#language: ru

@tree
@ExportScenarios
@IgnoreOnCIMainBuild

Функционал: создание и проведение аванса в размере 30% от суммы документа ПТУ 1080

Как тестировщикя хочу
создать и провести аванс 30 % от суммы документа ПТУ 1080
чтобы использовать в дальнейшикх проверках взаиморасчетах с контрагентами 

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
	И я закрываю все окна клиентского приложения
	
Сценарий: я создаю документ безналичные платежи (аванс 30% от суммы)
* созданию платеж (аванс) контрагенту ТестКА1 от организации Тест ООО
	И в командном интерфейсе я выбираю 'Казначейство' 'Безналичные платежи'
	И в таблице "СписокПлатежей" я нажимаю на кнопку с именем 'СоздатьСписаниеОплатаПоставщику'
	И в поле с именем 'Дата' я ввожу текст '01.03.2023'
	И я устанавливаю флаг с именем 'ПроведеноБанком'
	И я нажимаю кнопку выбора у поля с именем "БанковскийСчет"
	И в таблице "Список" я перехожу к строке:
		| 'Наименование'                 | 'Наименование банка' | 'Организация' |
		| 'ПАО СБЕРБАНК, Тест ООО (RUB)' | 'ПАО СБЕРБАНК'       | 'Тест ООО'    |
	И в таблице "Список" я активизирую поле с именем "НаименованиеБанка"
	И в таблице "Список" я выбираю текущую строку
	И я нажимаю кнопку выбора у поля с именем "Контрагент"
	И в таблице "Список" я перехожу к строке:
		| 'Наименование'    |
		| 'ТестКА1' |
	И в таблице "Список" я выбираю текущую строку
	И в поле с именем 'СуммаДокумента' я ввожу текст '300,00'
	И я нажимаю на кнопку с именем 'ЗаполнитьНазначениеПлатежа'
* проверка заполнения полей вкладки Основное
	Тогда элемент формы с именем "Дата" стал равен по шаблону '01.03.2023 *'
	Тогда элемент формы с именем "Контрагент" стал равен 'ТестКА1'
	Тогда элемент формы с именем "СуммаДокумента" стал равен '300,00'
	Тогда элемент формы с именем "ХозяйственнаяОперация" стал равен 'Оплата поставщику'
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
	И я запоминаю значение поля с именем 'Номер' как 'НомерАванса'
* заполнение вкладки Расшифровка платежа
	И я перехожу к закладке с именем "СтраницаРасшифровка"
	И я нажимаю кнопку выбора у поля с именем "Договор"
	И в таблице "Список" я перехожу к строке
		| 'Номер' | 'Рабочее наименование' | 'Статус'    |
		| '001'   | 'Закупка'              | 'Действует' |
	И в таблице "Список" я выбираю текущую строку
	И я нажимаю кнопку выбора у поля с именем "РасшифровкаБезРазбиенияСтатьяДвиженияДенежныхСредств"
	И я меняю значение переключателя с именем 'РежимВыбора' на 'Все статьи'
	И я перехожу к закладке с именем "СтраницаВсе"
	И в таблице "СписокВсе" я активизирую поле с именем "СписокВсеНаименование"
	И в таблице "СписокВсе" я нажимаю на кнопку с именем 'СписокВсеСписок'
	И в таблице "СписокВсе" я перехожу к строке:
		| 'Статья ДДС'                                        |
		| 'Оплата аванса поставщику (товары, работы, услуги)' |
	И в таблице "СписокВсе" я нажимаю на кнопку с именем 'СписокВсеВыбрать'
	И я нажимаю кнопку выбора у поля с именем "ГруппаФинансовогоУчета"
	И я нажимаю на кнопку с именем 'ФормаСписок'		
	И в таблице "Список" я перехожу к строке:
		| 'Наименование'           |
		| 'Расчеты с поставщиками' |
	И в таблице "Список" я выбираю текущую строку
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
* проверка заполнения вкладки Расшифровка платежа
	Тогда элемент формы с именем "Договор" стал равен 'Закупка'
	Тогда элемент формы с именем "РасшифровкаБезРазбиенияПартнер" стал равен 'ТестКА1'
	Тогда элемент формы с именем "РасшифровкаБезРазбиенияСуммаВзаиморасчетов" стал равен '300,00'
	Тогда элемент формы с именем "РасшифровкаБезРазбиенияСтавкаНДС" стал равен '20%'
	Тогда элемент формы с именем "РасшифровкаБезРазбиенияСтатьяДвиженияДенежныхСредств" стал равен 'Оплата аванса поставщику (товары, работы, услуги)'
	Тогда элемент формы с именем "ГруппаФинансовогоУчета" стал равен 'Расчеты с поставщиками'
* провожу и закрываю документ
	И я нажимаю на кнопку с именем 'ФормаПровести'
	И Я закрываю окно 'Списание безналичных ДС * от *'
	Если появилось предупреждение, тогда
		И я нажимаю на кнопку "ДА"
	И в поле с именем 'НачалоПериода' я ввожу текст '01.02.2023'
	И я перехожу к следующему реквизиту
* проверка создания платежа и проведение
	И в таблице 'СписокПлатежей' я перехожу к строке
		| 'Номер'         | 'Списание' | 'Организация' | 'Контрагент'        |
		| '$НомерАванса$' | '300,00'   | 'Тест ООО'   | 'ТестКА1' |
	И в таблице "СписокПлатежей" я нажимаю на кнопку с именем 'СписокПлатежейПровести'
* проверка движения документа 
	И в таблице "СписокПлатежей" я выбираю текущую строку
	* по регистру Расчеты с поставщиками по срокам
		И я нажимаю на кнопку с именем 'ПодменюОтчетыСмТакже_Авто_3E08091877A5277BEC2619EF47395CBB'
		И пауза 10
//		чтобы сформировался отчет
		Когда открылось окно 'Движения документа (Горизонтально)'
		И я нажимаю кнопку выбора у поля с именем "КомпоновщикНастроекПользовательскиеНастройкиЭлемент3Значение"
		Тогда открылось окно 'Выводить только'		
		И я нажимаю на кнопку с именем 'СписокСнятьФлажки'
		И в таблице "Список" я перехожу к строке:
			| 'Значение'                                                   |
			| 'Регистр накопления Движения Денежные средства - Контрагент' |
		Когда открылось окно 'Выводить только'
		И в таблице "Список" я устанавливаю флаг с именем 'СписокПометка'
		И в таблице "Список" я завершаю редактирование строки
		И я нажимаю на кнопку с именем 'КомандаОК'
		Тогда открылось окно 'Движения документа (Горизонтально)'		
		И я нажимаю на кнопку с именем 'СформироватьОтчет'
		И я жду когда в табличном документе 'ОтчетТабличныйДокумент' заполнится ячейка 'R7C4' в течение 20 секунд
		И пауза 5
//		для прогрузки отчета
		Дано Табличный документ 'ОтчетТабличныйДокумент' равен макету "проверка документа аванс Движения Денежные средства-Контрагент" по шаблону
* закрываю документ
	И Я закрываю окно 'Движения документа (Горизонтально)'
	И Я закрываю окно 'Списание безналичных ДС * от *'

﻿#language: ru

@tree
@ExportScenarios
@IgnoreOnCIMainBuild

Функционал: Создание новой тестовой организации с общим режимом налогообложения

Как тестировщик я хочу
создать новую тестовую организацию
чтобы использовать в дальнейшем при проверках отчетов НДС

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Я создаю новую  организацию с приминением общей системы налогообложения (в т.ч. с НДС)
	И я закрываю все окна клиентского приложения
* удаление элемента
	И В командном интерфейсе я выбираю 'Главное' 'Организации'
	Если в таблице "Список" есть строка Тогда
			| 'Наименование в программе' |
			| 'Тестовая Организация ООО' |
		И в таблице 'Список' я перехожу к строке
			|'Наименование в программе'|
			|'Тестовая Организация ООО'|
		И в таблице "Список" я выбираю текущую строку
		Когда открылось окно 'Тестовая Организация ООО (Организация)'
		И в поле с именем 'НаименованиеСокращенное' я ввожу текст 'удалить'
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна 'Тестовая Организация ООО (Организация)' в течение 20 секунд
* создание новой организации
	И В командном интерфейсе я выбираю 'Главное' 'Организации'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	И я нажимаю на кнопку с именем 'ВыбратьЮЛ'
	И я нажимаю на кнопку с именем 'СистемаНалогообложенияОбщаяЮЛ'
	И в поле с именем 'НаименованиеСокращенное' я ввожу текст 'ООО \"Тестовая Организация\"'
	И в поле с именем 'ИНН' я ввожу текст '8045542858'
	И в поле с именем 'ОГРН' я ввожу текст '3060437942342'
	И в поле с именем 'ДатаРегистрации' я ввожу текст '01.12.2015'
	И в поле с именем "НаименованиеРегистрирующегоОргана" я ввожу текст "Межрайонная ИФНС России № 99 по г.Москве"
	И я нажимаю кнопку выбора у поля с именем "Банк"
	И в таблице "Список" я перехожу к строке:
		| 'БИК'       |
		| '044525225' |
	И в таблице "Список" я выбираю текущую строку
	И в поле с именем 'НомерСчета' я ввожу текст '40702810000000000007'
	И я разворачиваю группу с именем "ГруппаКонтактнаяИнформация"
	И я нажимаю на гиперссылку с именем "КонтактнаяИнформацияПолеЮрАдресОрганизации"
	И из выпадающего списка с именем "НаселенныйПункт" я выбираю по строке 'Москва'
	И из выпадающего списка с именем "Улица" я выбираю по строке '1812'
	И в поле с именем 'Дом' я ввожу текст '1'
	И я нажимаю на кнопку с именем 'ФормаКомандаОК'
	И я закрываю окно предупреждения
	И в поле с именем 'КонтактнаяИнформацияПолеТелефонОрганизации' я ввожу текст '555555'
	И я разворачиваю группу с именем "ГруппаПодписи"
	И я нажимаю кнопку выбора у поля с именем "Руководитель"
	И в таблице "Список" я перехожу к строке:
		| 'ФИО'                      |
		| 'Абрамов Геннадий Сергеевич' |
	И в таблице "Список" я выбираю текущую строку
	И я нажимаю кнопку выбора у поля с именем "ГлавныйБухгалтер"
	И в таблице "Список" я перехожу к строке:
		| 'ФИО'                      |
		| 'Белкина Анна Григорьевна' |
	И в таблице "Список" я выбираю текущую строку
	И я нажимаю кнопку выбора у поля с именем "Кассир"
	Тогда открылось окно 'Физические лица'
	И в таблице "Список" я перехожу к строке:
		| 'ФИО'                           |
		| 'Лифанова Светлана Григорьевна' |
	И в таблице "Список" я выбираю текущую строку
	И я разворачиваю группу с именем "ГруппаНалоговыйОрган"
	И в поле с именем 'КодНалоговогоОргана' я ввожу текст '7730'
	И в поле с именем 'РегистрацияВНалоговомОрганеНаименование' я ввожу текст 'ИФНС России № 30 по г. Москве'
	И в поле с именем 'РегистрацияВНалоговомОрганеНаименованиеИФНС' я ввожу текст 'Инспекция Федеральной налоговой службы № 30 по г. Москве'
	И в поле с именем 'РегистрацияВНалоговомОрганеКодПоОКТМО' я ввожу текст '45318000'
	И в поле с именем 'РегистрацияВНалоговомОрганеКодПоОКАТО' я ввожу текст '45268554000'
	И я разворачиваю группу с именем "ГруппаПФР"
	И в поле с именем 'РегистрационныйНомерПФР' я ввожу текст '099-099-999999'
	И я перехожу к предыдущему реквизиту
	И элемент формы с именем 'КодОрганаПФР' стал равен '099-099'
	И в поле с именем 'НаименованиеТерриториальногоОрганаПФР' я ввожу текст 'УПФР № 3 по г. Москве '
	И я разворачиваю группу с именем "ГруппаФСС"
	И в поле с именем 'РегистрационныйНомерФСС' я ввожу текст '1234567898'
	И я перехожу к следующему реквизиту
	И в поле с именем 'НаименованиеТерриториальногоОрганаФСС' я ввожу текст 'ФСС г. Москва'
	И я разворачиваю группу с именем "ГруппаКоды"
	И в поле с именем 'КодОКВЭД' я ввожу текст '15.84.2'
	И в поле с именем 'КодОКВЭД2' я ввожу текст '10.82.2'
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
* проверка заполнения полей в новой организации
	И реквизиты формы имеют значение:
		| 'Имя'                                              | 'Значение'                                                                             |
		| 'Банк'                                             | '044525225 ПАО Сбербанк'                                                               |
		| 'ВидОрганизацииПредставление'                      | 'Юридическое лицо'                                                                     |
		| 'ГлавныйБухгалтер'                                 | 'Белкина Анна Григорьевна'                                                             |
		| 'ГлавныйБухгалтерДолжность'                        | 'Главный бухгалтер'                                                                    |
		| 'ГоловнаяОрганизация'                              | 'Тестовая Организация ООО'                                                             |
		| 'ДатаРегистрации'                                  | '01.12.2015'                                                                           |
		| 'ИНН'                                              | '8045542858  '                                                                           |
		| 'Кассир'                                           | 'Лифанова Светлана Григорьевна'                                                        |
		| 'КассирДолжность'                                  | 'Кассир'                                                                               |
		| 'КодНалоговогоОргана'                              | '7730'                                                                                 |
		| 'КодОКВЭД'                                         | '15.84.2'                                                                              |
		| 'КодОКВЭД2'                                        | '10.82.2'                                                                              |
		| 'КодОКОПФ'                                         | '12300'                                                                                |
		| 'КодОКФС'                                          | '16'                                                                                   |
		| 'КодОрганаПФР'                                     | '099-099'                                                                              |
		| 'КодПодчиненностиФСС'                              | '12341'                                                                                |
		| 'КодРегионаРегистрации'                            | '77'                                                                                   |
		| 'КонтактнаяИнформацияПолеПочтовыйАдресОрганизации' | '121293, Город Москва, вн.тер.г. муниципальный округ Дорогомилово, ул 1812 года, д. 1' |
		| 'КонтактнаяИнформацияПолеТелефонОрганизации'       | '555555'                                                                               |
		| 'КонтактнаяИнформацияПолеФактАдресОрганизации'     | '121293, Город Москва, вн.тер.г. муниципальный округ Дорогомилово, ул 1812 года, д. 1' |
		| 'КонтактнаяИнформацияПолеЮрАдресОрганизации'       | '121293, Город Москва, вн.тер.г. муниципальный округ Дорогомилово, ул 1812 года, д. 1' |
		| 'КПП'                                              | '804501001'                                                                            |
		| 'Наименование'                                     | 'Тестовая Организация ООО'                                                             |
		| 'НаименованиеОКВЭД'                                | 'Производство шоколада и сахаристых кондитерских изделий'                              |
		| 'НаименованиеОКВЭД2'                               | 'Производство шоколада и сахаристых кондитерских изделий'                              |
		| 'НаименованиеОКОПФ'                                | 'Общества с ограниченной ответственностью'                                             |
		| 'НаименованиеОКФС'                                 | 'Частная собственность'                                                                |
		| 'НаименованиеПолное'                               | 'Общество с ограниченной ответственностью \"Тестовая Организация\"'                    |
		| 'НаименованиеРегистрирующегоОргана'                | 'Межрайонная ИФНС России № 99 по г.Москве'                                             |
		| 'НаименованиеСокращенное'                          | 'ООО \"Тестовая Организация\"'                                                         |
		| 'НаименованиеТерриториальногоОрганаПФР'            | 'УПФР № 3 по г. Москве '                                                               |
		| 'НаименованиеТерриториальногоОрганаФСС'            | 'ФСС г. Москва'                                                                        |
		| 'НомерСчета'                                       | '40702810000000000007'                                                                 |
		| 'ОГРН'                                             | '3060437942342'                                                                        |
		| 'ОписаниеПредставителейПодписанияОтчетности'       | 'Руководитель'                                                                         |
		| 'ПочтовыйАдресОрганизацииСовпадает'                | '121293, Город Москва, вн.тер.г. муниципальный округ Дорогомилово, ул 1812 года, д. 1' |
		| 'РегистрационныйНомерПФР'                          | '099-099-999999'                                                                       |
		| 'РегистрационныйНомерФСС'                          | '1234567898'                                                                           |
		| 'РегистрацияВНалоговомОрганеКодПоОКАТО'            | '45268554000'                                                                          |
		| 'РегистрацияВНалоговомОрганеКодПоОКТМО'            | '45318000   '                                                                          |
		| 'РегистрацияВНалоговомОрганеНаименование'          | 'ИФНС России № 30 по г. Москве'                                                        |
		| 'РегистрацияВНалоговомОрганеНаименованиеИФНС'      | 'Инспекция Федеральной налоговой службы № 30 по г. Москве'                             |
		| 'Руководитель'                                     | 'Абрамов Геннадий Сергеевич'                                                           |
		| 'РуководительДолжность'                            | 'Генеральный директор'                                                                 |
		| 'СистемаНалогообложенияПредставление'              | 'Общая'                                                                                |
		| 'ФактАдресОрганизацииСовпадает'                    | '121293, Город Москва, вн.тер.г. муниципальный округ Дорогомилово, ул 1812 года, д. 1' |
		| 'ЮрФактАдресаСовпадают'                            | 'Да'                                                                                   |
* запись элемента новая организация
	И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
	И я жду закрытия окна 'Тестовая Организация ООО (Организация)' в течение 20 секунд
* проверка создания новой организации
	И в таблице 'Список' я перехожу к строке
		|'Наименование в программе'|
		|'Тестовая Организация ООО'|
* я запоминаю созданную тестовую  организацию в переменную 
	И я запоминаю значение поля с именем 'Наименование' таблицы 'Список' как 'ТестОрганизация'

		
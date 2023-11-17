﻿#language: ru

@tree
@ExportScenarios
@IgnoreOnCIMainBuild

Функционал: создание тестовой организации с общим режимом налогообложения

Как тестиировщик я хочу
создать новую тестовую организацию
чтобы использовать в дальнейшем при проверке операций

Контекст:
	Дано я запускаю сценарий открытия TestClient или подключаю уже существующий
	
Сценарий: я создаю новую организацию "ТекИмя"с приминением общей системы налогообложения (в т.ч. с НДС)
	И я закрываю все окна клиентского приложения
* удаление Элемента
	И в командном интерфейсе я выбираю 'НСИ и администрирование' 'Организации'
	Если в таблице "Список" есть строка Тогда
			| 'Наименование' |
			| '[ТекИмя] ООО'     |
		И в таблице 'Список' я перехожу к строке
			| 'Наименование' |
			| '[ТекИмя] ООО'     |
		И в таблице "Список" я выбираю текущую строку
		И в поле с именем 'НаименованиеСокращенное' я ввожу текст 'удалить'
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна '[ТекИмя] ООО' в течение 20 секунд
* создание новой организации - заполнение вкладки Общая информация
	И в командном интерфейсе я выбираю 'НСИ и администрирование' 'Организации'
	И я нажимаю на кнопку с именем 'ЮридическоеЛицо'
	И в поле с именем 'НаименованиеСокращенное' я ввожу текст 'ООО \"[ТекИмя]\"'
	И я нажимаю на кнопку с именем 'ФормаЗаписатьОбъект'
	И я нажимаю на кнопку с именем 'ГиперссылкаРегистрацияВНалоговыхОрганах'
	И в таблице "НалоговыеОрганы" я нажимаю на кнопку с именем 'НалоговыеОрганыДобавить'
	И в поле с именем 'КПП' я ввожу текст '771401001'	
	И в поле с именем 'ДатаПостановкиНаУчет' я ввожу текст '01.10.2022'
	И из выпадающего списка с именем "КодРегионаРегистрации" я выбираю по строке 'Москва'
	И я перехожу к следующему реквизиту
	И в поле с именем 'Наименование' я ввожу текст 'ИФНС России № 25 по г.Москве'
	И в поле с именем 'Код' я ввожу текст '7703'
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
	И я закрываю окно 'ФНС * КПП * (Регистрация в налоговом органе)'
	И в таблице "НалоговыеОрганы" я перехожу к строке:
		| 'Наименование'       |
		| 'ИФНС России № 25 по г.Москве' |
	И я нажимаю на кнопку с именем 'ОК'
	И в поле с именем 'ИНН' я ввожу текст '8490004729'
	И в поле с именем 'ОГРН' я ввожу текст '3060437942342'
	И в поле с именем 'КодОКВЭД' я ввожу текст '15.84.2'
	И в поле с именем 'КодОКВЭД2' я ввожу текст '10.82.2'
	И я нажимаю на кнопку с именем 'ФормаЗаписатьОбъект'
* проверка заполнения вкладки Общая информация для созданной ООО [ТекИмя]
	И элемент формы с именем 'ВидОрганизации' стал равен 'Юридическое лицо'
	И элемент формы с именем 'НаименованиеСокращенное' стал равен 'ООО "[ТекИмя]"'
	И элемент формы с именем 'НаименованиеПолное' стал равен 'Общество с ограниченной ответственностью "[ТекИмя]"'
	И элемент формы с именем 'Наименование' стал равен '[ТекИмя] ООО'
	И элемент формы с именем 'ИНН' стал равен '8490004729'
	И элемент формы с именем 'КПП' стал равен '771401001'
	И элемент формы с именем 'КодОКВЭД' стал равен '15.84.2'
	И элемент формы с именем 'КодОКВЭД2' стал равен '10.82.2'
	И элемент формы с именем 'ОГРН' стал равен '3060437942342'
* создание новой организации - заполнение вкладки учетной политики и налогов
	И я перехожу к закладке с именем "ГруппаУчетнаяПолитикаИДругиеНастройки"
	И у поля с именем "ОткрытьНастройкиСистемыНалогообложения" я нажимаю гиперссылку 'Изменить'
	И я нажимаю на кнопку с именем 'ФормаЗаписать' 
	И я меняю значение переключателя с именем 'СистемаНалогообложения' на 'Упрощенная'
	И я меняю значение переключателя с именем 'СистемаНалогообложения' на 'Общая'
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
	И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
	И я жду закрытия окна 'Настройки системы налогообложения [ТекИмя] ООО' в течение 20 секунд
* проверка заполнения Настройки системы налогооблажения
	И у поля с именем "ОткрытьНастройкиСистемыНалогообложения" я нажимаю гиперссылку 'Изменить'
	И реквизиты формы имеют значение:
		| 'Имя'                    | 'Значение'                                            |
		| 'ОписаниеИстории'        | 'действует по настоящее время. История изменений (1)' |
		| 'Организация'            | '[ТекИмя] ООО'                                        |
		| 'ПлательщикЕНП'          | 'Нет'                                                 |
		| 'ПрименяетсяАУСН'        | 'Нет'                                                 |
		| 'ПрименяетсяЕНВД'        | 'Нет'                                                 |
		| 'ПрименяетсяПСН'         | 'Нет'                                                 |
		| 'СистемаНалогообложения' | 'Общая'                                               |
		| 'УведомлениеДата'        | '01.01.0001 0:00:00'                                  |
	И я закрываю окно 'Настройки системы налогообложения [ТекИмя] ООО'
* заполнение УчетнаяПолитикаБухУчета		
	И у поля с именем "ОткрытьУчетнаяПолитикаБухУчета" я нажимаю гиперссылку 'Изменить'
	И я меняю значение переключателя с именем 'ВариантУчетаОтложенногоНалогаБалансовыйМетод' на 'Ведется балансовым методом'
	И я перехожу к закладке с именем "ГруппаЗапасы"
	И я изменяю флаг с именем 'ЗабалансовыйУчетТМЦВЭксплуатации'
	И я изменяю флаг с именем 'СборкаТоваровЧерезСчет20'
	И я перехожу к закладке с именем "ГруппаРасчеты"
	И я изменяю флаг с именем 'ВзаимозачетЧерезСчет76'
	И я перехожу к закладке с именем "ГруппаЗарплата"
	И я изменяю флаг с именем 'ПроводкиПоРаботникам'
	И я перехожу к закладке с именем "СтраницаВнеоборотныеАктивы"
	И я меняю значение переключателя с именем 'ЗаписьПорядокНачисленияАмортизацииНМАСоСледующегоМесяца' на 'С первого числа месяца, следующего за месяцем принятия к учету'
	И я меняю значение переключателя с именем 'ЗаписьПорядокНачисленияАмортизацииОССоСледующегоМесяца' на 'С первого числа месяца, следующего за месяцем принятия к учету'
	И я изменяю флаг с именем 'ЗаписьПрименяетсяФСБУ14'
	И я изменяю флаг с именем 'ЗаписьУчетНИОКРПоФСБУ26'
	И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
	И я жду закрытия окна 'Учетная политика бухгалтерского учета [ТекИмя] ООО *' в течение 20 секунд
* проверка заполнения УчетнаяПолитикаБухУчета
	И у поля с именем "ОткрытьУчетнаяПолитикаБухУчета" я нажимаю гиперссылку 'Изменить'
	И элемент формы с именем "ВариантУчетаОтложенногоНалогаБалансовыйМетод" стал равен 'Ведется балансовым методом'
	И элемент формы с именем "ВариантУчетаОтложенногоНалогаБалансовыйМетодРасширеннаяПодсказка" стал равен 'Простой и надежный способ учета, основанный на Рекомендации БМЦ \"Порядок учета налога на прибыль\".  Подробнее'
	И элемент формы с именем "ВариантУчетаОтложенногоНалогаБалансовыйМетодСУчетомРазниц" стал равен 'Ведется балансовым методом'
	И элемент формы с именем "ВариантУчетаОтложенногоНалогаБалансовыйМетодСУчетомРазницРасширеннаяПодсказка" стал равен 'Требует отражать в учете информацию о постоянных и временных разницах в стоимости активов и обязательств.  Подробнее'
	И элемент формы с именем "ВариантУчетаОтложенногоНалогаЗаголовок" стал равен 'Учет отложенных налоговых активов и обязательств (ПБУ 18 \"Учет расчетов по налогу на прибыль организации\"):'
	И элемент формы с именем "ВариантУчетаОтложенногоНалогаЗатратныйМетод" стал равен 'Ведется балансовым методом'
	И элемент формы с именем "ВариантУчетаОтложенногоНалогаЗатратныйМетодРасширеннаяПодсказка" стал равен 'Требует детально прослеживать движение постоянных и временных разниц в стоимости активов, обязательств, доходов и расходов.  Метод не следует использовать, когда результаты его применения будут существенно отличаться от балансового метода. Например, в организациях с обособленными подразделениями, прибыль которых облагается по различным ставкам налога.  Подробнее'
	И элемент формы с именем "ВариантУчетаОтложенногоНалогаНет" стал равен 'Ведется балансовым методом'
	И элемент формы с именем "ВзаимозачетЧерезСчет76" стал равен 'Да'
	И элемент формы с именем "ВидРазницПБУ18РезервовПоСомнительнымДолгам" стал равен 'Временные разницы'
	И элемент формы с именем "ВидРазницПБУ18РезервовПоСомнительнымДолгамОтступ" стал равен 'Вид разниц ПБУ18 резервов по сомнительным долгам отступ'
	И элемент формы с именем "ЗабалансовыйУчетТМЦВЭксплуатации" стал равен 'Да'
	И элемент формы с именем "ЗаписьПорядокНачисленияАмортизацииАрендаСДатыПринятияКУчету" стал равен 'С даты принятия к учету'
	И элемент формы с именем "ЗаписьПорядокНачисленияАмортизацииАрендаСоСледующегоМесяца" стал равен 'С даты принятия к учету'
	И элемент формы с именем "ЗаписьПорядокНачисленияАмортизацииНМАСДатыПринятияКУчету" стал равен 'Со следующего месяца'
	И элемент формы с именем "ЗаписьПорядокНачисленияАмортизацииНМАСоСледующегоМесяца" стал равен 'Со следующего месяца'
	И элемент формы с именем "ЗаписьПорядокНачисленияАмортизацииОССДатыПринятияКУчету" стал равен 'Со следующего месяца'
	И элемент формы с именем "ЗаписьПорядокНачисленияАмортизацииОССоСледующегоМесяца" стал равен 'Со следующего месяца'
	И элемент формы с именем "ЗаписьПрименяетсяФСБУ14" стал равен 'Нет'
	И элемент формы с именем "ЗаписьПрименяетсяФСБУ6" стал равен 'Да'
	И элемент формы с именем "ЗаписьСписатьСтоимостьТМЦВЭксплуатации" стал равен 'Нет'
	И элемент формы с именем "ЗаписьСписатьСтоимостьТМЦВЭксплуатацииРасширеннаяПодсказка" стал равен 'Корректировка остатка выполняется при выполнении операции закрытия месяца Погашение стоимости ТМЦ в эксплуатации в конце года, в котором создана учетная политика. Стоимость списывается на счет 84.02.'
	И элемент формы с именем "ЗаписьУчетНИОКРПоФСБУ26" стал равен 'Нет'
	И элемент формы с именем "ИспользоватьСчет40" стал равен 'Нет'
	И элемент формы с именем "ИспользоватьСчет40РасширеннаяПодсказка" стал равен 'В связи с вступлением в силу ФСБУ 5/2019 может применяться в учете до 2021 года'
	И элемент формы с именем "НастройкаЗаполненияБухОтчетности" стал равен 'Не настраивается'
	И элемент формы с именем "ОписаниеИстории" стал равен 'действует по настоящее время. История изменений (1)'
	И элемент формы с именем "Организация" стал равен '[ТекИмя] ООО'
	И элемент формы с именем "ПроводкиПоРаботникам" стал равен 'Да'
	И элемент формы с именем "СборкаТоваровЧерезСчет20" стал равен 'Да'
	И элемент формы с именем "СписыватьСтоимостьМалоценныхТМЦНаРасходы" стал равен 'Нет'
	И я закрываю окно 'Учетная политика бухгалтерского учета [ТекИмя] ООО'
* заполнение УчетаНалогаНаПрибыль	
	И у поля с именем "ОткрытьНастройкиУчетаНалогаНаПрибыль" я нажимаю гиперссылку 'Изменить'
	И я изменяю флаг с именем 'ВключатьВСоставНалоговыхРасходовАрендныеПлатежи'
	И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
	И я жду закрытия окна 'Настройки учета по налогу на прибыль [ТекИмя] ООО *' в течение 20 секунд
* проверка заполнения УчетаНалогаНаПрибыль
	И у поля с именем "ОткрытьНастройкиУчетаНалогаНаПрибыль" я нажимаю гиперссылку 'Изменить'
	Тогда элемент формы с именем "БазаРаспределенияКосвенныхРасходовПоВидамДеятельности" стал равен 'Доходы от реализации'
	И элемент формы с именем "БазаРаспределенияКосвенныхРасходовПоВидамДеятельностиРасширеннаяПодсказка" стал равен 'При совмещении общей системы налогообложения и ЕНВД расходы, которые невозможно отнести к конкретным видам деятельности, распределяются согласно указанной базе распределения.'
	И элемент формы с именем "ВключатьВСоставНалоговыхРасходовАрендныеПлатежи" стал равен 'Да'
	И элемент формы с именем "ВключатьВСоставНалоговыхРасходовАрендныеПлатежиРасширеннаяПодсказка" стал равен 'Признание в НУ лизинговых платежей выполняется при помощи регламентной операции закрытия месяца.'
	И элемент формы с именем "ГруппаОпределениеДолиПрибылиРасширеннаяПодсказка" стал равен 'Налогоплательщики самостоятельно определяют, какой из показателей для п.2 ст. 288 НК РФ должен применяться - среднесписочная численность работников или расходы на оплату труда. Выбранный налогоплательщиком показатель должен быть неизменным в течение налогового периода.'
	И у Элемента формы с именем "ЗаписьДатаНезависимогоПризнанияДоходовРасходов" текст редактирования стал равен '  .    '
	И элемент формы с именем "ЗаписьДатаНезависимогоПризнанияДоходовРасходовРасширеннаяПодсказка" стал равен ' Требования (обязательства) дооцениваются или уцениваются ежемесячно, вне зависимости от того, признается ли в декларации доход (расход). При этом может быть учтен отложенный доход или расход на счетах 97.КР, 98.КР. Подробнее'
	И элемент формы с именем "ЗаписьНалогообложениеПрибыли" стал равен 'Общие условия налогообложения'
	И элемент формы с именем "ЗаписьПорядокУплатыАвансовПоНалогуНаПрибыль" стал равен 'Ежеквартально'
	И элемент формы с именем "ЗаписьРаздельныйУчетПоНалогуНаПрибыль" стал равен 'Нет'
	И элемент формы с именем "МетодНачисленияАмортизацииНУ" стал равен 'Линейный'
	И элемент формы с именем "ОписаниеИстории" стал равен 'действует по настоящее время. История изменений (1)'
	И элемент формы с именем "Организация" стал равен '[ТекИмя] ООО'
	И элемент формы с именем "ПоказательОпределенияДолиПрибыли_РасходыНаОплатуТруда" стал равен 'Расходы на оплату труда'
	И элемент формы с именем "ПоказательОпределенияДолиПрибыли_СреднесписочнаяЧисленность" стал равен 'Расходы на оплату труда'
	И элемент формы с именем "ПорядокПодачиДекларации" стал равен '0'
	И элемент формы с именем "ФормироватьРезервыПоСомнительнымДолгамНУ" стал равен 'Нет'
	И я закрываю окно 'Настройки учета по налогу на прибыль [ТекИмя] ООО'
* заполнение Настройки учета НДС
	И у поля с именем "ОткрытьНастройкиУчетаНДС" я нажимаю гиперссылку 'Изменить'
	И я изменяю флаг с именем 'РаздельныйУчетТоваровПоНалогообложениюНДС'
	Когда открылось окно 'Настройки учета НДС [ТекИмя] ООО *'
	И я нажимаю кнопку выбора у поля с именем "СтатьяРасходовСписаниеНДС"
	И в таблице "СтатьиРасходов" я нажимаю на кнопку с именем 'СтатьиРасходовСписок'
	И в таблице "СтатьиРасходов" я перехожу к строке:
		| 'Код'       |
		| '00-000012' |
	И в таблице "СтатьиРасходов" я выбираю текущую строку
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
	И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
	И я жду закрытия окна 'Настройки учета НДС [ТекИмя] ООО *' в течение 20 секунд
* проверка заполнения Настройки учета НДС
	И у поля с именем "ОткрытьНастройкиУчетаНДС" я нажимаю гиперссылку 'Изменить'
	И элемент формы с именем "ВариантУчетаНДСПриИзмененииВидаДеятельности" стал равен 'Включать в стоимость'
	И элемент формы с именем "ДекорацияСтатьяРасходовЕНВД" стал равен 'ДекорацияСтатьяРасходовЕНВД'
	И элемент формы с именем "ДекорацияСтатьяРасходовНеНДС" стал равен 'ДекорацияСтатьяРасходовНеНДС'
	И элемент формы с именем "ДекорацияСтатьяРасходовСписаниеНДС" стал равен 'ДекорацияСтатьяРасходовСписаниеНДС'
	И элемент формы с именем "ЕстьРеализацияРаботУслугНеНаТерриторииРФ" стал равен 'Нет'
	И элемент формы с именем "ЕстьРеализацияРаботУслугНеНаТерриторииРФРасширеннаяПодсказка" стал равен 'Если местом реализации работ или услуг не признается РФ, то \"входной\" НДС можно принять к вычету. Установка признака позволяет указывать в документах реализации налогообложение НДС \"Реализация услуг на экспорт\".'
	И элемент формы с именем "ЗаписьПрименяетсяРасчетНДССМежценовойРазницы" стал равен 'Нет'
	И элемент формы с именем "ОписаниеИстории" стал равен 'действует по настоящее время. История изменений (1)'
	И элемент формы с именем "Организация" стал равен '[ТекИмя] ООО'
	И у Элемента формы с именем "ПериодичностьОформленияСводныхСправок" текст редактирования стал равен 'Ежемесячно'
	И элемент формы с именем "ПериодичностьФормированияВычетовИВосстановленийНДС" стал равен 'Месяц'
	И элемент формы с именем "ПравилоОтбораАвансовДляРегистрацииСчетовФактур" стал равен 'Все авансы на конец дня'
	И элемент формы с именем "ПрименяетсяОсвобождениеОтУплатыНДС" стал равен 'Нет'
	И элемент формы с именем "ПрименяетсяОсвобождениеОтУплатыНДСРасширеннаяПодсказка" стал равен 'Организация применяет освобождение от уплаты НДС по ст. 145 или 145.1 НК РФ'
	И элемент формы с именем "РаздельныйУчетПостатейныхПроизводственныхЗатратКомментарий" стал равен 'Раздельный учет постатейных производственных затрат возможен только при использовании партионного учета 2.2 и методе оценки стоимости \"ФИФО скользящая оценка\".'
	И элемент формы с именем "РаздельныйУчетПостатейныхПроизводственныхЗатратКомментарийКартинка" стал равен 'Раздельный учет постатейных производственных затрат комментарий картинка'
	И элемент формы с именем "РаздельныйУчетПостатейныхПроизводственныхЗатратПоНалогообложениюНДС" стал равен 'Нет'
	И элемент формы с именем "РаздельныйУчетТоваровПоНалогообложениюНДС" стал равен 'Да'
	И элемент формы с именем "РаспределятьНДСВМесяцеОсуществленияКапВложений" стал равен 'Нет'
	И элемент формы с именем "СтатьяРасходовСписаниеНДС" стал равен 'Списание НДС'
	И элемент формы с именем "УчетНДСДлительногоЦиклаПроизводства" стал равен 'Нет'
	И элемент формы с именем "УчетНДСДлительногоЦиклаПроизводстваРасширеннаяПодсказка" стал равен 'Учет НДС при длительном цикле производства (п. 13 ст. 167 НК РФ) и учет НДС постатейных расходов. Возможен при включенном партионном учете версии 2.2 и методе оценки стоимости \"ФИФО скользящая\".'
	И элемент формы с именем "УчетНДСПоФактическомуИспользованию" стал равен 'Нет'
	И элемент формы с именем "Учитывать5ПроцентныйПорог" стал равен 'Нет'
	И элемент формы с именем "ФормироватьНДСПредъявленныйПриВключенииВСтоимость" стал равен 'Нет'
	И я закрываю окно 'Настройки учета НДС [ТекИмя] ООО'
* заполнение Ставки налога на имущество
	И у поля с именем "ОткрытьСтавкаНалогаНаИмущество" я нажимаю гиперссылку 'Изменить'
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
	И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
	И я жду закрытия окна 'Ставки налога на имущество [ТекИмя] ООО' в течение 20 секунд
* проверка заполнения Ставки налога на имущество
	И у поля с именем "ОткрытьСтавкаНалогаНаИмущество" я нажимаю гиперссылку 'Изменить'
	Тогда элемент формы с именем "ДекорацияЗнакПроцента" стал равен '%'
	И элемент формы с именем "НалоговаяСтавка" стал равен '2,20'
	И у Элемента формы с именем "НалоговаяСтавка" текст редактирования стал равен '2,20'
	И элемент формы с именем "НалоговаяСтавкаДвижимоеИмущество" стал равен '1,1'
	И элемент формы с именем "НалоговаяСтавкаДвижимоеИмуществоДекорацияПроцент" стал равен '%'
	И элемент формы с именем "ОсвобождениеОтНалогообложения" стал равен 'Нет'
	И элемент формы с именем "ОсвобождениеОтНалогообложенияДвижимогоИмущества" стал равен 'Нет'
	И элемент формы с именем "ПриНаличии1ЛьготыЗаполнять1ЛистРаздела2" стал равен 'Нет'
	И элемент формы с именем "ПроцентУменьшения" стал равен '0'
	И элемент формы с именем "ПроцентУменьшенияДекорацияПроцент" стал равен '%'
	И элемент формы с именем "СнижениеНалоговойСтавки" стал равен 'Нет'
	И элемент формы с именем "СнижениеНалоговойСтавкиДвижимоеИмущество" стал равен 'Нет'
	И элемент формы с именем "УменьшениеСуммыНалогаВПроцентах" стал равен 'Нет'
	И я закрываю окно 'Ставки налога на имущество [ТекИмя] ООО'
* заполнение банковских реквизитов для ООО [ТекИмя]
	И в текущем окне я нажимаю кнопку командного интерфейса 'Банковские счета'
	И в таблице "Список" я нажимаю на кнопку с именем 'СписокСоздать'
	И в поле с именем 'НомерСчета' я ввожу текст '40702810500000000001                       '
	И я нажимаю кнопку выбора у поля с именем "Банк"
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я перехожу к строке:
		| 'БИК'       |
		| '044525225' |
	И в таблице "Список" я выбираю текущую строку
	И я изменяю флаг с именем 'РазрешитьПлатежиБезУказанияЗаявок'
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
	И я закрываю окно 'ПАО СБЕРБАНК, [ТекИмя] ООО (RUB) (Банковский счет организации)'
	И я закрываю все окна клиентского приложения
* проверка создания новой организации
	И в командном интерфейсе я выбираю 'НСИ и администрирование' 'Организации'
	И в таблице 'Список' я перехожу к строке
		| 'Наименование' |
		| '[ТекИмя] ООО'     |
* я запоминаю созданную [ТекИмя]овую  организацию в переменную 
	И я запоминаю значение поля с именем 'Наименование' таблицы 'Список' как '[ТекИмя]ООО'
		
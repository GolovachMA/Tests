

1С:Комплексная автоматизация 2 (2.5.12.147)

Описание : 

1. Создаю новую (тестовую) организацию с применением НДС. 
2. Создаю номенклатуру НСИ с НДС 10 и НДС 20 %. 
3. Делаю аванс на 1/3 суммы от 01 марта
4. Создаю ПТУ для ООО от 02 февраля
4. Делаю возврат на 1/3 суммы ПТУ от 03 апреля
5. Делаю акт сверки взаиморасчетов
6. Делаю печатную форму акта сверки и сравниваю ее с ожиданием


ОБРАТИ ВНИМАНИЕ НА фичу: 1 НСИ настройка параметров
        - нет шага перехода к самому справочнику номенклатуры, т.к. в разделе НСИ и администрирование существуют ДВА элемента с наименованием Номенклатура.
        

МЕТОД 1: (не эталонная база, тестовых данных нет)
    1. загружаем формирование сверки: 
        <ОТЧЕТЫ/1.1 ручное формирование сверки взаиморасчетов с ТестКА1.feature>
            или
        <ОТЧЕТЫ/1.2 автоматическое формирование сверки взаиморасчетов между ТестООО и ТестКА1.feature>

    2. здесь тестовые данные из НСИ записаны в переменные (через экспорт загружаются все документы пошагово)


МЕТОД2: 
    1. загружаем тестовые данные
        1.1 <НСИ/2 создание НСИ организация, контрагент, товар.feature>
        1.2 <НСИ/6.1 создание нового ПТУ на эталонной базе.feature>
        1.3 <НСИ/6.2 создание документа аванса на эталонной базе.feature>
        1.4 <НСИ/6.3 создание документа возврата поставщику на эталонной базе.feature>
    2. формируем сверку: папка Отчеты
        <ОТЧЕТЫ/2.1 формирование сверки взаиморасчетов на эталонной базе.feature>
            или
       <ОТЧЕТЫ/2.2 автоматическое формирование сверки взаиморасчетов.feature>

       

Фриланс: https://www.fl.ru/dashboard/

Резюме: https://petrozavodsk.hh.ru/resume/46b2187aff0732599a0039ed1f3666354b4861


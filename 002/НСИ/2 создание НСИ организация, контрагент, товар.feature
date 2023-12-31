﻿#language: ru

@tree
@ExportScenarios
@IgnoreOnCIMainBuild

Функционал: 02 создание НСИ- организация, контрагент, товар

Как тестировщикя хочу
создать в справочниках новую НСИ - организация, контрагент, товар
чтобы использовать в дальнейших проверках

Контекст:
	Дано я запускаю сценарий открытия TestClient или подключаю уже существующий
	И я закрываю все окна клиентского приложения
	
Сценарий: я создаю новую организацию  приминением общей системы налогообложения (в т.ч. с НДС)

//	при вводе новой организации меняемое значение - Имя
	И я создаю новую организацию "Тест"с приминением общей системы налогообложения (в т.ч. с НДС)

Сценарий: я создаю нового контрагента ТестКА1  и ТестКА2

//	при вооде нового контрагента меняемое значение - Имя, Телефон партнера
	И я создаю нового Партнера имя -"ТестКА1", ТелефонПартнера - "000111"

	И я создаю нового Партнера имя -"ТестКА2", ТелефонПартнера - "990099"

Сценарий: я создаю новый товар с НДС 20 
	
//	при вводе нового товара меняемое значение - Имя, ставка НДС
	И я создаю новый элемент Номенклатуры "ТоварНДС20", СтавкаНДС - "20%"


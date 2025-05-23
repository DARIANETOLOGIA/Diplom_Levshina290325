///////////////////////////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2022, ООО 1С-Софт
// Все права защищены. Эта программа и сопроводительные материалы предоставляются 
// в соответствии с условиями лицензии Attribution 4.0 International (CC BY 4.0)
// Текст лицензии доступен по ссылке:
// https://creativecommons.org/licenses/by/4.0/legalcode
///////////////////////////////////////////////////////////////////////////////////////////////////////

#Область СлужебныеПроцедурыИФункции

Процедура ОбработчикПроверкиПолученияСерверныхОповещений() Экспорт
		СостояниеПолучения = СерверныеОповещенияКлиент.СостояниеПолучения();
	Если СостояниеПолучения.ПроверкаВыполняется Тогда
		Возврат;
	КонецЕсли;
	
	СостояниеПолучения.ПроверкаВыполняется = Истина;
	Попытка
		СерверныеОповещенияКлиент.ПроверитьПолучитьСерверныеОповещения();
		СостояниеПолучения.ПроверкаВыполняется = Ложь;
	Исключение
		СостояниеПолучения.ПроверкаВыполняется = Ложь;
		ВызватьИсключение;
	КонецПопытки;
	
КонецПроцедуры

#КонецОбласти

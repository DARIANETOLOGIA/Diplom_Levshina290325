
Функция УсловияОплатыСотрудников(Сотрудник, Период) Экспорт  
	
	Запрос = Новый Запрос;
	Запрос.Текст = 
	"ВЫБРАТЬ
	|	ВКМ_УсловияОплатыСотрудниковСрезПоследних.ПроцентОтРабот КАК ПроцентОтРабот
	|ИЗ
	|	РегистрСведений.ВКМ_УсловияОплатыСотрудников.СрезПоследних(&Период, Сотрудник = &Сотрудник) КАК ВКМ_УсловияОплатыСотрудниковСрезПоследних";
	
	Запрос.УстановитьПараметр("Сотрудник", Сотрудник);
	Запрос.УстановитьПараметр("Период", Период);
	
	РезультатЗапроса = Запрос.Выполнить();
	
	Выборка = РезультатЗапроса.Выбрать();
	
	Если Выборка.Следующий() Тогда
		
		Возврат Выборка.ПроцентОтРабот; 
		
	КонецЕсли; 
	
	ВызватьИсключение "Процент не задан";
	
КонецФункции

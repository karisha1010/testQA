﻿#language: ru



Функционал: Создание документа поступление товаров

Как Менеджер я хочу
Создание документа поступление товаров 
чтобы поставить товар на учет 

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Создание документа поступление товаров
// создание документа поступление
* Открытие формы создания документа
	И я закрываю все окна клиентского приложения 	
	И В командном интерфейсе я выбираю 'Закупки' 'Приобретение товаров и услуг'
	Тогда открылось окно 'Приобретение товаров и услуг'
	И в таблице "СписокДокументыПоступления" я нажимаю на кнопку с именем 'СписокДокументыПоступленияСоздать'
	Тогда открылось окно 'Приобретение товаров и услуг (создание)'
* Заполнение шапки документа
	И из выпадающего списка с именем "Партнер" я выбираю точное значение 'АвтоСоюз ООО'
	И я нажимаю кнопку выбора у поля с именем "Склад"
	Тогда открылось окно 'Склады и магазины'
	И в таблице "Список" я разворачиваю строку:
		| 'Наименование'             |
		| 'Основные торговые склады' |
	И в таблице "Список" я перехожу к строке:
		| 'Наименование'         |
		| 'Основной Склад с НДС' |
	И в таблице "Список" я выбираю текущую строку
	Тогда элемент формы с именем "Склад" стал равен 'Основной Склад с НДС'			
* Заполнение товарной части
	И я перехожу к закладке с именем "ГруппаТовары"
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я активизирую поле с именем "ТоварыНоменклатура"
	И в таблице "Товары" из выпадающего списка с именем "ТоварыНоменклатура" я выбираю точное значение 'Товар'
	И я перехожу к следующему реквизиту
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличествоУпаковок"
	И в таблице "Товары" в поле с именем 'ТоварыКоличествоУпаковок' я ввожу текст '5,000'
	И в таблице "Товары" я активизирую поле с именем "ТоварыЦена"
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '555,00'
	И в таблице "Товары" я завершаю редактирование строки
* проверка заполнения табличной части
	Тогда таблица "Товары" стала равной:
		| 'Наименование вх.' | 'Количество' | 'Номенклатура поставщика' | 'Номенклатура' | 'Сумма с НДС' | 'Характеристика'                   | 'Назначение' | 'Упаковка' | 'Вид цены' | 'Количество по РНПТ'        | 'Цена в заказе' | 'Цена'   | 'Сумма руч.' | '% руч.' | 'Сумма'    | 'Ставка НДС' | 'НДС' | 'Сумма взаиморасчетов' | 'Склад'                | 'Подразделение-получатель' | 'Аналитика расходов'               | 'Статья расходов'                  | 'Списать на расходы' | 'Номер ГТД'             | 'Страна происхождения'  | 'Сертификат' | 'Номер паспорта' | 'Номер вх.' | 'Дата вх.' |
		| ''                 | '5,000'      | ''                        | 'Товар'        | '2 775'       | '<характеристики не используются>' | ''           | 'шт'       | ''         | '<товар не прослеживается>' | ''              | '555,00' | ''           | ''       | '2 775,00' | 'Без НДС'    | ''    | ''                     | 'Основной Склад с НДС' | '<для работ/услуг>'        | '<для работ/услуг без назначения>' | '<для работ/услуг без назначения>' | 'Нет'                | '<ГТД не используются>' | '<ГТД не используются>' | ''           | ''               | ''          | ''         |
	И я нажимаю на кнопку "Записать"
* Номер
	И я запоминаю значение поля "Номер" как "$Номер$"	
* Проведение документа
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна 'Приобретение товаров и услуг (создание) *' в течение 20 секунд
*Проверка создания документа
	И таблица  "СписокДокументыПоступления" содержит строки:
		| 'Номер'       |
		| '$Номер$' |

Сценарий: Проверка наличия в сравочнике номенклатуры Товар
И В командном интерфейсе я выбираю 'НСИ и администрирование' 'Номенклатура'
Когда открылось окно 'Номенклатура'
И таблица  "СписокРасширенныйПоискНоменклатура" содержит строки:
		| 'Наименование'       |
		| 'Товар' |


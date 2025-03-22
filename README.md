# README

1. Использовать gem ActiveInteraction => https://github.com/AaronLasseigne/active_interaction отрефакторить класс Users::Create
2. Исправить опечатку Skil. Есть 2 пути решения. Описать оба.
3. Исправить связи
4. Поднять Rails приложение и в нем использовать класс Users::Create
5. Написать тесты

Варианты исправления опечатки Skil
1. Создать миграцию для переименования таблицы skils на skills.  
   Изменить имя класса в файле модели на Skill.  
   Изменить имя класса на связи has_many :skills, class_name: 'Skill'.  
   Переименовать файл модели с skil на skill.  

3. Изменить имя класса в файле модели на Skill.  
   Переименовать файл модели с skil на skill.  
   В модель Skill добавить self.table_name = 'skils', чтобы явно указать связь с таблицей.  
   Изменить имя класса на связи has_many :skills, class_name: 'Skill'.  

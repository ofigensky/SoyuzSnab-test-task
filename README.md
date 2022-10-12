# Описание задания
Нужно сделать приложение, в котором будет два экрана.
Первый экран должен быть представлен как TableView/TableLayout в два столбца, в которых будет отображаться погода разных городов России, больше 20 городов в таблицу отображать не нужно.
В итоге должна получиться таблица из двух столбцов по 10 городов.
Ячейка города должна содержать картинку, отображающую текущую погоду, температуру и краткое описание погоды (облачно, осадки, ясно и т.д.)
Также должна быть кнопка для добавление города в избранное.
Второй экран должен быть представлен в виде списка избранных городов. В строке города должна быть указана температура, скорость ветра и краткое описание погоды.
Необходимо реализовать возможность добавление городов в избранное на первом экране и их удаление  из избранного на втором.
Для получения данных о погоде использовать openweathermap или любую другую открытую api.

# Результат
1. Данные 20 городов одновременно показываются благодаря DispatchGroup().
2. Города разбиты на 2 колонны через разделение массива пополам.
3. Использование Singleton и delegate для передачи данных.
4. В качестве изображений взяты SF Symbols.
5. Удаление свайпом через функцию tableView.

  ![ezgif-5-d1498742dd](https://user-images.githubusercontent.com/84827402/195265686-3bbf64f8-cc85-46fd-a9e3-c441bfb48ed2.gif)
  
Dark mode enabled

<img src=https://user-images.githubusercontent.com/84827402/195266906-cdff0b63-dadd-4fef-9a09-0573c455e1c6.png width="222" height="480">  


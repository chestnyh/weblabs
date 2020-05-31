### TASK

Все вище зроблене потрібно з’єднати на стороні клієнта а саме написати наступні скрипти.
1. Запит на сервер даних про товари та вивід їх на сайті
2. Відкриття форми замовлення, введення даних та відправка на сервер для збереження даних
користувача та даних самого замовлення.
3. Відкриття даних замовлень користувача.


For successfull project launch you need free 80 and 3306 ports
or change params in docker-compose.yaml file

Start project:
```docker-compose up```

Authorization data:
* email: some.email0@a.ua
* password: 111111

### Links
Front:
* http://localhost/index.html
* http://localhost/order.html
Api:
* http://localhost/api/auth.php
* http://localhost/api/orders.php
* http://localhost/api/products.php
* http://localhost/api/registration.php
* http://localhost/api/user_orders.php
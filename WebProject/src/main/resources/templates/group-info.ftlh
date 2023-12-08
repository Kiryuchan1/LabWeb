<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html"
      xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/style.css">
    <title>Склад групи</title>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const ageInput = document.getElementById('age');
            const fillButton = document.getElementById('fill');

            function validateAge() {
                const ageValue = parseInt(ageInput.value, 10);
                const isValidAge = !isNaN(ageValue) && ageValue >= 2 && ageValue <= 6;

                fillButton.disabled = !isValidAge;
            }

            validateAge();

            ageInput.addEventListener('input', validateAge);
        });
    </script>

</head>
<body>
<div class="container">
    <header>
        <a href="/">
            <img src="https://www.factinate.com/storage/app/media/factinate/2021/05/Michi-no-miya_Hirohito_1902.jpg"
                 alt="Логотип">
        </a>
        <nav>
            <ul>
                <li><a href="/">Наші групи</a></li>
                <li><a href="faq.ftlh">FAQ</a></li>
                <li><a href="info.ftlh">Про нас</a></li>
            </ul>
        </nav>
    </header>
    <div class="main">
        <h2><b>Список групи: ${group.title}</b></h2>
        <hr>
        <div class="table-container">
            <table>
                <thead>
                <tr>
                    <th>Ім'я</th>
                    <th>Прізвище</th>
                    <th>Побатькові</th>
                    <th>Вік</th>
                    <th>Відповідальні</th>
                    <th>Видалити</th>
                    <th>Змінити інформацію</th>
                </tr>
                </thead>
                <tbody>
                <#list children as child>
                    <tr>
                        <td>${child.fname}</td>
                        <td>${child.surname}</td>
                        <td>${child.lastname}</td>
                        <td>${child.age}</td>
                        <td><a href="/group/${group.id}/child/${child.id}/parent">Відповідальні</a></td>
                        <td>
                            <form action="/group/${group.id}/child/${child.id}/delete" method="post">
                                <button type="submit">Видалити</button>
                            </form>
                        </td>
                        <td>
                            <a href="/group/${group.id}/child/${child.id}/edit">Змінити інформацію</a>
                        </td>
                    </tr>
                </#list>
                </tbody>
            </table>
        </div>
        <hr>
        <h2>Додати дитину</h2>
        <form action="/group/${group.id}/child/create" method="post">
            <label for="fname">Ім'я:</label><br>
            <input placeholder="Введіть ім'я" type="text" id="fname" name="fname" required><br><br>

            <label for="surname">Прізвище:</label><br>
            <input placeholder="Введіть прізвище" type="text" id="surname" name="surname" required><br><br>

            <label for="lastname">Побатькові:</label><br>
            <input placeholder="Введіть побатькові" type="text" id="lastname" name="lastname" required><br><br>

            <label for="age">Вік:</label><br>
            <input placeholder="Введіть вік" type="number" id="age" name="age" required><br><br>

            <button type="submit" id="fill">Додати дитину до групи</button>
        </form>
        <form action="/group/delete/${group.id}" method="post">
            <button type="submit">Видалити групу</button>
        </form>
    </div>
    <footer>
        <div class="contact-icons">
            <a href="tel:+380676110670" target="_blank"><i class="fa-solid fa-phone"></i>Телефон</a>
            <a href="mailto:kiryuchan2004@gmail.com" target="_blank"><i class="fa-solid fa-envelope"></i>Email</a>
            <a href="https://t.me/Kiryuchan1" target="_blank"><i class="fab fa-telegram"></i>Телеграм</a>
            <a href="https://api.whatsapp.com/send?phone=номер-телефону" target="_blank"><i
                        class="fab fa-whatsapp-square"></i> WhatsApp</a>
        </div>
    </footer>
</div>
</body>
</html>
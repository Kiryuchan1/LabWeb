<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/style.css">
    <title>Батьки</title>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const phoneInput = document.getElementById('phone');
            const fillButton = document.getElementById('fill');

            function validatePhoneNumber() {
                const phoneNumber = phoneInput.value.trim();
                const isValidPhoneNumber = /^\d{9}$/.test(phoneNumber);

                fillButton.disabled = !isValidPhoneNumber;
            }

            validatePhoneNumber();

            phoneInput.addEventListener('input', validatePhoneNumber);

            validatePhoneNumber();
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
        <h2>Відповідальні за ${child.fname} ${child.surname}</h2>
        <hr>
        <div class="table-container">
            <table>
                <thead>
                <tr>
                    <th>Ім'я</th>
                    <th>Прізвище</th>
                    <th>Побатькові</th>
                    <th>Пошта</th>
                    <th>Телефон</th>
                    <th>Видалити</th>
                    <th>Редагувати</th>
                </tr>
                </thead>
                <tbody>
                <#list child.parents as parent>
                    <tr>
                        <td>${parent.fname}</td>
                        <td>${parent.surname}</td>
                        <td>${parent.lastname}</td>
                        <td>${parent.mail}</td>
                        <td>${parent.phone}</td>
                        <td>
                            <form action="/group/${group.id}/child/${child.id}/parent/${parent.id}/delete"
                                  method="post">
                                <button type="submit">Видалити</button>
                            </form>
                        </td>
                        <td>
                            <a href="/group/${group.id}/child/${child.id}/parent/${parent.id}/edit">Редагувати</a>
                        </td>
                    </tr>
                </#list>
                </tbody>
            </table>
        </div>
        <hr>
        <h2>Додати відповідального</h2>
        <form action="/group/${group.id}/child/${child.id}/parent/create" method="post">
            <label for="fname">Ім'я:</label><br>
            <input placeholder="Введіть ім'я" type="text" id="fname" name="fname" required><br><br>

            <label for="surname">Прізвище:</label><br>
            <input placeholder="Введіть прізвище" type="text" id="surname" name="surname" required><br><br>

            <label for="lastname">Побатькові:</label><br>
            <input placeholder="Введіть побатькові" type="text" id="lastname" name="lastname" required><br><br>

            <label for="mail">Пошта:</label><br>
            <input placeholder="Введіть пошту" type="email" id="mail" name="mail" required><br><br>

            <label for="phone">Введіть останні 9 чисел номеру:</label><br>
            <input placeholder="Введіть номер телефону" type="number" id="phone" name="phone" required><br><br>

            <button type="submit" id="fill">Додати відповідального</button>
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

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/style.css">
    <title>Редагувати батьків</title>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const phoneInput = document.getElementById('phone');
            const fillButton = document.getElementById('fill');

            function validatePhoneNumber() {
                const phoneNumber = phoneInput.value.replace(/\s/g, ''); // Видаляємо всі пробіли
                const isValidPhoneNumber = /^\d{3}\s?\d{3}\s?\d{3}$/.test(phoneNumber);

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
        <h1>Змінити інформацію про батьків</h1>
        <form action="/group/${group.id}/child/${child.id}/parent/${parent.id}/update" method="post">
            <label for="fname">Ім'я:</label><br>
            <input placeholder="Введіть ім'я" type="text" id="fname" name="fname" value="${parent.fname}"
                   required><br><br>

            <label for="surname">Прізвище:</label><br>
            <input placeholder="Введіть прізвище" type="text" id="surname" name="surname" value="${parent.surname}"
                   required><br><br>

            <label for="lastname">Побатькові:</label><br>
            <input placeholder="Введіть побатькові" type="text" id="lastname" name="lastname" value="${parent.lastname}"
                   required><br><br>

            <label for="mail">Пошта:</label><br>
            <input placeholder="Введіть пошту" type="email" id="mail" name="mail" value="${parent.mail}"
                   required><br><br>

            <label for="phone">Введіть останні 9 чисел номеру:</label><br>
            <input placeholder="Введіть номер телефону" type="number" id="phone" name="phone" value="${parent.phone}"
                   required><br><br>

            <button type="submit" id="fill">Оновити інформацію</button>
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

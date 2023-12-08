<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/style.css">
    <title>Редагувати вихователів</title>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const phoneInput = document.getElementById('phone');
            const stageInput = document.getElementById('stage');
            const fillButton = document.getElementById('fill');

            function validatePhoneNumber() {
                const phoneNumber = phoneInput.value.trim();
                const isValidPhoneNumber = /^\d{9}$/.test(phoneNumber);

                const stageValue = parseInt(stageInput.value, 10);
                const isValidStage = !isNaN(stageValue) && stageValue >= 0 && stageValue <= 45;

                fillButton.disabled = !isValidPhoneNumber || !isValidStage;
            }

            validatePhoneNumber();

            phoneInput.addEventListener('input', validatePhoneNumber);
            stageInput.addEventListener('input', validatePhoneNumber);
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
        <h2>Змінити інформацію про вихователя</h2>
        <form action="/group/${group.id}/caregiver/${caregiver.id}/update" method="post">

            <label for="fname">Ім'я:</label><br>
            <input placeholder="Введіть ім'я" type="text" id="fname" name="fname" value="${caregiver.fname}"
                   required><br><br>

            <label for="surname">Прізвище:</label><br>
            <input placeholder="Введіть прізвище" type="text" id="surname" name="surname" value="${caregiver.surname}"
                   required><br><br>

            <label for="lastname">Побатькові:</label><br>
            <input placeholder="Введіть побатькові" type="text" id="lastname" name="lastname"
                   value="${caregiver.lastname}" required><br><br>

            <label for="phone">Введіть останні 9 чисел номеру:</label><br>
            <input placeholder="Введіть телефон" type="number" id="phone" name="phone" value="${caregiver.phone}"
                   required><br><br>

            <label for="mail">Пошта:</label><br>
            <input placeholder="Введіть пошту" type="email" id="mail" name="mail" value="${caregiver.mail}"
                   required><br><br>

            <label for="stage">Стаж:</label><br>
            <input placeholder="Введіть cтаж роботи" type="number" id="stage" name="stage" value="${caregiver.stage}"
                   required><br><br>

            <button type="submit" id="fill">Оновити інформацію про вихователя</button>
        </form>
    </div>
    <footer>
        <div class="contact-icons">
            <a href="tel:+380676110670" target="_blank"><i class="fa-solid fa-phone"></i>Телефон</a>
            <a href="mailto:kiryuchan2004@gmail.com" target="_blank"><i class="fa-solid fa-envelope"></i>Email</a>
            <a href="https://t.me/Kiryuchan1" target="_blank"><i class="fab fa-telegram"></i>Телеграм</a>
            <a href="https://api.whatsapp.com/send?phone=+380676110670" target="_blank"><i
                        class="fab fa-whatsapp-square"></i> WhatsApp</a>
        </div>
    </footer>
</div>
</body>
</html>
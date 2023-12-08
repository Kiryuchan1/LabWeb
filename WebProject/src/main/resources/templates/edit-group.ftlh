<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/style.css">
    <title>Редагувати групи</title>
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
        <h1>Перейменувати групу</h1>
        <form action="/group/update/${group.id}" method="post">
            <label for="1">Нова назва</label><br>
            <input placeholder="Введіть нову назву" type="text" id="1" name="title" value="${group.title}"><br><br>
            <button type="submit">Оновити інформацію</button>
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
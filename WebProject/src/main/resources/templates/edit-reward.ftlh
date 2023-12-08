<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/style.css">
    <title>Змінити інформацію про нагороду</title>
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
        <h1>Змінити інформацію про нагороду</h1>
        <form action="/group/${group.id}/caregiver/${caregiver.id}/reward/${reward.id}/update" method="post">
            <label for="name">Назва:</label><br>
            <input placeholder="Enter name" type="text" id="name" name="name" value="${reward.name}" required><br><br>

            <label for="description">Опис:</label><br>
            <input placeholder="Enter description" type="text" id="description" name="description"
                   value="${reward.description}" required><br><br>

            <button type="submit">Змінити інформацію</button>
        </form>
    </div>
    <footer>
        <div class="contact-icons">
            <a href="tel:+380676110670" target="_blank"><i class="fa-solid fa-phone"></i>Phone</a>
            <a href="mailto:kiryuchan2004@gmail.com" target="_blank"><i class="fa-solid fa-envelope"></i>Email</a>
            <a href="https://t.me/Kiryuchan1" target="_blank"><i class="fab fa-telegram"></i>Telegram</a>
            <a href="https://api.whatsapp.com/send?phone=phone-number" target="_blank"><i
                        class="fab fa-whatsapp-square"></i> WhatsApp</a>
        </div>
    </footer>
</div>
</body>
</html>

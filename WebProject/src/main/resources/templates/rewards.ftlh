<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/style.css">
    <title>Нагороди</title>
</head>
<body>
<div class="container">
    <header>
        <a href="/">
            <img src="https://www.factinate.com/storage/app/media/factinate/2021/05/Michi-no-miya_Hirohito_1902.jpg"
                 alt="Logo">
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
        <h2>Нагороди ${caregiver.fname} ${caregiver.surname}</h2>
        <hr>
        <div class="table-container">
            <table>
                <thead>
                <tr>
                    <th>Назва</th>
                    <th>Опис</th>
                    <th>Видалити</th>
                    <th>Редагувати</th>
                </tr>
                </thead>
                <tbody>
                <#list caregiver.rewards as reward>
                    <tr>
                        <td>${reward.name}</td>
                        <td>${reward.description}</td>
                        <td>
                            <form action="/group/${group.id}/caregiver/${caregiver.id}/reward/${reward.id}/delete"
                                  method="post">
                                <button type="submit">Видалити</button>
                            </form>
                        </td>
                        <td>
                            <a href="/group/${group.id}/caregiver/${caregiver.id}/reward/${reward.id}/edit">Редагувати</a>
                        </td>
                    </tr>
                </#list>
                </tbody>
            </table>
        </div>
        <hr>
        <h2>Додати нагороду</h2>
        <form action="/group/${group.id}/caregiver/${caregiver.id}/reward/create" method="post">
            <label for="name">Назва:</label><br>
            <input placeholder="Введіть назву" type="text" id="name" name="name" required><br><br>

            <label for="description">Опис:</label><br>
            <input placeholder="Введіть опис нагороди" type="text" id="description" name="description" required><br><br>

            <button type="submit">Додати нагороду</button>
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

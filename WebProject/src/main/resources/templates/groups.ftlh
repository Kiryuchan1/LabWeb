<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/style.css">
    <title>Групи</title>
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
        <h2>Оберіть Групу</h2>
        <form action="/" method="get">
            <label for="2">Пошук за назвою групи:</label><br>
            <input placeholder="введіть назву" id="2" type="text" name="title"><br><br>
            <button type="submit" value="Шукати">Шукати</button>
            <br><br>
        </form>
        <div class="table-container">
            <table>
                <thead>
                <tr>
                    <th>Назва групи</th>
                    <th>Працівники</th>
                    <th>Склад групи</th>
                    <th>Перейменувати групу</th>
                </tr>
                </thead>
                <tbody>
                <#list groups as group>
                    <tr>
                        <td>${group.title}</td>
                        <td><a href="/group/${group.id}/caregivers">Вихователі</a></td>
                        <td><a href="/group/${group.id}"> Переглянути</a></td>
                        <td><a href="/group/edit/${group.id}">Перейменувати групу</a></td>
                    </tr>
                </#list>
                </tbody>
            </table>
        </div>
        <#if groups?size == 0>
            <h2><b>Такої групи не існує</b></h2>
        </#if>

        <hr>
        <h2>Створити групу</h2>
        <form action="/group/create" method="post">
            <label for="1">Назва групи:</label><br>
            <input placeholder="введіть назву" type="text" id="1" name="title" required><br><br>
            <button type="submit" value="Додати групу">Додати групу</button>
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
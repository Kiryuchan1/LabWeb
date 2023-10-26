document.addEventListener('DOMContentLoaded', function() {
    const registrationForm = document.getElementById('registration-form');

    registrationForm.addEventListener('submit', function(e) {
        e.preventDefault();

        // тут інпути зчитую
        const email = document.getElementById('email').value;
        const password = document.getElementById('password').value;
        const lastName = document.getElementById('last_name').value;
        const firstName = document.getElementById('first_name').value;
        const middleName = document.getElementById('middle_name').value;
        const birthdate = document.getElementById('birthdate').value;
        const group = document.getElementById('group').value;
        const gender = document.querySelector('input[name="gender"]:checked');
        const phone = document.getElementById('phone').value;

        // тут ерори отримаю
        const emailError = document.getElementById('email-error');
        const passwordError = document.getElementById('password-error');
        const phoneError = document.getElementById('phone-error');

        // тут ерори зникають
        emailError.textContent = '';
        passwordError.textContent = '';
        phoneError.textContent = '';

        // перевірка пошти (додана валідація)
        if (!email || !isValidEmail(email)) {
            emailError.textContent = 'Введіть пошту за форматом (щось + @ + щось + . + щось)';
        }

        // перевірка паролю (додана валідація)
        if (password.length < 8) {
            passwordError.textContent = 'Пароль повинен містити щонайменше 8 символів';
        }

        // перевірка ерорів
        if (
            emailError.textContent ||
            passwordError.textContent ||
            phoneError.textContent
        ) {
            return;
        }

        // чудо созіданія
        const newRow = document.createElement('tr');

        const checkbox = document.createElement('input');
        checkbox.type = 'checkbox';

        newRow.appendChild(document.createElement('td')).appendChild(checkbox);
        newRow.appendChild(document.createElement('td')).textContent = email;
        newRow.appendChild(document.createElement('td')).textContent = lastName;
        newRow.appendChild(document.createElement('td')).textContent = firstName;
        newRow.appendChild(document.createElement('td')).textContent = middleName;
        newRow.appendChild(document.createElement('td')).textContent = birthdate;
        newRow.appendChild(document.createElement('td')).textContent = group;
        newRow.appendChild(document.createElement('td')).textContent = gender.value; 
        newRow.appendChild(document.createElement('td')).textContent = phone;

        document.getElementById('data-table').getElementsByTagName('tbody')[0].appendChild(newRow);

        registrationForm.reset();
    });

    // перевірка пошти (щось + @ + щось + . + щось)
    function isValidEmail(email) {
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return emailRegex.test(email);
    }

    // Валідація паролю в реальному часі
    const passwordInput = document.getElementById('password');
    const passwordError = document.getElementById('password-error');

    passwordInput.addEventListener('input', function() {
        const password = passwordInput.value;
        if (password.length < 8) {
            passwordError.textContent = 'Пароль повинен містити щонайменше 8 символів';
        } else {
            passwordError.textContent = ''; 
        }
    });

    // Валідація пошти в реальному часі
    const emailInput = document.getElementById('email');
    const emailError = document.getElementById('email-error');

    emailInput.addEventListener('input', function() {
        const email = emailInput.value;
        if (!isValidEmail(email)) {
            emailError.textContent = 'Введіть пошту за форматом (щось + @ + щось + . + щось)';
        } else {
            emailError.textContent = ''; 
        }
    });

    // Дублювання рядків
    document.getElementById('duplicate-rows').addEventListener('click', function () {
        const checkboxes = document.querySelectorAll('input[type="checkbox"]:checked');
        checkboxes.forEach(function (checkbox) {
            const row = checkbox.closest('tr');
            const newRow = row.cloneNode(true);
            document.getElementById('data-table').getElementsByTagName('tbody')[0].appendChild(newRow);
        });
    });

    // Видалення рядків
    document.getElementById('delete-rows').addEventListener('click', function () {
        const checkboxes = document.querySelectorAll('input[type="checkbox"]:checked');
        checkboxes.forEach(function (checkbox) {
            const row = checkbox.closest('tr');
            row.remove();
        });
    });
    
    // Маска 
    const element = document.getElementById('phone');
    const maskOptions = {
      mask: '+{38}(000)000-00-00',
      lazy: false
    };
    const mask = IMask(element, maskOptions);
});

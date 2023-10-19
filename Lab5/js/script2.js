function sendMessage(user) {
    const inputElement = document.getElementById(user);
    const message = inputElement.value;
    if (message.trim() !== "") {
        const chatElement = document.getElementById("chat");
        const messageElement = document.createElement("div");
        messageElement.classList.add("message");

        if (user === 'user1') {
            messageElement.classList.add("user1-message");
        } else if (user === 'user2') {
            messageElement.classList.add("user2-message");
        }


        messageElement.textContent = `${user} : ${message}`;
        chatElement.appendChild(messageElement);
        inputElement.value = "";
        chatElement.scrollTop = chatElement.scrollHeight;
    }
}
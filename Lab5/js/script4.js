function calculateDayOfWeek() {
    const inputDate = new Date(document.getElementById("date").value);
    const year = inputDate.getFullYear();
    const month = inputDate.getMonth() + 1;
    const day = inputDate.getDate();

    let a = Math.floor((14 - month) / 12);
    let y = year - a;
    let m = month + 12 * a - 2;
    let dayOfWeek = (day + y + Math.floor(y / 4) - Math.floor(y / 100) + Math.floor(y / 400) + Math.floor((31 * m) / 12)) % 7;

    const daysOfWeek = ["неділю", "понеділок", "вівторок", "середу", "четвер", "п'ятницю", "суботу"];
    document.getElementById("result").textContent = `Ви народилися в ${daysOfWeek[dayOfWeek]}.`;
}
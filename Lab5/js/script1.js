function calculateRectangle() {
    const length = parseFloat(document.getElementById("length").value);
    const width = parseFloat(document.getElementById("width").value);

    if (!isNaN(length) && !isNaN(width)) {
        const perimeter = 2 * (length + width);
        const area = length * width;
        const diagonal = Math.sqrt(length ** 2 + width ** 2);

        document.getElementById("perimeter").textContent = perimeter;
        document.getElementById("area").textContent = area;
        document.getElementById("diagonal").textContent = diagonal;
    } else {
        document.getElementById("perimeter").textContent = "Невірні дані";
        document.getElementById("area").textContent = "Невірні дані";
        document.getElementById("diagonal").textContent = "Невірні дані";
    }
}

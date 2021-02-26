var clock = document.getElementById("att-new-clock");
if (clock != undefined) {
    setInterval(() => {
        let date = new Date()
        clock.innerHTML = date.toLocaleTimeString();
    }, 1000);
}

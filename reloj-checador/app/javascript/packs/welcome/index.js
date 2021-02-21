var clock = document.getElementById("clock");
if (clock != undefined)
    var renderTime = function () {
        var time = new Date();

        clock.textContent = `${time.getDate()}-${time.getMonth() + 1}-${time.getFullYear()} ${time.getHours()}:${time.getMinutes()}:${time.getSeconds()}`
    };
renderTime();
setInterval(renderTime, 1000);
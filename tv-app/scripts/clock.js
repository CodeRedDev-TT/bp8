(function (){
    var timePassed = 0, timeLeft = TIME_LIMIT, classTitle = 'HURRICANE', timerInterval,TIME_LIMIT = 650, text = "", containerSelector ="#app";

    var html = " <div class=\"base-timer\">\n" +
        "                    <svg class=\"base-timer__svg\" viewBox=\"0 0 100 100\" xmlns=\"http://www.w3.org/2000/svg\">\n" +
        "                        <g class=\"base-timer__circle\">\n" +
        "                            <circle class=\"base-timer__path-elapsed\" cx=\"50\" cy=\"50\" r=\"45\"></circle>\n" +
        "                            <path\n" +
        "                                    id=\"base-timer-path-remaining\"\n" +
        "                                    stroke-dasharray=\"283\"\n" +
        "                                    class=\"base-timer__path-remaining ${remainingPathColor}\"\n" +
        "                                    d=\"\n" +
        "          M 50, 50\n" +
        "          m -45, 0\n" +
        "          a 45,45 0 1,0 90,0\n" +
        "          a 45,45 0 1,0 -90,0\n" +
        "        \"\n" +
        "                            ></path>\n" +
        "                        </g>\n" +
        "                    </svg>\n" +
        "            <span id=\"base-timer-label-title\" class=\"fw-bold base-timer__label-title \">Work</span>\n" +
        "            <span id=\"base-timer-label\" class=\"fw-bold base-timer__label\">0:00</span>\n" +
        "        </div>"

    var clock = {
        _calculateTimeFraction: function () {
            const rawTimeFraction = timeLeft / TIME_LIMIT;
            return rawTimeFraction - (1 / TIME_LIMIT) * (1 - rawTimeFraction);
        },
        _setCircleDasharray: function () {
            const circleDasharray = `${(
                this._calculateTimeFraction() * 283
            ).toFixed(0)} 283`;
            document
                .querySelector(containerSelector + " #base-timer-path-remaining")
                .setAttribute("stroke-dasharray", circleDasharray);
        },
        _formatTime: function (time) {
            const minutes = Math.floor(time / 60);
            let seconds = time % 60;

            if (seconds < 10) {
                seconds = `0${seconds}`;
            }
            return minutes + ":"+seconds;
        },
        _onTimesUp: function () {
            clearInterval(timerInterval);
        },
        startTimer: function (txt, onTimeUp) {
            text = txt;
            timerInterval = setInterval(() => {
                timePassed = timePassed += 1;
                timeLeft = TIME_LIMIT - timePassed;
                document.querySelector(containerSelector + " #base-timer-label").innerText = this._formatTime(timeLeft);
                this._setCircleDasharray();
                if (timeLeft === 0) {
                    this._onTimesUp();
                    if(onTimeUp)
                        onTimeUp();
                }
            }, 1000);
        },

        initiate: function(conSelector, maxTimeInSeconds, label){
            timePassed = 0;
            TIME_LIMIT = maxTimeInSeconds;
            timeLeft = TIME_LIMIT;
            containerSelector =conSelector
            document.querySelector(containerSelector).innerHTML = html;
            document.querySelector(containerSelector + " #base-timer-label-title").innerText = label;
        }
    }


    window.ClockCountdown = clock;
})();

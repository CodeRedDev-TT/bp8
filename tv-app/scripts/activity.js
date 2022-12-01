
var {createApp} = Vue;

createApp({
    data() {
        return {
            classTitle: 'HURRICANE',
            timePassed: 0,
            timeLeft: 650,
            timerInterval: null,
            TIME_LIMIT: 650
        }
    },
    created() {
        this.startTimer();
    },
    methods: {
        onTimesUp() {
            clearInterval(this.timerInterval);
        },
        startTimer() {
            this.timerInterval = setInterval(() => {
                this.timePassed = this.timePassed += 1;
                this.timeLeft = this.TIME_LIMIT - this.timePassed;
                this.setCircleDasharray();
                if (this.timeLeft === 0) {
                    this.onTimesUp();
                }
            }, 1000);
        }
        ,
        formatTime(time) {
            const minutes = Math.floor(time / 60);
            let seconds = time % 60;

            if (seconds < 10) {
                seconds = `0${seconds}`;
            }
            return `${minutes}:${seconds}`;
        },

        calculateTimeFraction() {
            const rawTimeFraction = this.timeLeft / this.TIME_LIMIT;
            return rawTimeFraction - (1 / this.TIME_LIMIT) * (1 - rawTimeFraction);
        },
        setCircleDasharray() {
            const circleDasharray = `${(
                this.calculateTimeFraction() * 283
            ).toFixed(0)} 283`;
            document
                .getElementById("base-timer-path-remaining")
                .setAttribute("stroke-dasharray", circleDasharray);
        },
    }
}).mount('#activity-app');
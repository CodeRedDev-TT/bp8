export default {
    data() {
        return {
            TIME_LIMIT: 20,
            timePassed: 0,
            timerInterval: null,
            remainingTime: 0
        }
    },
    props:["time"],
    created() {
        this.TIME_LIMIT = this.remainingTime = this.time;
        this.startTimer();
    },
    methods: {
        onTimesUp() {
            clearInterval(this.timerInterval);
        },
        startTimer() {
            this.timerInterval = setInterval(() => {
                this.timePassed = this.timePassed += 1;
                this.remainingTime = this.TIME_LIMIT - this.timePassed;
                this.setCircleDasharray();
                if (this.remainingTime === 0) {
                    this.onTimesUp();
                }
            }, 1000);
        },

        formatTime(time) {
            const minutes = Math.floor(time / 60);
            let seconds = time % 60;

            if (seconds < 10) {
                seconds = `0${seconds}`;
            }

            return `${minutes}:${seconds}`;
        },
        calculateTimeFraction() {
            const rawTimeFraction = this.remainingTime / this.TIME_LIMIT;
            return rawTimeFraction - (1 / this.TIME_LIMIT) * (1 - rawTimeFraction);
        },
        setCircleDasharray() {
            const circleDasharray = `${(
                this.calculateTimeFraction() * 283
            ).toFixed(0)} 283`;
            document
                .getElementById("base-timer-path-remaining")
                .setAttribute("stroke-dasharray", circleDasharray);
        }
    },
    template: `
      <div class="base-timer">
      <svg class="base-timer__svg" viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
        <g class="base-timer__circle">
          <circle class="base-timer__path-elapsed" cx="50" cy="50" r="45"></circle>
          <path
              id="base-timer-path-remaining"
              stroke-dasharray="283"
              class="base-timer__path-remaining"
              d="
                  M 50, 50
                  m -45, 0
                  a 45,45 0 1,0 90,0
                  a 45,45 0 1,0 -90,0
                "
          ></path>
        </g>
      </svg>
      <span id="base-timer-label" class="base-timer__label">{{formatTime(remainingTime)}}</span>
      </div>
    `
}
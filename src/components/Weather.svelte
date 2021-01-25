<script>
  export let weather = "";
  export let humidity = 0;
  export let pressure = 0;
  export let temp = 0;
  export let feels_like = 0;
  export let wind_speed = "unknown";
  export let wind_direction = "unknown";
</script>

<div>The weather prediction is {weather.toLowerCase()}</div>
<div>The humidity is {humidity}%</div>
<div>The pressure is {pressure}mb</div>
<div>The wind is {wind_speed}mph ({wind_direction})</div>
<div>
  The temperature is {Math.floor(temp)}°F
  <small>(feels like {Math.floor(feels_like)}°)</small>
</div>

<style>
  div {
    font-size: 25px;
  }
</style>
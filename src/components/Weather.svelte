<script>
  export let weather = "";
  export let humidity = 0;
  export let temp = 0;
</script>

<div>The current weather is {weather}</div>
<div>The humidity is {humidity}%</div>
<div>The current temperature is {Math.floor(temp)}°F.</div>

<style>
  div {
    font-size: 25px;
  }
</style>
<script>
  import { onMount } from 'svelte';
  import Title from './Title.svelte';
  import Weather from './Weather.svelte';
  import Solunar from './Solunar.svelte';
  import Loader from './Loader.svelte';
  import { getTimes } from 'solunar';
  import { cardinalFromDegree } from 'cardinal-direction';
  
  let weatherData = {};
  let solunarData = {};
  let latitude = 0;
  let longitude = 0;
  let selected_date = new Date(); // Date('Jan 24 2020 14:00') for 5/5 action

  // $: console.log('solunarData: '+JSON.stringify(solunarData)); // Log message anytime solunarData changes
  // $: console.log('weatherData: '+JSON.stringify(weatherData)); // Log message anytime weatherData changes

  onMount(async () => {
    getUserLocation()
  });

  const getWeatherData = async () => {
    try {
      const res = await fetch(
        `https://api.openweathermap.org/data/2.5/weather?lat=${latitude}&lon=${longitude}&appid=9a44afd9c9a3a35a01853ec3a9a8379b&units=imperial`
      );
      weatherData = await res.json();
      const weather_main = new Array;
      const weather_desc = new Array;
      weatherData.weather.forEach(w => {
        weather_main.push(w.main);
        weather_desc.push(w.description);
      });
      weatherData.weather = weather_main.join(", ");
      weatherData.weather_description = weather_desc.join(", ");
      weatherData.wind.direction = cardinalFromDegree(weatherData.wind.deg)
    } catch(err) {
      console.error(err)
    }
  }

  const getSolunarData = async () => {
    try {
      solunarData = getTimes(selected_date,`${latitude}`,`${longitude}`);
    } catch(err) {
      console.error(err)
    }
  }

  const getUserLocation = () => {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(position => {
        latitude = position.coords.latitude;
        longitude = position.coords.longitude;
        getWeatherData();
        getSolunarData();
      })
    } else {
      alert("Sorry, Geolocation is not supported in your browser.")
    }
  }
  
</script>


{#if weatherData.weather}
  <Title location={weatherData.name} date={selected_date} latitude={latitude} longitude={longitude}/>
  <div>
    <i>Showing conditions for</i><br/>
    {selected_date}<br/>
    Location: {latitude},{longitude}<br/>
  </div>
  <spacer> </spacer>
  <Solunar solunar={solunarData}/>
  <spacer> </spacer>
  <Weather weather={weatherData.weather_description} humidity={weatherData.main.humidity} temp={weatherData.main.temp} pressure={weatherData.main.pressure} feels_like={weatherData.main.feels_like} wind_speed={weatherData.wind.speed} wind_direction={weatherData.wind.direction}/>
{:else}
  <Loader/>
{/if}

<style>
  div {
    font-size: 25px;
  }
  spacer {
    padding-bottom: 25px;
  }
</style>
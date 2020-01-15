<script>
  import { onMount } from 'svelte';
  import Title from './Title.svelte';
  import Weather from './Weather.svelte';
  import Loader from './Loader.svelte';
  
  let weatherData = {};
  let latitude = 0;
  let longitude = 0;

  onMount(async () => {
    getUserLocation()
  });

  const getWeatherData = async () => {
    try {
      const res = await fetch(
        `https://api.openweathermap.org/data/2.5/weather?lat=${latitude}&lon=${longitude}&appid=ab1fcdbee534c8cfce19f3c1ff919a6d&units=imperial`
      );
      weatherData = await res.json();
      weatherData.weather = weatherData.weather[0].main;
    } catch(err) {
      console.error(err)
    }
  }

  const getUserLocation = () => {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(position => {
        latitude = position.coords.latitude;
        longitude = position.coords.longitude

        console.log(position)
        getWeatherData();
      })
    } else {
      alert("Sorry, Geolocation is not supported in your browser.")
    }
  }
  
</script>


{#if weatherData.weather}
  <Title location={weatherData.name}/>
  <Weather weather={weatherData.weather} humidity={weatherData.main.humidity} temp={weatherData.main.temp}/>
{:else}
  <Loader/>
{/if}
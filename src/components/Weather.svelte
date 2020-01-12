<script>
  import { onMount } from 'svelte';
  
  let weatherData = {};
  let latitude = 0;
  let longitude = 0;

  onMount(async () => {
    getUserLocation()
  });

  const getWeatherData = async () => {
    try {
      const res = await fetch(
        `https://api.openweathermap.org/data/2.5/weather?lat=${latitude}&lon=${longitude}&appid=ab1fcdbee534c8cfce19f3c1ff919a6d`
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
        getWeatherData();
      })
    } else {
      alert("Geolocation is not supported in your browser.")
    }
  }
  
</script>

{#if weatherData.weather}
  <h2>The weather is {weatherData.weather}</h2>
  {:else}
  <p>Loading...</p>
{/if}
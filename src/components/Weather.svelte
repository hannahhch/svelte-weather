<script>
  import { onMount } from 'svelte';
  
  export let weatherData = [];
  let latitude = 39.7392;
  let longitude = 104.9903;

  onMount(async () => {
		const res = await fetch(`https://api.openweathermap.org/data/2.5/weather?lat=${latitude}&lon=${longitude}&appid=ab1fcdbee534c8cfce19f3c1ff919a6d`);
    weatherData = await res.json();
    
    console.log(weatherData.weather[0].main)
  });


  
</script>
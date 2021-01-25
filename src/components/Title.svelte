<script>
  export let date;
  export let location = "";
  export let latitude = 0;
  export let longitude = 0;
</script>

<h1>Fish-Dash { location }</h1>

<div>
  <div>
    <i>Showing conditions for</i><br />
    Date: {date}<br />
    Location: {latitude},{longitude} ({location})
  </div>
</div>

<style>
  h1 {
    font-family: 'Oswald', sans-serif;
    font-size: 100px;
    text-transform: uppercase;
  }
  div {
    font-size: 25px;
    padding-bottom: 25px;
  }
</style>
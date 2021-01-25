<script>
  export let solunar = {};
  export let max = 5;
</script>

<div>The fishing action rating is a 
{#if solunar.action == max}
	<b>{solunar.action}/{max} !!</b>
{:else if solunar.action == (max-1)}
	<i>{solunar.action}/{max} !</i>
{:else}
	{solunar.action}/{max}
{/if}
</div>

<style>
  div {
    font-size: 25px;
  }
</style>
<script>    
    export let data;
    const { item, similarItems } = data;

    import Radarchart from '$lib/radarchart.svelte';
    
    // Add more debugging
    
    // Check if all required score fields exist
    $: if (item) {
      {
        protein_score: item.protein_score;
        fiber_score: item.fiber_score;
        calories_score: item.calories_score;
        fats_score: item.fats_score;
        sodium_score: item.sodium_score;
        cholesterol_score: item.cholesterol_score;
        price_score: item.price_score;
        carbs_score: item.carbs_score
      };
    }
    
    // Create radar data only when item exists and has required fields
    $: radarData = (item && 
      typeof item.protein_score !== 'undefined' && 
      typeof item.fiber_score !== 'undefined'
    ) ? {
      labels: [
        "Protein", "Fiber", 'Calories', 'Fats', 'Sodium', 'Cholesterol', 'Price', 'Carbs'
      ],
      datasets: [
        {
          label: item.item_name || "N/A",
          data: [
            Number(item.protein_score) || 0,
            Number(item.fiber_score) || 0,
            Number(item.calories_score) || 0,
            Number(item.fats_score) || 0,
            Number(item.sodium_score) || 0,
            Number(item.cholesterol_score) || 0,
            Number(item.price_score) || 0,
            Number(item.carbs_score) || 0
          ],
          backgroundColor: "rgba(255,99,132,0.4)",
          borderColor: "rgba(255,99,132,1)",
          borderWidth: 1
        }
      ]
    } : null;
    
    </script>    
    <main class="item-detail">
      {#if item}
        <h1>{item.item_name}</h1>
        <p><strong>Restaurant:</strong> {item.restaurant_name}</p>
        <p><strong>Calories:</strong> {item.calories}</p>
        <p><strong>Protein:</strong> {item.protein} grams</p>
        <p><strong>Fats:</strong> {item.fats} grams</p>
        <p><strong>Sodium:</strong> {item.sodium} milligrams</p>
        <p><strong>Sugars:</strong> {item.sugars} grams</p>
        <p><strong>Cholesterol:</strong> {item.cholesterol} milligrams</p>
        <p><strong>Price:</strong> {item.price} dollars</p>
        <p><strong>Carbs: </strong> {item.carbs} grams</p>
        <p><strong>Fiber:</strong> {item.fiber} grams</p>
        
        <!-- Only render chart if radarData exists and is valid -->
        {#if radarData && radarData.datasets && radarData.datasets[0]}
          <details>
            <summary>View Nutrition Radar Chart</summary>
            <Radarchart {radarData} title={`Nutrition Profile for ${item.item_name}`} />
          </details>
        {:else}
          <p>Chart data not ready. RadarData: {JSON.stringify(radarData)}</p>
        {/if}

        {#if similarItems.length}
        <section class="similar-items">
          <h2>See Similar Items</h2>
          <div class="item-grid">
            {#each similarItems as sim}
            <a href={`/explore/${sim.id}`} class="item-card" rel="prefetch">
              <h3>{sim.item_name}</h3>
              <p>From {sim.restaurant_name}</p>
              <p>Similarity: {(sim.similarity * 100).toFixed(2)}%</p>
            </a>
          {/each}
        </div>
      </section>
    {/if}
        
        <a href="/explore" class='back-link'>← Back to Explore</a>
      {:else}
        <p>Loading item...</p>
      {/if}
    </main>
    
    <style>
    .item-detail {
      max-width: 700px;
      margin: 0 auto;
      padding: 2rem;
      background-color: #fff0f6;
      border-radius: 1rem;
      box-shadow: 0 2px 10px rgba(0,0,0,0.05);
    }
    
    h1 {
      margin-bottom: 1rem;
    }
    
    p {
      font-size: 1rem;
      margin-bottom: 0.5rem;
    }
    
    .back-link {
      display: inline-block;
      margin-top: 2rem;
      text-decoration: none;
      color: #d63384;
      font-weight: bold;
    }
    
    .back-link:hover {
      text-decoration: underline;
    }
    .similar-items {
      margin-top: 3rem;
      padding-top: 2rem;
      border-top: 1px solid #eee;
    }
    .item-grid {
      display: grid;
      gap: 1rem;
      grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
    }
    .item-card {
      background: #ffe8f0;
      padding: 1rem;
      border-radius: 1rem;
      text-decoration: none;
      color: inherit;
      box-shadow: 0 1px 6px rgba(0,0,0,0.1);
    }
    </style>
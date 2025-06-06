<script>
    import fastfoodData from '$lib/fastfood_with_ids.json';

    let items = fastfoodData;
    let selectedType = '';
    let selectedRestaurant = '';
    let selectedGoals = [];

    const goalOptions = [
        { label: "high protein˚.🎀༘⋆", value: 'highProtein' },
        { label: 'low fat˚.🎀༘⋆', value: 'lowFat' },
        { label: 'low carb˚.🎀༘⋆', value: 'lowCarb' },
        { label: 'high fat˚.🎀༘⋆', value: 'highFat' },
        { label: 'high fiber˚.🎀༘⋆', value: 'highFiber' },
        { label: 'low sodium˚.🎀༘⋆', value: 'lowSodium' }, 
        { label: 'low price˚.🎀༘⋆', value: 'lowPrice' },
        { label: 'low calorie˚.🎀༘⋆', value: 'lowCalorie'}

    ];

    function toggleGoal(goal) {
        if (selectedGoals.includes(goal)) {
            selectedGoals = selectedGoals.filter(g => g !== goal);
        } else {
            selectedGoals = [...selectedGoals, goal];
        }
    }

    function clearFilters() {
        selectedType = '';
        selectedRestaurant = '';
        selectedGoals = [];
    }

    function calculateScore(item) {
        let score = 0;
        for (const goal of selectedGoals) {
            switch (goal) {
                case 'highProtein': if (item.protein >= 20) score += 1; break;
                case 'lowFat': if (item.fats <= 23) score += 1; break;
                case 'lowCarb': if (item.carbs <= 40) score += 1; break;
                case 'highFat': if (item.fats >= 23) score += 1; break;
                case 'highFiber': if (item.fiber >= 3) score += 1; break;
                case 'lowSodium': if (item.sodium <= 1015) score += 1; break;
                case 'lowPrice': if (item.price <= 6.60) score += 1; break;
                case 'lowCalorie': if (item.calories <= 440) score += 1; break;
            }
        }
        return score;
    }

    $: filteredItems = items
    .filter(item => {
        const matchesType = selectedType ? item.item_type === selectedType : true;
        const matchesRestaurant = selectedRestaurant ? item.restaurant_name === selectedRestaurant : true;
        const meetsGoals = selectedGoals.every(goal => {
            switch (goal) {
                case 'highProtein': return item.protein >= 20;
                case 'lowFat': return item.fats <= 23;
                case 'lowCarb': return item.carbs <= 40;
                case 'highFat': return item.fats >= 23;
                case 'highFiber': return item.fiber >= 3;
                case 'lowSodium': return item.sodium <= 1015;
                case 'lowPrice': return item.price <= 6.60;
                case 'lowCalorie': return item.calories <= 440;
                default: return true;
            }
        });
        return matchesType && matchesRestaurant && meetsGoals;
    })
    .map(item => ({ ...item, score: calculateScore(item) }))
    .sort((a,b) => b.score - a.score);

    console.log("✅ Loaded items:", items);
</script>

<main class="explore">
    <h1>explore food items-`♡´-</h1>
    <p class="description">dive into ur favorite fast food items and explore their nutrition profilesꨄ︎</p>   

    <div class="filters">
        <select bind:value={selectedType}>
            <option value="">all types</option>
            <option value="Breakfast">breakfast</option>
            <option value="Desert">desert</option>
            <option value="Drink">drink</option>
            <option value="Entrée">entrée</option>
            <option value="Side">side</option>
        </select>

        <select bind:value={selectedRestaurant}>
            <option value="">all restaurants</option>
            {#each Array.from(new Set(items.map(i => i.restaurant_name))) as name}
                <option value={name}>{name.toLowerCase()}</option>
            {/each}
        </select>
    </div>

    <div class="goal-filters">
        <h3>dietary goals⋆. 𐙚 ̊</h3>

        <button on:click={clearFilters} class="clear-button">
            clear filters⋆.˚
        </button>

        {#each goalOptions as goal}
            <button
            class:selected={selectedGoals.includes(goal.value)}
            on:click={() => toggleGoal(goal.value)}
            >
                {goal.label}
            </button>
        {/each}
    </div>

    <!-- Placeholder for future interactive data  -->
     {#if filteredItems.length > 0}
     <section class="item-grid">
        {#each filteredItems as item, i}
        <a href={`/explore/${item.id}`} class="item-card" rel="prefetch">
            <h2>{item.item_name.toLowerCase()}</h2>
            <p><strong>match:</strong>
                {#if i === 0}☆best match
                {:else if i < 5}❀great option
                {:else}｡𖦹°‧consider this{/if}
            </p>
            <p>restaurant: {item.restaurant_name.toLowerCase()}</p>
            <p>calories: {item.calories}</p>
            <p>protein: {item.protein} grams</p>
            <p>fats: {item.fats} grams</p>
            <p>sodium: {item.sodium} milligrams</p>
            <p>sugars: {item.sugars} grams</p>
            <p>cholesterol: {item.cholesterol} milligrams</p>
            <p>price: {item.price} dollars</p>
            <p>carbs: {item.carbs} grams</p>
            <p>fiber: {item.fiber} grams</p>
        </a>
        {/each}
     </section>
     {:else}
        <p class="no-results">no results match your filters ╰┈➤ try adjusting your search</p>
    {/if}
</main>

<style>
    .explore {
        max-width: 1000px;
        margin: 0 auto;
        padding: 3rem 1rem;
        text-align: center;
    }
    h1 {
        font-size: 2.2rem;
        margin-bottom: 0.25rem;
    }
    .description {
        color: #666;
        font-size: 1rem;
        margin-bottom: 2rem;
    }
    .item-grid {
        display: grid;
        gap: 1.5rem;
        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));

    }
    .item-card {
        display: block;
        background-color: #fff0f6;
        border-radius: 1rem;
        padding: 1rem;
        box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        transition: transform 0.2s ease;
        text-decoration: none;
        color: inherit;
    }
    .item-card:hover {
        cursor: pointer;
        transform: scale(1.02);
    }
    .item-card h2 {
        margin-bottom: 0.5rem;
        font-size: 1.2rem;
    }
    .item-card p {
        margin: 0.25rem 0;
        font-size: 0.95rem;
    }
    .no-results {
        margin-top: 2rem;
        font-size: 1rem;
        color: #999;
        font-style: italic;
    }
    .selected {
        background-color: #d63384;
        color: white;
        box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        border: none;
    }
    .clear-button {
        margin-bottom: 1rem;
        background: #ffe5ec;
        border: none;
        padding: 0.5rem 1rem;
        border-radius: 0.5rem;
        cursor: pointer;
        font-weight: bold;
    }
</style>
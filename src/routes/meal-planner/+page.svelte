<script>
    import fastfoodData from '$lib/fastfood_with_ids.json';

    const entreeItems = fastfoodData.filter(item => item.item_type === 'Entrée');
    const sideItems = fastfoodData.filter(item => item.item_type === 'Side'); 
    const drinkItems = fastfoodData.filter(item => item.item_type === 'Drink');
    const desertItems = fastfoodData.filter(item => item.item_type === 'Desert');
    

    let selectedEntree = null;
    let selectedSide = null;
    let selectedDrink = null;
    let selectedDesert = null;

    $: totalNutrition = {
        calories: (selectedEntree?.calories || 0) + (selectedSide?.calories || 0) + (selectedDrink?.calories || 0) + (selectedDesert?.calories || 0),
        protein: (selectedEntree?.protein || 0) + (selectedSide?.protein || 0) + (selectedDrink?.protein || 0) + (selectedDesert?.protein || 0),
        carbs: (selectedEntree?.carbs || 0) + (selectedSide?.carbs || 0) + (selectedDrink?.carbs || 0) + (selectedDesert?.carbs || 0),
        fats: (selectedEntree?.fats || 0) + (selectedSide?.fats || 0) + (selectedDrink?.fats || 0) + (selectedDesert?.fats || 0),
        fiber: (selectedEntree?.fiber || 0) + (selectedSide?.fiber || 0) + (selectedDrink?.fiber || 0) + (selectedDesert?.fiber || 0),
        sodium: (selectedEntree?.sodium || 0) + (selectedSide?.sodium || 0) + (selectedDrink?.sodium || 0) + (selectedDesert?.sodium || 0),
        sugars: (selectedEntree?.sugars || 0) + (selectedSide?.sugars || 0) + (selectedDrink?.sugars || 0) + (selectedDesert?.sugars || 0),
        cholesterol: (selectedEntree?.cholesterol || 0) + (selectedSide?.cholesterol || 0) + (selectedDrink?.cholesterol || 0) + (selectedDesert?.cholesterol || 0),
        price: (selectedEntree?.price || 0) + (selectedSide?.price || 0) + (selectedDrink?.price || 0) + (selectedDesert?.price || 0)
    };
</script>

<main class="planner">
    <h1> 🍔 build ur meal</h1>

    <div class="planner-section">
        <h2>౨ৎentrée</h2>
        <select bind:value={selectedEntree}>
            <option value={null}>select an entrée✿ʚɞ</option>
            {#each entreeItems as item}
                <option value={item}>{item.item_name}</option>
            {/each}
        </select>

        <h2>౨ৎside</h2>
        <select bind:value={selectedSide}>
            <option value={null}>select a side✿ʚɞ</option>
            {#each sideItems as item}
                <option value={item}>{item.item_name}</option>
            {/each}
        </select>

        <h2>౨ৎdrink</h2>
        <select bind:value={selectedDrink}>
            <option value={null}>select a drink✿ʚɞ</option>
            {#each drinkItems as item}
                <option value={item}>{item.item_name}</option>
            {/each}
        </select>

        <h2>౨ৎdesert</h2>
        <select bind:value={selectedDesert}>
            <option value={null}>selct a desert✿ʚɞ</option>
            {#each desertItems as item}
                <option value={item}>{item.item_name}</option>
            {/each}
        </select>
    </div>

    <div class="summary">
        <h2>total nutrition</h2>
        <p><strong>calories:</strong> {totalNutrition.calories}</p>
        <p><strong>protein:</strong> {totalNutrition.protein} grams</p>
        <p><strong>carbs:</strong> {totalNutrition.carbs} grams</p>
        <p><strong>fiber:</strong> {totalNutrition.fiber} grams</p>
        <p><strong>cholesterol:</strong> {totalNutrition.cholesterol} milligrams</p>
        <p><strong>sodium:</strong> {totalNutrition.sodium} milligrams</p>
        <p><strong>sugars:</strong> {totalNutrition.sugars} grams</p>
        <p><strong>total price:</strong> ${totalNutrition.price.toFixed(2)} dollars</p>
        <p><strong>fats:</strong> {totalNutrition.fats} grams</p>
    </div>
</main>

<style>
    .planner {
        max-width: 900px;
        margin: 0 auto;
        padding: 2rem;
    }
    h1 {
        text-align: center;
        font-size: 2rem;
    }
    .planner-section {
        display: grid;
        grid-template-columns: 1fr;
        gap: 1.5rem;
        margin-bottom: 2rem;
    }
    select {
        width: 100%;
        padding: 0.5rem;
        font-size: 1rem;
        border-radius: 0.5rem;
    }
    .summary {
        background-color: #fff0f6;
        border-radius: 1rem;
        padding: 1rem;
        box-shadow: 0 2px 10px rgba(0,0,0,0.05);
    }
</style>
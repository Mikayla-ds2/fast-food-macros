<script>
    import fastfoodData from '$lib/fastfood.json';

    let items = fastfoodData;
    console.log ("✅ Loaded items:", items);
</script>

<main class="explore">
    <h1> Explore Food Items</h1>
    <p class="description"> Dive into your favorite fast food items and explore their nutrition profiles.</p>   

    <!-- Placeholder for future interactive data  -->
     <section class="item-grid">
        {#each items as item}
        <div class="item-card">
            <h2><a href={`/explore/${item.id}`}>{item.item_name}</a></h2>
            <p>Restaurant: {item.restaurant_name}</p>
            <p>Calories: {item.calories}</p>
            <p>Protein: {item.protein} grams</p>
            <p>Fats: {item.fats} grams</p>
            <p>Sodium: {item.sodium} milligrams</p>
            <p>Sugars: {item.sugars} grams</p>
            <p>Cholesterol: {item.cholesterol} milligrams</p>
            <p>Price: {item.price} dollars</p>
            <p>Carbs: {item.carbs} grams</p>
            <p>Fiber: {item.fiber} grams</p>
        </div>
        {/each}
     </section>
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
        background-color: #fff0f6;
        border-radius: 1rem;
        padding: 1rem;
        box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        transition: transform 0.2s ease;
    }
    .item-card {
        background-color: #fff0f6;
        border-radius: 1rem;
        padding: 1rem;
        box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        transition: transform 0.2s ease;
    }
    .item-card:hover {
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
    .item-card h2 a {
        text-decoration: none;
        color: #d63384;
    }
    .item-card h2 a:hover {
        text-decoration: underline;
    }
</style>
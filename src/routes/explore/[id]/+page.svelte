<script>
    import Radarchart from '$lib/radarchart.svelte';
    
    export let item;

    const radarData = {
        labels: [
            "Protein", "Fiber", 'Calories', 'Fats', 'Sodium', 'Cholesterol', 'Price', 'Carbs'],
            datasets: [
                {
                    label: item?.item_name || "N/A",
                    data: [
                        item?.protein_score,
                        item?.fiber_score,
                        item?.calories_score,
                        item?.fats_score,
                        item?.sodium_score,
                        item?.cholesterol_score,
                        item?.carbs_score
                    ],
                    backgroundColor: "rgba(255,99,132,0.4)",
                    borderColor: "rgba(255,99,132,1)",
                    borderWidth: 1
                }
            ]
    };

    console.log('✅ Loaded item:', item);
</script>

<main class="item-detail">
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

    <RadarChart {radarData} title={`Nutrition Profile for ${item.item_name}`} />

    <a href="/explore" class='back-link'>← Back to Explore</a>
</main>

    <!--
    <RadarChart 
        data={{
            labels: [
            "Protein", "Fiber", 'Calories', 'Fats', 'Sodium', 'Cholesterol', 'Price', 'Carbs'],
            datasets: [
                {
                    label: item.item_name,
                    data: [
                    item.protein_score,
                    item.fiber_score,
                    item.calories_score,
                    item.fats_score,
                    item.sodium_score,
                    item.cholesterol_score,
                    item.price_score,
                    item.carbs_score
                    ],
                    backgroundColor: "rgba(255,99,132,0.4)",
                    borderColor: "rgba(255,99,132,1)",
                    borderWidth: 1
                }
            ]
        };
            }
    title="Nutrition Profile"
    />
-->

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
</style>
<script>
    // No JS logic for now-just structure
    </script>
<main class="home">
    <h1> Fast Food Macro Explorer</h1>
    <p class="tagline">Explore fast food nutritional information and find items that fit your nutritional goals.</p>

    <section class="features">
        <ul>
            <li> Compare items by protein, sugar, sodium & more.</li>
            <li> Visualize foods with radar charts & scatter plots.</li>
            <li> Match meals to your health goals.</li>
        </ul> 
    </section>

    <nav class="buttons">
        <a href="/explore" class="nav-btn"> Explore Meals</a>
        <a href="/match" class="nav-btn"> Match Your Goal</a>
        <a href="/about" class="nav-btn"> About Project</a>
    </nav>
</main>
<style>
    :global(body) {
        margin: 0;
        font-family: 'Poppins', sans-serif;
        background-color: #fdf6f9;
        color: #2c2c2c;
    }
    .home {
        text-align: center;
        padding: 4rem 1rem;
        max-width: 600px;
        margin: 0 auto;
    }
    h1 {
        font-size: 2.5rem;
        margin-bottom: 0.5rem;      
    }
    .tagline {
        font-size: 1.1rem;
        color: #888;
        margin-bottom: 2rem;
    }
    .features li {
        margin: 0.75rem;
        font-size: 1.05rem;
    }
    .buttons {
        display: flex;
        flex-direction: column;
        gap: 1rem;
    }
    .nav-btn {
        background-color: #f7c5e0;
        color:#2c2c2c;
        padding: 0.75rem 1.5rem;
        border-radius: 0.75rem;
        text-decoration: none;
        font-weight:bold;
        transition: background 0.3s ease;
    }
    .nav-btn:hover {
        background-color: #f3b0d3;
    }
    @media (min-width: 600px) {
        .buttons {
            flex-direction: row;
            justify-content: center;
        }
    }
</style>


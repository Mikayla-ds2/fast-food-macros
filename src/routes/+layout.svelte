<script>
    // add logo/icons here
</script>

<nav class="navbar">
    <a href="/">Home</a>
    <a href="/explore">Explore</a>
    <a href="/meal-planner">Meal Planner</a>
    <a href="/about">About</a>
</nav>

<slot />

<style>
    .navbar {
        display: flex;
        justify-content: center;
        gap: 2rem;
        background-color: #fff0f6;
        padding: 1rem;
        box-shadow: 0 2px 5px rgba(0,0,0,0.05);
        border-radius: 0 0 1rem 1rem;
        position: sticky;
        top: 0;
        z-index: 10;
    }
    .navbar a {
        text-decoration: none;
        color: #d63384;
        font-weight: bold;
        transition: color 0.2s ease;
    }
    .navbar a:hover {
        color: #a61e4d;
        text-decoration: underline;
    }
</style>
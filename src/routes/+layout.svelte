
<nav class="navbar">
    <a href="/">「 ✦ home ✦ 」</a>
    <a href="/explore">「 ✦ explore ✦ 」</a>
    <a href="/meal-planner">「 ✦ meal planner ✦ 」</a>
    <a href="/about">「 ✦ about ✦ 」</a>
</nav>

<slot />

<style>
    @font-face {
        font-family: 'Roxborough CF';
        src: url('/src/lib/fonts/roxborough-cf.otf') format('opentype');
        font-weight: normal;
        font-style: normal;
    }
    @font-face {
        font-family: 'Telegraf';
        src: url(/src/lib/fonts/telegraf-regular.ttf) format('truetype');
        font-weight: normal;
        font-style: normal;
    }

    :root {
        --font-heading: 'Roxborough CF', sans-serif;
        --font-body: 'Telegraf', serif;
    }

    nav a {
        font-family: var(--font-heading);
    }
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
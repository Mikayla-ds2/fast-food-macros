<script>
    import { Radar } from 'svelte-chartjs';
    import { Chart, registerables } from 'chart.js';
    Chart.register(...registerables);

    export let data;
    export let title = "Nutrition Profile";
</script>

<div class="chart-wrapper">
    <Radar
    {data}
    options = {{
        responsive: true,
        plugins: {
            title: {
                display: true,
                text: title,
                font: {
                    size: 18,
                    weight: 'bold'
                }

            },
            legend: {
                display: false,
            }
        },
        scales: {
            r: {
                min: 0,
                max: 100,
                ticks: {
                    stepSize: 20
                }
            }
        }
    }}
    />
</div>

<style>
    .chart-wrapper {
        max-width: 500px;
        margin: 2rem auto;
    }
</style>
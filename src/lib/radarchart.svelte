<script>
    export let radarData;
    export let title = "Nutrition Profile";
    
    // Simple function to convert radar data to SVG points
    function createRadarPoints(data, centerX, centerY, maxRadius) {
      if (!data || !data.datasets || !data.datasets[0] || !data.datasets[0].data) {
        return [];
      }
      
      const values = data.datasets[0].data;
      const numPoints = values.length;
      const points = [];
      
      for (let i = 0; i < numPoints; i++) {
        const angle = (i * 2 * Math.PI) / numPoints - Math.PI / 2; // Start from top
        const value = values[i] || 0;
        const radius = (value / 100) * maxRadius; // Assuming max value is 100
        
        const x = centerX + radius * Math.cos(angle);
        const y = centerY + radius * Math.sin(angle);
        
        points.push({ x, y, value, label: data.labels[i] });
      }
      
      return points;
    }
    
    function createGridLines(centerX, centerY, maxRadius, steps = 5) {
      const lines = [];
      const numPoints = 8; // 8 categories
      
      for (let step = 1; step <= steps; step++) {
        const radius = (step / steps) * maxRadius;
        const points = [];
        
        for (let i = 0; i < numPoints; i++) {
          const angle = (i * 2 * Math.PI) / numPoints - Math.PI / 2;
          const x = centerX + radius * Math.cos(angle);
          const y = centerY + radius * Math.sin(angle);
          points.push(`${x},${y}`);
        }
        
        lines.push(points.join(' '));
      }
      
      return lines;
    }
    
    function createAxisLines(centerX, centerY, maxRadius) {
      const lines = [];
      const numPoints = 8;
      
      for (let i = 0; i < numPoints; i++) {
        const angle = (i * 2 * Math.PI) / numPoints - Math.PI / 2;
        const x = centerX + maxRadius * Math.cos(angle);
        const y = centerY + maxRadius * Math.sin(angle);
        lines.push({ x1: centerX, y1: centerY, x2: x, y2: y });
      }
      
      return lines;
    }
    
    $: centerX = 250;
    $: centerY = 250;
    $: maxRadius = 160;
    $: radarPoints = radarData ? createRadarPoints(radarData, centerX, centerY, maxRadius) : [];
    $: gridLines = createGridLines(centerX, centerY, maxRadius);
    $: axisLines = createAxisLines(centerX, centerY, maxRadius);
    $: pathData = radarPoints.length > 0 ? `M ${radarPoints.map(p => `${p.x},${p.y}`).join(' L ')} Z` : '';
    
    console.log('Simple radar chart - radarData:', radarData);
    console.log('Simple radar chart - radarPoints:', radarPoints);
    </script>
    
    <div class="chart-wrapper">
      <h3>{title}</h3>
      
      {#if radarData && radarData.datasets && radarData.datasets[0]}
        <svg width="500" height="500" viewBox="0 0 500 500">
          <!-- Grid lines -->
          {#each gridLines as gridLine, i}
            <polygon 
              points={gridLine} 
              fill="none" 
              stroke="#e0e0e0" 
              stroke-width="1"
            />
          {/each}
          
          <!-- Axis lines -->
          {#each axisLines as line}
            <line 
              x1={line.x1} 
              y1={line.y1} 
              x2={line.x2} 
              y2={line.y2} 
              stroke="#ccc" 
              stroke-width="1"
            />
          {/each}
          
          <!-- Data path -->
          {#if pathData}
            <path 
              d={pathData} 
              fill="rgba(255,99,132,0.4)" 
              stroke="rgba(255,99,132,1)" 
              stroke-width="2"
            />
          {/if}
          
          <!-- Data points -->
          {#each radarPoints as point}
            <circle 
              cx={point.x} 
              cy={point.y} 
              r="4" 
              fill="rgba(255,99,132,1)"
            />
          {/each}
          
          <!-- Labels -->
          {#each radarPoints as point, i}
            <text 
              x={point.x + (point.x > centerX ? 14 : point.x < centerX ? -14 : 0)} 
              y={point.y + (point.y > centerY ? 17 : point.y < centerY ? -7 : 0)} 
              text-anchor={point.x > centerX ? 'start' : point.x < centerX ? 'end' : 'middle'}
              font-size="12" 
              fill="#333"
            >
              {point.label}: {Math.round(point.value)}
            </text>
          {/each}
        </svg>
      {:else}
        <p>No chart data available</p>
        <p>Debug: {JSON.stringify(radarData)}</p>
      {/if}
    </div>
    
    <style>
    .chart-wrapper {
      max-width: 500px;
      margin: 2rem auto;
      text-align: center;
    }
    
    svg {
      border: 1px solid #eee;
      border-radius: 8px;
    }
    
    h3 {
      margin-bottom: 1rem;
      color: #333;
    }
    </style>
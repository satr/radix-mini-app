const express = require('express');
const client = require('prom-client');

const app = express();

// Create a Registry to register the metrics
const register = new client.Registry();

// Create a Counter metric
const httpRequestsTotal = new client.Counter({
    name: 'http_requests_total',
    help: 'Total number of HTTP requests',
    labelNames: ['method', 'route', 'status_code'],
});

// Register the metric with the registry
register.registerMetric(httpRequestsTotal);

// Enable the collection of default metrics
client.collectDefaultMetrics({ register });

// Endpoint to serve metrics
app.get('/metrics', async (req, res) => {
    res.set('Content-Type', register.contentType);
    res.end(await register.metrics());
});

// Example API endpoint
app.get('/api', (req, res) => {
    // Increment the request counter with labels
    httpRequestsTotal.inc({
        method: req.method,
        route: req.route.path,
        status_code: 200,
    });
    res.send('Hello world!');
});

// Example API endpoint
app.get('/api', (req, res) => {
    // Increment the request counter with labels
    httpRequestsTotal.inc({
        method: req.method,
        route: req.route.path,
        status_code: 200,
    });
    res.send('Hello Prometheus!');
});

// Start the server
const PORT = process.env.PORT || 8080;
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});


Write-host "Rmove Coniainers"  -ForegroundColor Green
docker-compose rm -f

Write-Host "Start Bild of Contianers"  -ForegroundColor Green
docker-compose build

Write-Host "Starting cotiners" -ForegroundColor Green
docker-compose up -d



while ( !((Test-NetConnection localhost -Port 3000).TcpTestSucceeded)) {
    Write-Host "Test connection to grafana continer" -ForegroundColor Green    
}


# Create Datasorces in Grafana
Write-Host "Create Datasorces in Grafana" -ForegroundColor Yellow
$basicAuthValue = @{authorization = 'Basic YWRtaW46YWRtaW4='}

$jsonDataSource = @"
{
    "name": "telegraf",
    "type": "influxdb",
    "access": "direct",
    "url": "http://localhost:8086",
    "database": "telegraf",
    "isDefault": true,
    "basicAuth": false
}
"@

Invoke-WebRequest -Uri "http://localhost:3000/api/datasources" -Method Post -Body $jsonDataSource -Headers $basicAuthValue -ContentType 'application/json'
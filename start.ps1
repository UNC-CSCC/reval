# Set default values
$APP = "rstudio"
$PORT = 8787
$CONTAINER_NAME = "reval"

# Generate a random password if the password file doesn't exist
If (-Not (Test-Path .password)) {
    Write-Output "The .password file doesn't exist. Generating a random password..."
    Set-Content -Path .password -Value ([Convert]::ToBase64String((New-Object System.Security.Cryptography.RNGCryptoServiceProvider).GetBytes(12)))
}

$PASSWORD = Get-Content .password

Function Print-Help {
    Write-Output "Usage: $script:MyInvocation.MyCommand [options] [application]"
    Write-Output ""
    Write-Output "Options:"
    Write-Output "  -h, --help              Show this help message and exit"
    Write-Output "  -p, --port PORT         Set the port number (default: 8787)"
    Write-Output "  -c, --container NAME    Set the container name (default: reval)"
}

# Parse command line arguments
$ErrorActionPreference = "Stop"
$args | ForEach-Object {
    Switch ($_) {
        "-h" { Print-Help; exit }
        "--help" { Print-Help; exit }
        "-p" { $PORT = $args[$args.IndexOf($_) + 1]; $args[$args.IndexOf($_) + 1] = $null; continue }
        "--port" { $PORT = $args[$args.IndexOf($_) + 1]; $args[$args.IndexOf($_) + 1] = $null; continue }
        "-c" { $CONTAINER_NAME = $args[$args.IndexOf($_) + 1]; $args[$args.IndexOf($_) + 1] = $null; continue }
        "--container" { $CONTAINER_NAME = $args[$args.IndexOf($_) + 1]; $args[$args.IndexOf($_) + 1] = $null; continue }
        Default { $_ }
    }
}

Write-Output "Building Docker container $CONTAINER_NAME..."
docker build . --build-arg linux_user_pwd=$PASSWORD -t $CONTAINER_NAME

Write-Output "Launching RStudio in container $CONTAINER_NAME on port $PORT..."
docker run `
       -p "8787:8787" `
       --volume "$(Get-Location):/home/rstudio/work" `
       --hostname val-eng `
       -e PASSWORD="$PASSWORD" `
       --interactive "$CONTAINER_NAME"

Write-Output "The password for Rstudio is: $PASSWORD"
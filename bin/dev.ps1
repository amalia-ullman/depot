# Check if the foreman gem is installed, and install it if not
if (-not (gem list foreman -i --silent)) {
    Write-Output "Installing foreman..."
    gem install foreman
}

# Default to port 3000 if not specified
if (-not $env:PORT) {
    $env:PORT = "3000"
}

# Let the debug gem allow remote connections,
# but avoid loading until `debugger` is called
$env:RUBY_DEBUG_OPEN = "true"
$env:RUBY_DEBUG_LAZY = "true"

# Start the foreman process with the specified Procfile
& foreman start -f Procfile.dev $args

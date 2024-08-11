$parametersPath = "./benchmark.parameters"

if (Test-Path $parametersPath) {
    Get-Content $parametersPath | ForEach-Object {
        # Remove "export " if it exists
        $_ = $_ -replace "^export\s+", ""
        
        # Split into name and value
        $parts = $_ -split "=", 2
        
        if ($parts.Length -eq 2) {
            $name = $parts[0].Trim()
            $value = $parts[1].Trim()
            
            # Set the environment variable
            [System.Environment]::SetEnvironmentVariable($name, $value, [System.EnvironmentVariableTarget]::Process)
        }
    }
} else {
    Write-Error "Parameters file not found: $parametersPath"
    exit 1
}

# Example usage: now you can access these variables in your script
$command = "python -m benchmark.bench load " +
           "--deployment $env:AOAI_DEPLOYMENT " +
           "--rate $env:RATE " +
           "--shape-profile custom " +
           "--context-tokens $env:CONTEXT_TOKENS " +
           "--max-tokens $env:MAX_TOKENS " +
           "--retry $env:RETRY " +
           "$env:AOAI_ENDPOINT " +
           "--duration $env:DURATION " +
           "--output-format jsonl" +
           "--log-save-dir logs/"

# Run the command
Invoke-Expression "$command"

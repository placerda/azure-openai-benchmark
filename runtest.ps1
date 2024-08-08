# Import the parameters file
$parametersPath = "./benchmark.parameters"
if (Test-Path $parametersPath) {
    . $parametersPath
} else {
    Write-Error "Parameters file not found: $parametersPath"
    exit 1
}

# Run the command
$command = "python -m azure-openai-benchmark.benchmark.bench load " +
           "--deployment $AOAI_DEPLOYMENT " +
           "--rate $RATE " +
           "--shape-profile custom " +
           "--context-tokens $CONTEXT_TOKENS " +
           "--max-tokens $MAX_TOKENS " +
           "--retry $RETRY " +
           "$AOAI_ENDPOINT " +
           "--duration $DURATION " +
           "--output-format jsonl"

$errorFilePath = "$TEST_NAME-error.log"
Invoke-Expression "$command | Tee-Object -FilePath $TEST_NAME.log 2> $errorFilePath"
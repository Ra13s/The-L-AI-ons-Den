# Document Review Session Setup Script (PowerShell)
# Creates session folders for document review process

# --- Configuration ---
$SESSIONS_DIR = "sessions"

# --- Helper Functions ---
function Get-NextSessionNumber {
    $lastSessionNum = 0
    if (Test-Path $SESSIONS_DIR -PathType Container) {
        $lastSessionNum = (Get-ChildItem -Path $SESSIONS_DIR -Directory | Where-Object { $_.Name -match '^[0-9]+$' } | Sort-Object { [int]$_.Name } | Select-Object -Last 1).Name
        if (-not $lastSessionNum) {
            $lastSessionNum = 0
        }
    }
    return [int]$lastSessionNum + 1
}

# --- Main Script ---
$SESSION_NUM = Get-NextSessionNumber

$SESSION_DIR = Join-Path $SESSIONS_DIR $SESSION_NUM
$AGENT_RESULTS_DIR = Join-Path $SESSION_DIR "agent_results"

New-Item -ItemType Directory -Force -Path $AGENT_RESULTS_DIR | Out-Null

Write-Host "Created session directory: $SESSION_DIR"
Write-Host "Agent results will be saved to: $AGENT_RESULTS_DIR"
Write-Host "Session number: $SESSION_NUM"

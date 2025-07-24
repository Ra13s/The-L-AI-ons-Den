# Copy document from input/ to current session for safe modification
# Usage: .\copy_to_session.ps1 [session_number] [document_name]

param(
    [Parameter(Mandatory=$true)]
    [string]$SessionNumber,
    
    [Parameter(Mandatory=$true)]
    [string]$DocumentName
)

# Define paths
$InputFile = "input\$DocumentName"
$SessionDir = "sessions\$SessionNumber"
$BackupDir = "$SessionDir\original_backup"
$SessionFile = "$SessionDir\$DocumentName"

# Check if input file exists
if (-not (Test-Path $InputFile)) {
    Write-Error "Error: Input file '$InputFile' not found"
    exit 1
}

# Check if session directory exists
if (-not (Test-Path $SessionDir)) {
    Write-Error "Error: Session directory '$SessionDir' not found"
    Write-Host "Run .\create_session.ps1 first to create the session"
    exit 1
}

# Create backup directory if it doesn't exist
if (-not (Test-Path $BackupDir)) {
    New-Item -ItemType Directory -Path $BackupDir -Force | Out-Null
}

# Copy original to backup (preserve for rollback)
Copy-Item $InputFile "$BackupDir\$DocumentName" -Force
Write-Host "✅ Original backed up to: $BackupDir\$DocumentName" -ForegroundColor Green

# Copy to session directory for modification
Copy-Item $InputFile $SessionFile -Force
Write-Host "✅ Working copy created at: $SessionFile" -ForegroundColor Green

# Show file info
Write-Host ""
Write-Host "📊 Document Info:" -ForegroundColor Cyan
Write-Host "   Original: $InputFile (preserved)" -ForegroundColor White
Write-Host "   Backup:   $BackupDir\$DocumentName (for rollback)" -ForegroundColor White
Write-Host "   Working:  $SessionFile (for modifications)" -ForegroundColor White
Write-Host ""
Write-Host "🔧 Ready for fix application to session copy" -ForegroundColor Yellow
Write-Host "   - Original in input\ is NEVER modified" -ForegroundColor White
Write-Host "   - All changes applied to $SessionFile" -ForegroundColor White
Write-Host "   - Backup available for rollback if needed" -ForegroundColor White
#!/bin/bash

# Copy document from input/ to current session for safe modification
# Usage: ./copy_to_session.sh [session_number] [document_name]

set -e

# Get parameters
SESSION_NUMBER="$1"
DOCUMENT_NAME="$2"

# Validate parameters
if [ -z "$SESSION_NUMBER" ] || [ -z "$DOCUMENT_NAME" ]; then
    echo "Usage: ./copy_to_session.sh [session_number] [document_name]"
    echo "Example: ./copy_to_session.sh 6 meditation.html"
    exit 1
fi

# Define paths
INPUT_FILE="input/$DOCUMENT_NAME"
SESSION_DIR="sessions/$SESSION_NUMBER"
BACKUP_DIR="$SESSION_DIR/original_backup"
SESSION_FILE="$SESSION_DIR/$DOCUMENT_NAME"

# Check if input file exists
if [ ! -f "$INPUT_FILE" ]; then
    echo "Error: Input file '$INPUT_FILE' not found"
    exit 1
fi

# Check if session directory exists
if [ ! -d "$SESSION_DIR" ]; then
    echo "Error: Session directory '$SESSION_DIR' not found"
    echo "Run ./create_session.sh first to create the session"
    exit 1
fi

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Copy original to backup (preserve for rollback)
cp "$INPUT_FILE" "$BACKUP_DIR/$DOCUMENT_NAME"
echo "✅ Original backed up to: $BACKUP_DIR/$DOCUMENT_NAME"

# Copy to session directory for modification
cp "$INPUT_FILE" "$SESSION_FILE"
echo "✅ Working copy created at: $SESSION_FILE"

# Show file info
echo ""
echo "📊 Document Info:"
echo "   Original: $INPUT_FILE (preserved)"
echo "   Backup:   $BACKUP_DIR/$DOCUMENT_NAME (for rollback)"
echo "   Working:  $SESSION_FILE (for modifications)"
echo ""
echo "🔧 Ready for fix application to session copy"
echo "   - Original in input/ is NEVER modified"
echo "   - All changes applied to $SESSION_FILE"
echo "   - Backup available for rollback if needed"
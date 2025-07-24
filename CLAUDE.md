# Claude Code Integration for The L-AI-ons' Den

## Required Reading (In Order)

1. **[README.md](README.md)** - System overview.
2. **[AI-instructions.md](AI-instructions.md)** - Core workflow, file management, and agent logic.
3. **This file** - Claude Code specific instructions.

## Claude Code Specific Workflow

### 🚀 Quick Start

**Review Mode:**

```bash
claude
# Then: "Start document review process"
```

**Fix Application Mode** *(user must request)*:

```bash
# After review is complete:
"Apply fixes to the document in session 6"
```

### Parallel Execution (Review Mode Only)

Claude's key advantage is running reviews in parallel using the `Task` tool. After triaging the document per `AI-instructions.md`, execute the relevant agents simultaneously.

```javascript
// Example for a technical project document - all agents are relevant
Task("Project Manager Review", "Read persona from agents/project_manager.md and review input/doc.pdf. Save to sessions/6/agent_results/project_manager.md")
Task("Architect Review", "Read persona from agents/architect.md and review input/doc.pdf. Save to sessions/6/agent_results/architect.md")
// ... and so on for all other applicable agents in parallel.
```

**⚠️ IMPORTANT**: Parallel execution is ONLY for the review phase.

### Sequential Fix Application (Fix Mode Only)

When applying fixes, you **must** use sequential `Task` calls to avoid file conflicts. Follow the phased implementation plan from `AI-instructions.md`.

```javascript
// Step 1: Safety check (already done by user prompt)
// The system confirms the document has been copied to the session folder.

// Step 2: Apply fixes SEQUENTIALLY to the session copy
Task("Emergency Technical Fixes", "Apply emergency fixes to sessions/6/document.html...")
// Wait for completion, then:
Task("Safety & Legal Additions", "Add disclaimers to sessions/6/document.html...")
// Wait for completion, then:
Task("Grammar & Formatting", "Fix grammar in sessions/6/document.html...")
// ... and so on for each phase.```

## 🛠️ Claude Code Optimization

### Performance Tips
-   Use a single user message with multiple `Task` calls for fast parallel reviews.
-   Use the `Bash` tool for all file and session management as outlined in `AI-instructions.md`.
-   For documents that are too large, use the Gemini integration as a fallback.

### Integration with Gemini
(Needs Gemini MCP)
For very large documents or complex aggregations, Claude can delegate to Gemini.
```bash
"use gemini to act as judge and aggregate findings from @sessions/6/agent_results/"
```

## 🚨 Error Handling in Claude Code

- If one agent `Task` fails, the orchestrator should continue with the remaining agents.
- Note any failures in a session log or the final report.
- Handle file system permission errors gracefully and provide clear user messages.
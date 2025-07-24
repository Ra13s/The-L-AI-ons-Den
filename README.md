# The L-AI-ons' Den 🦁

![A parody of "Daniel in the Lions' Den" by Peter Paul Rubens (c. 1615)](img/in_the_den.jpg)

Welcome to The L-AI-ons' Den, a framework that pits your documents against a panel of ruthless AI "Lions" to make your work stronger. This multi-agent system provides comprehensive analysis from specialized AI perspectives, plus optional automated fix application. It works with Claude Code, Gemini, and other AI platforms.

## 🎯 What This System Does

### Review Mode (Always Available)

- **Analyzes documents** using a dynamic framework of specialized AI agents (the "L-AI-ons").
- **Identifies issues** with complete actionable lists and exact line fixes.
- **Provides scores** using a standardized 10-point scale across all agents.
- **Aggregates findings** into a prioritized final report from the "Head L-AI-on" (the Judge).

### Fix Application Mode (User-Initiated)

- **Preserves originals** by copying documents to session folders.
- **Applies all identified improvements** automatically using AI agents.
- **Validates changes** to ensure technical accuracy and functionality.
- **Documents modifications** with comprehensive before/after reporting.

## 📁 Folder Structure & User Workflow

### Where You Put Things

```
The-L-AI-ons-Den/
├── agents/                 # 🤖 ADD CUSTOM L-AI-ON PERSONAS HERE
│   ├── project_manager.md
│   └── (etc.)
├── input/                  # 📥 DROP YOUR DOCUMENTS HERE TO FACE THE L-AI-ONS
│   ├── document.md         # Recommended: .md, .html, .txt
│   └── project_plan.txt    # See note on supported formats below
├── scripts/                # 🔧 SYSTEM SCRIPTS (used by AI)
└── sessions/               # 🗂️ ALL RESULTS GO HERE (auto-created)
```

### Where You Look for Results

```
sessions/{session_number}/
├── agent_results/          # Individual agent reviews
│   ├── project_manager.md
│   └── (etc. for all agents run)
├── final_report.md         # ⭐ MAIN RESULT - Judge's aggregation
├── original_backup/        # Preserved original (fix mode only)
├── fixes_applied.md        # Implementation log (fix mode only)
└── your_document.html      # Improved version (fix mode only)
```

## ⚙️ Setup & Installation

To run this framework, you need an environment that can interact with a large language model. You can use dedicated command-line tools or an integrated IDE solution like GitHub Copilot.

### Command-Line Tools

These tools are ideal for scripting and automating the review process. Please follow the official guides to install and authenticate at least one.

- **Claude Code (by Anthropic):** An agentic CLI that integrates into your terminal.
  ➡️ **Official Setup Guide:** **[docs.anthropic.com/claude/claude-code](https://docs.anthropic.com/claude/claude-code)**

- **Gemini CLI (by Google):** Brings the Gemini model to your command line.
  ➡️ **Official Getting Started Guide:** **[ai.google.dev/docs/gemini_cli](https://ai.google.dev/docs/gemini_cli/get_started)**

### IDE Integration

As an alternative, you can use an AI agent assistant directly within your code editor to manually orchestrate the review process.

- **GitHub Copilot (powered by OpenAI):** Use Copilot Chat (in agent Mode) within your IDE (like VS Code).
  ➡️ **Official Getting Started Guide:** **[docs.github.com/copilot/getting-started](https://docs.github.com/copilot/getting-started-with-github-copilot)**

## 🚀 Quick Start Guide

### Step 1: Prepare Your Document

1. **Drop document** in the `input/` folder.
2. **(Optional) Add or customize L-AI-ons** in the `agents/` folder.
3. **Name it simply** (avoid spaces or special characters for best compatibility).

> ▶️ **Important Note on Document Formats**:
> For the most reliable results, please use **text-based formats** like `.txt`, `.md`, or `.html`. These formats allow agents to provide accurate, line-by-line feedback.
> 
> Binary formats like `.pdf` and `.docx` are **not yet officially supported**. While some AI platforms (like Gemini) may be able to extract text from them, success is not guaranteed, and features like precise line numbering may fail. Full support for these formats is planned for a future update.

### Step 2: Choose Your AI Platform & Start Review

- **Claude Code**: Run `claude`, then say `"Start document review process"`
- **Gemini CLI**: Run `gemini`, then use `"Start document review process"`

### Step 3: Get Your Results

- **Main result**: `sessions/{session_number}/final_report.md`
- **Detailed findings**: Individual agent files in `agent_results/`
- **All results**: Everything stored in your session folder.

### Step 4: Apply Fixes (Optional)

**Only if you want the system to automatically implement the improvements:**

- **Claude Code**: Say `"Apply fixes to session copy"` after review is complete.
- **Other platforms**: Follow platform-specific fix application guidance.
- **Result**: An improved document in your session folder with a full implementation report.

## 🤖 The L-AI-ons (The AI Agents)

This system uses a dynamic agent framework. The AI discovers and runs a review for every `.md` persona file found in the `/agents` directory. It ships with a default pack of six core agents—our founding L-AI-ons.

### Default Agent Pack

| L-AI-on                 | Focus Area                                             | When It Applies          | What You Get                                        |
| ----------------------- | ------------------------------------------------------ | ------------------------ | --------------------------------------------------- |
| **🏗️ Project Manager** | Structure, timelines, deliverables, risk management    | Project documents only   | PM gaps, milestone systems, action plans            |
| **🔧 Architect**        | Technical design, system architecture, dependencies    | Technical documents only | Structural flaws, validation gates, security issues |
| **📝 Grammar Nazi**     | Grammar, punctuation, style, professional presentation | All text documents       | Complete error list with exact line fixes           |
| **👥 Readability Guru** | Clarity, accessibility, comprehension barriers         | All text documents       | Simplified versions of complex sentences            |
| **🔍 Bad Cop**          | Critical flaws, risks, standards violations            | All text documents       | Fatal flaws with evidence and mandatory fixes       |
| **✅ Good Cop**          | Strengths, opportunities, enhancement potential        | All text documents       | Document strengths with leverage strategies         |

### For Advanced Users: Creating Custom L-AI-ons

You can extend the system by creating your own agent personas.

1. **Create a new `.md` file** in the `/agents` directory (e.g., `agents/seo_specialist.md`).
2. **Define the L-AI-on's persona** inside the file, including its `Focus` and `Applicability`. The system will automatically discover and run it.

**Example Custom Agent: `agents/seo_specialist.md`**

```markdown
# Persona: SEO Specialist

## Focus
Analyze the document for Search Engine Optimization (SEO) effectiveness. Key areas of focus include keyword density, title tags, meta descriptions, internal linking structure, and mobile-friendliness.

## Applicability
This review is only applicable to web content (HTML files, web-focused articles). For other document types like academic papers or project plans, respond with "SEO Specialist review not applicable."
```

## 📊 Understanding Your Scores

### Individual Agent Scores (All use 1-10 scale)

- **10-8**: 🟢 Excellent - Ready to go
- **7-6**: 🟡 Good - Minor improvements needed
- **5-4**: 🟠 Acceptable - Fix high-priority issues first
- **3-2**: 🔴 Needs Work - Significant revision required
- **1-0**: ❌ Unacceptable - Major restructuring needed

### Judge's Final Assessment

The final report includes a weighted composite score and clear recommendation:

- **PROCEED**: Document is ready for intended use.
- **IMPROVE FIRST**: Fix critical issues before proceeding.
- **MAJOR REVISION**: Substantial work needed before use.

## ⚙️ AI Platform Integration

| Platform            | Strengths                                       | Best For                              |
| ------------------- | ----------------------------------------------- | ------------------------------------- |
| **Claude Code**     | Built-in file system access, parallel Task tool | General documents, fastest processing |
| **Gemini CLI**      | Massive context window, `@` file syntax         | Very large documents (>100 pages)     |
| **Manual/Other AI** | Full control, custom combinations               | Specialized review needs              |

### Platform-Specific Instructions

- **Claude Code**: See [CLAUDE.md](CLAUDE.md) for complete setup and usage.
- **Gemini**: See [GEMINI.md](GEMINI.md) for CLI syntax and workflows.
- **Common guidance**: See [AI-instructions.md](AI-instructions.md) for shared patterns.

---

*The L-AI-ons' Den | A Multi-Agent Review Framework | For platform-specific setup, see CLAUDE.md and GEMINI.md*
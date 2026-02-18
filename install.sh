#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
CLAUDE_SKILL_DIR="$HOME/.claude/skills/scientific-illustrations"
CLAUDE_AGENT_DIR="$HOME/.claude/agents"
CODEX_SKILL_DIR="$HOME/.agents/skills/scientific-illustrations"

echo "Installing scientific-illustrations skill from: $REPO_DIR"

# Create target directories
mkdir -p "$CLAUDE_SKILL_DIR/references"
mkdir -p "$CLAUDE_AGENT_DIR"
mkdir -p "$CODEX_SKILL_DIR/references"

# Copy skill files for Claude
cp "$REPO_DIR/skill/SKILL.md" "$CLAUDE_SKILL_DIR/SKILL.md"
cp "$REPO_DIR/skill/references/agent-prompts.md" "$CLAUDE_SKILL_DIR/references/agent-prompts.md"
cp "$REPO_DIR/skill/references/style-guide.md" "$CLAUDE_SKILL_DIR/references/style-guide.md"

# Copy skill files for Codex
cp "$REPO_DIR/skill/SKILL.md" "$CODEX_SKILL_DIR/SKILL.md"
cp "$REPO_DIR/skill/references/agent-prompts.md" "$CODEX_SKILL_DIR/references/agent-prompts.md"
cp "$REPO_DIR/skill/references/style-guide.md" "$CODEX_SKILL_DIR/references/style-guide.md"

# Copy orchestrator agent
cp "$REPO_DIR/agents/scientific-illustrations-orchestrator.md" "$CLAUDE_AGENT_DIR/scientific-illustrations-orchestrator.md"

echo ""
echo "Installed to (Claude):"
echo "  $CLAUDE_SKILL_DIR/SKILL.md"
echo "  $CLAUDE_SKILL_DIR/references/agent-prompts.md"
echo "  $CLAUDE_SKILL_DIR/references/style-guide.md"
echo "  $CLAUDE_AGENT_DIR/scientific-illustrations-orchestrator.md"
echo ""
echo "Installed to (Codex):"
echo "  $CODEX_SKILL_DIR/SKILL.md"
echo "  $CODEX_SKILL_DIR/references/agent-prompts.md"
echo "  $CODEX_SKILL_DIR/references/style-guide.md"
echo ""
echo "Prerequisites (manual):"
echo "  1. Required for image generation: add GEMINI_API_KEY to ~/.secrets"
echo "  2. Install nanobanana: gemini extensions install https://github.com/gemini-cli-extensions/nanobanana"
echo "  3. Set image model: export NANOBANANA_MODEL=gemini-3-pro-image-preview"
echo "  4. Optional OpenRouter for text-model routing:"
echo "     export OPENROUTER_API_KEY=your-key"
echo "     export OPENROUTER_MODEL=google/gemini-2.5-pro"
echo "     (OpenRouter does not replace GEMINI_API_KEY for nanobanana image generation.)"

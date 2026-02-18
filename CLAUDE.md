# CLAUDE.md
<!-- Inherits ~/.claude/CLAUDE.md -->

## Project
**scientific-illustrations**: Automated academic illustration generation using the PaperBanana agentic workflow.
**Stack**: Claude Code (orchestration), Gemini CLI + nanobanana (image generation), Python/matplotlib (statistical plots)

## Skill
Source files live in `skill/`. Run `./install.sh` to deploy to `~/.claude/skills/`, `~/.claude/agents/`, and `~/.agents/skills/` (Codex skill install).

Invoke with `/scientific-illustrations` or use the `scientific-illustrations-orchestrator` agent for the full pipeline.

## Workflow

1. Provide a methodology section (S) and figure caption (C)
2. The pipeline runs: Planner -> Stylist -> Visualizer <-> Critic (3 rounds)
3. Canonical demo output is in `./output/example-01/`
4. Project-specific runs should be kept in `./projects/output/<job-name>/`

## Commands
```bash
source ~/.secrets                    # Load API keys
gemini extensions list               # Verify nanobanana
export NANOBANANA_MODEL=gemini-3-pro-image-preview  # Best quality model
export OPENROUTER_MODEL=google/gemini-2.5-pro       # Optional text-model routing
```

## Structure
```
agents/                              # Agent source (deploy via install.sh)
├── scientific-illustrations-orchestrator.md
skill/                               # Skill source (deploy via install.sh)
├── SKILL.md                         # Skill definition
└── references/                      # Agent prompts + style guide
docs/
├── paperbanana.md                   # Source paper (Zhu et al., 2026)
examples/
├── example-01-prompt.json           # Canonical reusable example prompt
output/
├── example-01/                      # Canonical sample output kept in repo
projects/
├── prompts/                         # Project-specific prompts (gitignored)
└── output/                          # Project-specific output (gitignored)
```

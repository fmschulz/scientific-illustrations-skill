# AGENTS.md

## Project
**scientific-illustrations**: Automated academic illustration generation using the PaperBanana-style multi-agent workflow.
**Stack**: Claude Code orchestration, Gemini CLI + nanobanana for diagrams, Python/matplotlib for plots.

## Definitions
- Skill definition lives in `skill/SKILL.md`
- Orchestrator agent definition lives in `agents/scientific-illustrations-orchestrator.md`
- Run `./install.sh` to deploy to `~/.claude/` (Claude) and `~/.agents/skills/` (Codex)

## Workflow
1. Provide source context (S) and figure caption (C).
2. Pipeline executes Planner -> Stylist -> Visualizer <-> Critic (up to 3 rounds).
3. Keep canonical demo artifacts in `examples/` and `output/example-01/`.
4. Keep project-specific prompts and outputs in `projects/` only.

## Commands
```bash
source ~/.secrets
gemini extensions list | grep nanobanana
export NANOBANANA_MODEL=gemini-3-pro-image-preview
export OPENROUTER_MODEL=google/gemini-2.5-pro       # Optional
```

`GEMINI_API_KEY` is still required for nanobanana image generation.

## Structure
```text
agents/
  scientific-illustrations-orchestrator.md
skill/
  SKILL.md
  references/
examples/
  example-01-prompt.json
output/
  example-01/
projects/
  prompts/
  output/
```

# Scientific Illustrations

Automated generation of publication-ready academic illustrations using the PaperBanana workflow (Planner -> Stylist -> Visualizer <-> Critic).

## What Is Defined Here

- Skill definition: `skill/SKILL.md`
- Orchestrator agent definition: `agents/scientific-illustrations-orchestrator.md`
- Agent prompts + style guide: `skill/references/`
- Repository guidance files: `AGENTS.md` and `CLAUDE.md` (these are instructions, not subagent/skill definition files)

## Repository Layout

```text
agents/
  scientific-illustrations-orchestrator.md
skill/
  SKILL.md
  references/
docs/
  paperbanana.md
examples/
  example-01-prompt.json
output/
  example-01/                         # Canonical sample output kept in repo
projects/                             # Project-specific prompts + outputs (gitignored)
  prompts/
  output/
install.sh
CLAUDE.md
AGENTS.md
```

## Setup

1. Install the local files:
```bash
./install.sh
```
This installs:
- Claude skill to `~/.claude/skills/scientific-illustrations/`
- Claude agent to `~/.claude/agents/scientific-illustrations-orchestrator.md`
- Codex skill to `~/.agents/skills/scientific-illustrations/`

2. Configure secrets:
```bash
echo 'export GEMINI_API_KEY="your-key"' >> ~/.secrets
echo 'export OPENROUTER_API_KEY="your-key"' >> ~/.secrets  # Optional
source ~/.secrets
```

3. Install nanobanana:
```bash
gemini extensions install https://github.com/gemini-cli-extensions/nanobanana
gemini extensions list | grep nanobanana
```

4. Select model:
```bash
export NANOBANANA_MODEL=gemini-3-pro-image-preview
export OPENROUTER_MODEL=google/gemini-2.5-pro       # Optional
```

Notes:
- `GEMINI_API_KEY` is required for nanobanana image generation.
- `OPENROUTER_API_KEY` is optional and only used if your local orchestration routes text-model calls through OpenRouter.

## Usage

- Skill entrypoint: `/scientific-illustrations`
- Agent entrypoint: `scientific-illustrations-orchestrator`

Provide:
- Source context (methodology text)
- Figure caption
- Optional job name

By default, new run artifacts should be written to `projects/output/<job-name>/`.

## Prompt/Output Policy

- Keep reusable example material in `examples/`.
- Keep project-specific material in `projects/` (ignored by git).
- Keep only canonical demo output in `output/example-01/`.
- New project outputs should go under `projects/output/`.

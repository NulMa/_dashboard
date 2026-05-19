import anthropic
import os
import sys

client = anthropic.Anthropic()
prompt = open(os.environ["PROMPT_FILE"], encoding="utf-8").read()
model = os.environ.get("CLAUDE_MODEL", "claude-sonnet-4-6")

msg = client.messages.create(
    model=model,
    max_tokens=8192,
    messages=[{"role": "user", "content": prompt}],
)
sys.stdout.write(msg.content[0].text)

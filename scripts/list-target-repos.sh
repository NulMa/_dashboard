#!/usr/bin/env bash
#
# list-target-repos.sh
#
# db/projects.json 에서 enabled:true 인 repo 목록을 JSON 배열로 stdout 에 출력.
#
# GitHub Actions 에서 matrix 주입에 쓰인다:
#   repos: ${{ fromJSON(steps.list.outputs.repos) }}
#
# 환경 변수:
#   GH_TOKEN            (필수) — gh CLI 인증 토큰
#   GH_CMD              (선택) — 테스트용 gh 실행 경로 override. 기본 "gh".
#   PROJECTS_PATH       (선택) — db/projects.json 경로 override.
#
# 사용 예:
#   GH_TOKEN=$(gh auth token) bash scripts/list-target-repos.sh
#   # → ["Ghost_March"]

set -euo pipefail

: "${GH_TOKEN:?GH_TOKEN env required}"

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
PROJECTS_PATH="${PROJECTS_PATH:-$ROOT_DIR/db/projects.json}"

if [[ ! -f "$PROJECTS_PATH" ]]; then
  echo "[]"
  exit 0
fi

jq -c '[.[] | select(.enabled == true) | .name]' "$PROJECTS_PATH"

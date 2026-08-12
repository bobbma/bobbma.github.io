#!/usr/bin/env bash
set -euo pipefail

source_dir="assets/papers/source"
thumb_dir="assets/papers/thumbs"
mkdir -p "$thumb_dir"

render_thumb() {
  local source="$1"
  local output="$2"
  local page="${3:-1}"
  local crop="${4:-1200x750+100+130}"
  local temp
  temp="$(mktemp -d)"
  pdftoppm -f "$page" -singlefile -r 82 -jpeg -jpegopt quality=82 "$source_dir/$source" "$temp/page" >/dev/null 2>&1
  convert "$temp/page.jpg" -gravity North -crop "$crop" +repage -resize '600x375^' -gravity center -extent 600x375 -strip -quality 78 "$thumb_dir/$output"
  rm -rf "$temp"
}

render_thumb "2602.10825.pdf" "flow-cache.webp"
render_thumb "2403.12544.pdf" "affinequant.webp"
render_thumb "oscillation.pdf" "oscillation.webp"
render_thumb "ompq.pdf" "ompq.webp"
render_thumb "boundary-value.pdf" "boundary-value.webp"
render_thumb "itpruner.pdf" "itpruner.webp"
render_thumb "motion-cache.pdf" "motion-cache.webp"
render_thumb "mllm-orchestration.pdf" "mllm-orchestration.webp"
render_thumb "a2rbench.pdf" "a2rbench.webp"
render_thumb "2510.26527.pdf" "polybasic.webp"
render_thumb "moe-quant.pdf" "moe-quant.webp"

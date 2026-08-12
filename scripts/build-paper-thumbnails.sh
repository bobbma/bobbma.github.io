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
render_thumb "boundary-value.pdf" "boundary-value.webp"
render_thumb "2510.26527.pdf" "polybasic.webp"

# Prefer original overview/framework artwork from arXiv source packages when available.
# Source packages remain ignored; only optimized WebP thumbnails ship to Pages.
render_source_figure() {
  local source="$1"
  local output="$2"
  local temp
  temp="$(mktemp -d)"
  pdftoppm -singlefile -r 180 -png "$source" "$temp/page" >/dev/null 2>&1
  convert "$temp/page.png" -bordercolor white -border 1 -fuzz 4% -trim +repage \
    -resize '600x375^' -gravity center -extent 600x375 -strip -quality 82 "$thumb_dir/$output"
  rm -rf "$temp"
}

render_source_figure "assets/papers/arxiv-source/2108.08532/frameworkV3.pdf" "itpruner.webp"
render_source_figure "assets/papers/arxiv-source/2109.07865/overview.pdf" "ompq.webp"
render_source_figure "assets/papers/arxiv-source/2303.11906/overview.pdf" "oscillation.webp"
render_source_figure "assets/papers/arxiv-source/2403.12544/transformation.pdf" "affinequant.webp"
render_source_figure "assets/papers/arxiv-source/2508.10016/content/figures/fig_pipline.pdf" "mllm-orchestration.webp"
render_source_figure "assets/papers/arxiv-source/2510.26527/imgs/framework.pdf" "polybasic.webp"
render_source_figure "assets/papers/arxiv-source/2602.10825/method.pdf" "flow-cache.webp"
render_source_figure "assets/papers/arxiv-source/2605.01725/figs/frame_chaneg_cropped.pdf" "motion-cache.webp"
render_source_figure "assets/papers/arxiv-source/2605.17278/pic/pipeline0128.pdf" "a2rbench.webp"
render_source_figure "assets/papers/arxiv-source/outlier-aware/max_final_loss_relation.pdf" "outlier-slicing.webp"

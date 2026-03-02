#!/bin/bash
# Copy 12 hostel-to-mines images from Cursor assets into this project's assets folder.
set -e
CURSOR_ASSETS="/Users/jillsander/.cursor/projects/Users-jillsander-Desktop-e-commerce-photo-project/assets"
REPO_ASSETS="$(cd "$(dirname "$0")" && pwd)/assets"
mkdir -p "$REPO_ASSETS"
for name in 1-sleeping-crowded-hostel 2-dream-mining-money 3-dream-flying-holiday 4-wake-dirty-hostel 5-hostel-kitchen-cooking 6-applying-for-jobs 7-all-rejected 8-farm-picking-fruits 9-bank-balance-up 10-rigging-course 11-high-risk-license 12-working-mines-rigger; do
  if [ -f "$CURSOR_ASSETS/${name}.png" ]; then
    cp "$CURSOR_ASSETS/${name}.png" "$REPO_ASSETS/${name}.png"
    echo "Copied ${name}.png"
  fi
done
echo "Done. Images in $REPO_ASSETS: $(ls "$REPO_ASSETS" 2>/dev/null | wc -l)"

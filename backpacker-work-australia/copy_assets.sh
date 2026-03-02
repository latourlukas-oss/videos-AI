#!/bin/bash
# Copy 5 backpacker-work images from Cursor assets into this project's assets folder.
set -e
CURSOR_ASSETS="/Users/jillsander/.cursor/projects/Users-jillsander-Desktop-e-commerce-photo-project/assets"
REPO_ASSETS="$(cd "$(dirname "$0")" && pwd)/assets"
mkdir -p "$REPO_ASSETS"
for name in 1-kitchen-work 2-waiter-restaurant 3-farm-picking-mangoes 4-tractor-seeding-canola 5-construction-labourer; do
  if [ -f "$CURSOR_ASSETS/${name}.png" ]; then
    cp "$CURSOR_ASSETS/${name}.png" "$REPO_ASSETS/${name}.png"
    echo "Copied ${name}.png"
  fi
done
echo "Done. Images in $REPO_ASSETS: $(ls "$REPO_ASSETS" 2>/dev/null | wc -l)"

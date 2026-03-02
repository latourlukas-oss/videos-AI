#!/bin/bash
# Copy 6 female-backpacker images from Cursor assets into this project's assets folder.
set -e
CURSOR_ASSETS="/Users/jillsander/.cursor/projects/Users-jillsander-Desktop-e-commerce-photo-project/assets"
REPO_ASSETS="$(cd "$(dirname "$0")" && pwd)/assets"
mkdir -p "$REPO_ASSETS"
for name in 1-flying-passport 2-arrives-airport-luggage 3-facebook-accommodation 4-comments-free-stays 5-creepy-house-kitchen 6-sharehouse-good-time; do
  if [ -f "$CURSOR_ASSETS/${name}.png" ]; then
    cp "$CURSOR_ASSETS/${name}.png" "$REPO_ASSETS/${name}.png"
    echo "Copied ${name}.png"
  fi
done
echo "Done. Images in $REPO_ASSETS: $(ls "$REPO_ASSETS" 2>/dev/null | wc -l)"

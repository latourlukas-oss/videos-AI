#!/bin/bash
# Copy images from Cursor assets to repo assets, then build video.
set -e
CURSOR_ASSETS="/Users/jillsander/.cursor/projects/Users-jillsander-Desktop-e-commerce-photo-project/assets"
REPO_ASSETS="$(cd "$(dirname "$0")" && pwd)/assets"
mkdir -p "$REPO_ASSETS"
for name in 1-flying-to-australia 2-hostel-party 3-checking-bank-balance 4-applying-for-jobs 5-flying-home; do
  if [ -f "$CURSOR_ASSETS/${name}.png" ]; then
    cp "$CURSOR_ASSETS/${name}.png" "$REPO_ASSETS/${name}.png"
    echo "Copied ${name}.png"
  fi
done
echo "Images in assets: $(ls "$REPO_ASSETS" 2>/dev/null | tr '\n' ' ')"
if command -v ffmpeg >/dev/null 2>&1; then
  echo "Building video with ffmpeg..."
  "$(dirname "$0")/make_slideshow_movie.sh"
  echo "Done. Output: $(dirname "$0")/backpacker_australia_slideshow.mp4"
else
  echo "ffmpeg not found. Try: python3 -m venv .venv && source .venv/bin/activate && pip install -r requirements-slideshow.txt && python slideshow.py"
fi

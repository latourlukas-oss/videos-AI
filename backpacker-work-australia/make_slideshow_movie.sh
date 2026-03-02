#!/usr/bin/env bash
# Backpacker Work Australia – 5-image slideshow. Needs: ffmpeg, curl. Run from this directory.
set -e
DIR="$(cd "$(dirname "$0")" && pwd)"
ASSETS="$DIR/assets"
OUTPUT="$DIR/backpacker_work_australia_slideshow.mp4"
CACHE="$DIR/music_cache"
MUSIC_URL="https://www.free-stock-music.com/music/savfk/mp3/savfk-hourglass.mp3"
MUSIC_FILE="$CACHE/savfk-hourglass.mp3"
DURATION=5
TOTAL=25

mkdir -p "$CACHE"
if [[ ! -f "$MUSIC_FILE" ]]; then
  echo "Downloading music..."
  curl -sL -o "$MUSIC_FILE" "$MUSIC_URL"
fi

echo "Creating movie..."
ffmpeg -y \
  -loop 1 -t $DURATION -i "$ASSETS/1-kitchen-work.png" \
  -loop 1 -t $DURATION -i "$ASSETS/2-waiter-restaurant.png" \
  -loop 1 -t $DURATION -i "$ASSETS/3-farm-picking-mangoes.png" \
  -loop 1 -t $DURATION -i "$ASSETS/4-tractor-seeding-canola.png" \
  -loop 1 -t $DURATION -i "$ASSETS/5-construction-labourer.png" \
  -i "$MUSIC_FILE" \
  -filter_complex "[0:v][1:v][2:v][3:v][4:v]concat=n=5:v=1:a=0[outv];[5:a]atrim=0:${TOTAL},afade=t=out:st=$((TOTAL-2)):d=2[outa]" \
  -map "[outv]" -map "[outa]" \
  -c:v libx264 -c:a aac -shortest -r 24 -pix_fmt yuv420p \
  "$OUTPUT"

echo "Movie saved to: $OUTPUT"

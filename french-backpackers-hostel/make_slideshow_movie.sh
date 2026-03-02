#!/usr/bin/env bash
# French Backpackers Hostel – 4-image slideshow. Needs: ffmpeg, curl. Run from this directory.
set -e
DIR="$(cd "$(dirname "$0")" && pwd)"
ASSETS="$DIR/assets"
OUTPUT="$DIR/french_backpackers_hostel_slideshow.mp4"
CACHE="$DIR/music_cache"
MUSIC_URL="https://www.free-stock-music.com/music/savfk/mp3/savfk-hourglass.mp3"
MUSIC_FILE="$CACHE/savfk-hourglass.mp3"
DURATION=5
TOTAL=20

mkdir -p "$CACHE"
if [[ ! -f "$MUSIC_FILE" ]]; then
  echo "Downloading music..."
  curl -sL -o "$MUSIC_FILE" "$MUSIC_URL"
fi

echo "Creating movie..."
ffmpeg -y \
  -loop 1 -t $DURATION -i "$ASSETS/1-eat-together.png" \
  -loop 1 -t $DURATION -i "$ASSETS/2-drink-speak-french.png" \
  -loop 1 -t $DURATION -i "$ASSETS/3-apply-jobs-together.png" \
  -loop 1 -t $DURATION -i "$ASSETS/4-party-club-together.png" \
  -i "$MUSIC_FILE" \
  -filter_complex "[0:v][1:v][2:v][3:v]concat=n=4:v=1:a=0[outv];[4:a]atrim=0:${TOTAL},afade=t=out:st=$((TOTAL-2)):d=2[outa]" \
  -map "[outv]" -map "[outa]" \
  -c:v libx264 -c:a aac -shortest -r 24 -pix_fmt yuv420p \
  "$OUTPUT"

echo "Movie saved to: $OUTPUT"

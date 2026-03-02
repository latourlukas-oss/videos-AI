#!/usr/bin/env bash
# Hostel to Mines – 12-image slideshow. Needs: ffmpeg, curl. Run from this directory.
set -e
DIR="$(cd "$(dirname "$0")" && pwd)"
ASSETS="$DIR/assets"
OUTPUT="$DIR/hostel_to_mines_slideshow.mp4"
CACHE="$DIR/music_cache"
MUSIC_URL="https://www.free-stock-music.com/music/savfk/mp3/savfk-hourglass.mp3"
MUSIC_FILE="$CACHE/savfk-hourglass.mp3"
DURATION=4
TOTAL=$((12 * DURATION))  # 48 seconds

mkdir -p "$CACHE"
if [[ ! -f "$MUSIC_FILE" ]]; then
  echo "Downloading music..."
  curl -sL -o "$MUSIC_FILE" "$MUSIC_URL"
fi

echo "Creating movie..."
ffmpeg -y \
  -loop 1 -t $DURATION -i "$ASSETS/1-sleeping-crowded-hostel.png" \
  -loop 1 -t $DURATION -i "$ASSETS/2-dream-mining-money.png" \
  -loop 1 -t $DURATION -i "$ASSETS/3-dream-flying-holiday.png" \
  -loop 1 -t $DURATION -i "$ASSETS/4-wake-dirty-hostel.png" \
  -loop 1 -t $DURATION -i "$ASSETS/5-hostel-kitchen-cooking.png" \
  -loop 1 -t $DURATION -i "$ASSETS/6-applying-for-jobs.png" \
  -loop 1 -t $DURATION -i "$ASSETS/7-all-rejected.png" \
  -loop 1 -t $DURATION -i "$ASSETS/8-farm-picking-fruits.png" \
  -loop 1 -t $DURATION -i "$ASSETS/9-bank-balance-up.png" \
  -loop 1 -t $DURATION -i "$ASSETS/10-rigging-course.png" \
  -loop 1 -t $DURATION -i "$ASSETS/11-high-risk-license.png" \
  -loop 1 -t $DURATION -i "$ASSETS/12-working-mines-rigger.png" \
  -i "$MUSIC_FILE" \
  -filter_complex "[0:v][1:v][2:v][3:v][4:v][5:v][6:v][7:v][8:v][9:v][10:v][11:v]concat=n=12:v=1:a=0[outv];[12:a]atrim=0:${TOTAL},afade=t=out:st=$((TOTAL-2)):d=2[outa]" \
  -map "[outv]" -map "[outa]" \
  -c:v libx264 -c:a aac -shortest -r 24 -pix_fmt yuv420p \
  "$OUTPUT"

echo "Movie saved to: $OUTPUT"

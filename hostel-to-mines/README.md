# Hostel to Mines

12-image slideshow: same person – from sleeping in a crowded hostel and dreaming of mining money and holidays, to waking in a dirty hostel, cooking in a cramped kitchen, job rejections, farm work, saving up, rigging course, high-risk license, and finally working in the mines as a rigger.

## Story (12 scenes)

1. Sleeping in a crowded hostel, starts dreaming  
2. Dream: working in Australian mining, earning good money  
3. Dream: flying overseas for a nice holiday  
4. Wakes up in a dirty crowded hostel  
5. Crowded hostel kitchen, almost no space, trying to cook  
6. Applies for jobs  
7. All job applications rejected  
8. Works on a farm picking fruit in Australia under harsh conditions  
9. Bank balance is up, sitting at computer  
10. Does a rigging course at a training centre  
11. Receives high-risk working license  
12. Starts working in the mines as a rigger  

## Option A – Python (recommended)

```bash
cd hostel-to-mines
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements-slideshow.txt
python slideshow.py
```

Output: `hostel_to_mines_slideshow.mp4`

## Option B – ffmpeg

Requires [ffmpeg](https://ffmpeg.org/) and the 12 images in `assets/`:

```bash
cd hostel-to-mines
./make_slideshow_movie.sh
```

## Assets

Place these 12 images in `assets/`:

- `1-sleeping-crowded-hostel.png`
- `2-dream-mining-money.png`
- `3-dream-flying-holiday.png`
- `4-wake-dirty-hostel.png`
- `5-hostel-kitchen-cooking.png`
- `6-applying-for-jobs.png`
- `7-all-rejected.png`
- `8-farm-picking-fruits.png`
- `9-bank-balance-up.png`
- `10-rigging-course.png`
- `11-high-risk-license.png`
- `12-working-mines-rigger.png`

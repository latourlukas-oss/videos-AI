# Female Backpacker in Australia

6-image slideshow: a young female backpacker flies to Australia, arrives at the airport with luggage, searches for accommodation on Facebook, sees comments from strangers offering free stays, ends up in an uncomfortable house situation, then finds a friendly sharehouse with other backpackers and has a good time.

## Story (6 scenes)

1. Flying to Australia, passport visible on the plane  
2. Arrives at the airport with luggage, casual travel clothes  
3. Looking for accommodation on Facebook, making posts  
4. Comments on her post from strangers offering free accommodation  
5. In a house with an older man, uneasy in the kitchen  
6. In a sharehouse with backpackers, having a good time  

## Option A – Python (recommended)

```bash
cd female-backpacker-australia
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements-slideshow.txt
python slideshow.py
```

Output: `female_backpacker_australia_slideshow.mp4`

## Option B – ffmpeg

Requires [ffmpeg](https://ffmpeg.org/) and the 6 images in `assets/`:

```bash
cd female-backpacker-australia
./make_slideshow_movie.sh
```

## Assets

Place these 6 images in `assets/`:

- `1-flying-passport.png`
- `2-arrives-airport-luggage.png`
- `3-facebook-accommodation.png`
- `4-comments-free-stays.png`
- `5-creepy-house-kitchen.png`
- `6-sharehouse-good-time.png`

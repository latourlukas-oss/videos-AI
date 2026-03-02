# French Backpackers – Always Together

4-image slideshow: the same group of young French backpackers always staying together in a hostel – eating together, drinking and speaking French, applying for the same jobs together, and partying in the club as a group.

## Story (4 scenes)

1. They sit and eat together  
2. They drink together, only speak French, hang out together – same group, very young  
3. They apply for the same jobs together  
4. They party together in the club and always stick together  

## Option A – Python (recommended)

```bash
cd french-backpackers-hostel
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements-slideshow.txt
python slideshow.py
```

Output: `french_backpackers_hostel_slideshow.mp4`

## Option B – ffmpeg

Requires [ffmpeg](https://ffmpeg.org/) and the 4 images in `assets/`:

```bash
cd french-backpackers-hostel
./make_slideshow_movie.sh
```

## Assets

- `1-eat-together.png`
- `2-drink-speak-french.png`
- `3-apply-jobs-together.png`
- `4-party-club-together.png`

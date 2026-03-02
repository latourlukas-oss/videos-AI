# Backpacker Work Journey (Australia)

5-image slideshow: the same guy from the previous videos working different jobs in Australia – kitchen, restaurant waiter, farm picking mangoes, tractor driver during canola seeding, and construction labourer.

## Story (5 scenes)

1. Working in a kitchen  
2. Waiter in a restaurant  
3. Farm work picking mangoes  
4. Driving a tractor during seeding season in Australia – seeder bar, canola on a vast paddock  
5. Construction labourer  

## Option A – Python (recommended)

```bash
cd backpacker-work-australia
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements-slideshow.txt
python slideshow.py
```

Output: `backpacker_work_australia_slideshow.mp4`

## Option B – ffmpeg

Requires [ffmpeg](https://ffmpeg.org/) and the 5 images in `assets/`:

```bash
cd backpacker-work-australia
./make_slideshow_movie.sh
```

## Assets

- `1-kitchen-work.png`
- `2-waiter-restaurant.png`
- `3-farm-picking-mangoes.png`
- `4-tractor-seeding-canola.png`
- `5-construction-labourer.png`

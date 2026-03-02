"""
Female Backpacker in Australia – 6-image slideshow. Optional music.
"""

import urllib.request
from pathlib import Path

from moviepy.editor import (
    AudioFileClip,
    ImageSequenceClip,
    concatenate_videoclips,
)

ASSETS = Path(__file__).resolve().parent / "assets"
OUTPUT = Path(__file__).resolve().parent / "female_backpacker_australia_slideshow.mp4"
MUSIC_CACHE = Path(__file__).resolve().parent / "music_cache"
MUSIC_URL = "https://www.free-stock-music.com/music/savfk/mp3/savfk-hourglass.mp3"
MUSIC_FILE = MUSIC_CACHE / "savfk-hourglass.mp3"

IMAGE_NAMES = [
    "1-flying-passport.png",
    "2-arrives-airport-luggage.png",
    "3-facebook-accommodation.png",
    "4-comments-free-stays.png",
    "5-creepy-house-kitchen.png",
    "6-sharehouse-good-time.png",
]
DURATION_PER_IMAGE = 5  # 30 seconds total


def ensure_music():
    MUSIC_CACHE.mkdir(exist_ok=True)
    if MUSIC_FILE.exists() and MUSIC_FILE.stat().st_size > 10000:
        return str(MUSIC_FILE)
    print("Downloading music...")
    try:
        req = urllib.request.Request(MUSIC_URL, headers={"User-Agent": "Mozilla/5.0"})
        with urllib.request.urlopen(req) as resp:
            MUSIC_FILE.write_bytes(resp.read())
        return str(MUSIC_FILE)
    except Exception as e:
        print(f"Could not download music: {e}")
        return None


def main():
    image_paths = [str(ASSETS / name) for name in IMAGE_NAMES]
    for p in image_paths:
        if not Path(p).exists():
            raise FileNotFoundError(f"Image not found: {p}")

    clips = []
    for path in image_paths:
        clip = ImageSequenceClip([path], durations=[DURATION_PER_IMAGE])
        clips.append(clip)

    video = concatenate_videoclips(clips, method="compose")
    duration = video.duration

    music_path = ensure_music()
    if music_path:
        try:
            audio = AudioFileClip(music_path)
            if audio.duration > duration:
                audio = audio.subclip(0, duration)
            else:
                from moviepy.audio.AudioClip import concatenate_audioclips
                n_loops = int(duration / audio.duration) + 1
                audio = concatenate_audioclips([audio] * n_loops).subclip(0, duration)
            audio = audio.audio_fadeout(2.0)
            video = video.set_audio(audio)
        except Exception as e:
            print("Skipping audio:", e)
            music_path = None

    video.write_videofile(
        str(OUTPUT),
        fps=24,
        codec="libx264",
        audio_codec="aac" if music_path else None,
        audio=bool(music_path),
        verbose=False,
        logger=None,
    )
    video.close()
    if music_path:
        audio.close()
    print(f"Movie saved to: {OUTPUT}")


if __name__ == "__main__":
    main()

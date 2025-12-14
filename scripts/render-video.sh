#!/bin/bash
set -e

VOICE="voice.mp3"
SUB="subtitle.txt"
OUT="output.mp4"

BG=$(ls public/videos/*.mp4 | shuf -n 1)

echo "Background: $BG"

ffmpeg -y \
  -i "$BG" \
  -i "$VOICE" \
  -shortest \
  -vf "scale=1080:1920,drawtext=textfile=$SUB:fontcolor=white:fontsize=56:box=1:boxcolor=black@0.5:boxborderw=20:x=(w-text_w)/2:y=(h-text_h)/2" \
  -c:v libx264 \
  -c:a aac \
  -pix_fmt yuv420p \
  "$OUT"

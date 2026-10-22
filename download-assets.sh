#!/usr/bin/env bash
# Pulls the photos and PDFs off Squarespace into this folder.
# Run this BEFORE you cancel Squarespace:   bash download-assets.sh
set -e
cd "$(dirname "$0")"
mkdir -p images s

CDN="https://images.squarespace-cdn.com/content/v1/51d507c0e4b0bd06a5ee4ab3"

get () {  # get <url> <save-as>
  echo "Downloading $2 ..."
  curl -fsSL "$1" -o "$2" && echo "  ok" || echo "  FAILED: $1"
}

get "$CDN/1597195942074-AKHHT0PSBADQB55WPSU3/davey-alba.png"          images/davey-alba.png
get "$CDN/1373323817140-DEWCR18E22HYS11SNHGV/cityfeverspell.png"      images/cityfeverspell.png
get "$CDN/1373323262803-OHEQU4UP0X1I5OSECNV2/Fibreoptic.jpg"          images/Fibreoptic.jpg

get "https://www.daveyalba.com/s/Atlas.pdf"                           s/Atlas.pdf
get "https://www.daveyalba.com/s/the-behemoth.pdf"                    s/the-behemoth.pdf
get "http://static.squarespace.com/static/51d507c0e4b0bd06a5ee4ab3/t/52d26290e4b0a7b6ed9d068b/1389519504787/Binder.pdf"  s/privacy.pdf

echo
echo "Done. Check the images/ and s/ folders, then commit and push."

#!/bin/bash

# Script to remove transparency from all PNG files
# This flattens alpha channels to white background for PDF/A compliance

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

count=0
echo "========================================"
echo "Removing Transparency from PNG Files"
echo "========================================"
echo ""

# Function to remove transparency from PNG
remove_transparency() {
    local input_file="$1"
    local temp_file="${input_file%.png}_temp.png"

    echo -e "${YELLOW}Processing:${NC} $input_file"

    # Use ImageMagick/GraphicsMagick to flatten transparency to white background
    # Try convert first (ImageMagick), then gm (GraphicsMagick), then sips (macOS)
    if command -v convert &> /dev/null; then
        convert "$input_file" -background white -alpha remove -alpha off "$temp_file" 2>/dev/null && mv "$temp_file" "$input_file" && return 0
    elif command -v gm &> /dev/null; then
        gm convert "$input_file" -background white -flatten "$temp_file" 2>/dev/null && mv "$temp_file" "$input_file" && return 0
    elif command -v sips &> /dev/null; then
        # macOS sips doesn't handle alpha well, use Python as fallback
        python3 -c "
from PIL import Image
import sys
try:
    img = Image.open('$input_file')
    if img.mode in ('RGBA', 'LA') or (img.mode == 'P' and 'transparency' in img.info):
        # Create white background
        background = Image.new('RGB', img.size, (255, 255, 255))
        if img.mode == 'P':
            img = img.convert('RGBA')
        background.paste(img, mask=img.split()[-1] if img.mode in ('RGBA', 'LA') else None)
        background.save('$temp_file', 'PNG')
        sys.exit(0)
    else:
        # No transparency, just copy
        img.save('$temp_file', 'PNG')
        sys.exit(0)
except Exception as e:
    print(f'Error: {e}', file=sys.stderr)
    sys.exit(1)
" && mv "$temp_file" "$input_file" && return 0
    fi

    echo -e "${RED}✗ Failed (no suitable tool found)${NC}"
    return 1
}

# Process all PNG files
while IFS= read -r -d '' png_file; do
    if remove_transparency "$png_file"; then
        echo -e "${GREEN}✓ Transparency removed${NC}"
        ((count++))
    fi
    echo ""
done < <(find . -path "*/figures/*.png" -type f -print0)

echo "========================================"
echo "Summary: Processed $count PNG files"
echo "========================================"
echo ""
echo "Next step: Re-upload figures to Overleaf and recompile"

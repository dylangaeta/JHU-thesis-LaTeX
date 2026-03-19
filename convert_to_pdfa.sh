#!/bin/bash

# Script to convert all figures to PDF/A-1b format
# This ensures compliance with dissertation/archival requirements

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Counter variables
total_files=0
converted_files=0
failed_files=0

echo "========================================="
echo "PDF/A Conversion Script"
echo "========================================="
echo ""

# Function to convert PDF to PDF/A using Ghostscript
convert_pdf_to_pdfa() {
    local input_file="$1"
    local output_file="${input_file%.pdf}_pdfa.pdf"
    local temp_file="${input_file%.pdf}_temp.pdf"

    echo -e "${YELLOW}Converting:${NC} $input_file"

    # Ghostscript PDF/A-1b conversion with proper settings
    if gs -dPDFA=1 -dBATCH -dNOPAUSE -dNOOUTERSAVE -dUseCIEColor \
        -sProcessColorModel=DeviceRGB -sDEVICE=pdfwrite \
        -dPDFACompatibilityPolicy=1 \
        -sOutputFile="$temp_file" \
        "$input_file" > /dev/null 2>&1; then

        # Replace original with converted version
        mv "$temp_file" "$input_file"
        echo -e "${GREEN}✓ Converted successfully${NC}"
        return 0
    else
        echo -e "${RED}✗ Conversion failed${NC}"
        rm -f "$temp_file"
        return 1
    fi
}

# Function to convert PNG to PDF/A
convert_png_to_pdfa() {
    local input_file="$1"
    local output_file="${input_file%.png}.pdf"

    echo -e "${YELLOW}Converting PNG to PDF/A:${NC} $input_file"

    # First convert PNG to PDF, then to PDF/A
    if gs -dBATCH -dNOPAUSE -dNOOUTERSAVE -sDEVICE=pdfwrite \
        -dPDFA=1 -dPDFACompatibilityPolicy=1 -sProcessColorModel=DeviceRGB \
        -sOutputFile="$output_file" \
        -c "<</PageSize [612 792]>> setpagedevice" \
        -f "$input_file" > /dev/null 2>&1; then

        echo -e "${GREEN}✓ Converted PNG to PDF/A${NC}"
        return 0
    else
        echo -e "${RED}✗ PNG conversion failed${NC}"
        return 1
    fi
}

# Process all PDF files
echo "Processing PDF files..."
echo "------------------------"
while IFS= read -r -d '' pdf_file; do
    ((total_files++))
    if convert_pdf_to_pdfa "$pdf_file"; then
        ((converted_files++))
    else
        ((failed_files++))
    fi
done < <(find . -type f -name "*.pdf" -print0)

echo ""
echo "Processing PNG files (optional conversion to PDF)..."
echo "-----------------------------------------------------"
# Uncomment the following if you want to convert PNGs to PDF/A
# while IFS= read -r -d '' png_file; do
#     ((total_files++))
#     if convert_png_to_pdfa "$png_file"; then
#         ((converted_files++))
#     else
#         ((failed_files++))
#     fi
# done < <(find . -type f -name "*.png" -print0)

echo ""
echo "========================================="
echo "Conversion Summary"
echo "========================================="
echo "Total files processed: $total_files"
echo -e "${GREEN}Successfully converted: $converted_files${NC}"
echo -e "${RED}Failed conversions: $failed_files${NC}"
echo ""
echo "Note: Original files have been replaced with PDF/A versions"
echo "========================================="

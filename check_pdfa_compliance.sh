#!/bin/bash

# Script to check PDF/A compliance of all PDF files in the project

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

compliant_count=0
non_compliant_count=0

echo "========================================="
echo "PDF/A Compliance Checker"
echo "========================================="
echo ""

check_pdf_compliance() {
    local pdf_file="$1"
    local info=$(pdfinfo "$pdf_file" 2>&1)

    # Check for PDF/A indicators
    local has_metadata=$(echo "$info" | grep -i "Metadata Stream" | grep -i "yes" | wc -l)
    local is_tagged=$(echo "$info" | grep -i "Tagged" | grep -i "yes" | wc -l)
    local pdf_version=$(echo "$info" | grep "PDF version" | awk '{print $3}')

    # Basic PDF/A check (simplified)
    if [[ $has_metadata -eq 0 ]] || [[ $is_tagged -eq 0 ]]; then
        echo -e "${RED}✗ NON-COMPLIANT:${NC} $pdf_file"
        echo "  - Metadata Stream: $(echo "$info" | grep "Metadata Stream" | awk '{print $3}')"
        echo "  - Tagged: $(echo "$info" | grep "Tagged:" | awk '{print $2}')"
        echo "  - PDF Version: $pdf_version"
        echo ""
        return 1
    else
        echo -e "${GREEN}✓ COMPLIANT:${NC} $pdf_file"
        return 0
    fi
}

# Check all PDF files
while IFS= read -r -d '' pdf_file; do
    if check_pdf_compliance "$pdf_file"; then
        ((compliant_count++))
    else
        ((non_compliant_count++))
    fi
done < <(find . -type f -name "*.pdf" -print0)

echo "========================================="
echo "Summary"
echo "========================================="
echo -e "${GREEN}PDF/A Compliant files: $compliant_count${NC}"
echo -e "${RED}Non-compliant files: $non_compliant_count${NC}"
echo "========================================="

if [[ $non_compliant_count -gt 0 ]]; then
    echo ""
    echo "Run ./convert_to_pdfa.sh to convert all PDFs to PDF/A format"
fi

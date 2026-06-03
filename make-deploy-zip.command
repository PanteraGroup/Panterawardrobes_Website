#!/bin/bash
#
# make-deploy-zip.command  —  Pantera Wardrobes website
# -----------------------------------------------------------------------------
# Double-click this file to build a Netlify-ready deploy zip.
#
# It zips the CONTENTS of this folder (so index.html sits at the ROOT of the
# zip, which is what Netlify drag-and-drop needs) and writes the result to the
# top-level "Websites" folder as pantera-wardrobes-deploy.zip.
#
# It deliberately leaves out: .git, .DS_Store, __MACOSX, this script itself,
# any previous deploy zip, and the _optimisation-work / _*-backup folders.
# -----------------------------------------------------------------------------

# Always work from this script's own folder (handles spaces in the path).
cd "$(dirname "${BASH_SOURCE[0]}")" || { echo "Could not change to the script's folder."; read -n1 -r -p "Press any key to close..."; exit 1; }
SITE_DIR="$(pwd)"

# Output goes to the top-level Websites folder (two levels up from here).
OUT_DIR="$(cd ../.. && pwd)"
ZIP_NAME="pantera-wardrobes-deploy.zip"
OUT_ZIP="$OUT_DIR/$ZIP_NAME"

echo "Site folder : $SITE_DIR"
echo "Output zip  : $OUT_ZIP"
echo "Building..."
echo

# Start clean: drop any previous zip of the same name.
rm -f "$OUT_ZIP"

# Build the zip from the folder CONTENTS ('.'), excluding junk & non-deploy bits.
zip -r -X "$OUT_ZIP" . \
    -x ".git/*" "*/.git/*" \
    -x ".DS_Store" "*/.DS_Store" \
    -x "__MACOSX/*" "*/__MACOSX/*" \
    -x "make-deploy-zip.command" \
    -x "*-deploy.zip" \
    -x "_optimisation-work/*" "*/_optimisation-work/*" \
    -x "_*-backup/*" "*/_*-backup/*" \
    > /dev/null
ZIP_STATUS=$?

echo
echo "=================================================================="
if [ $ZIP_STATUS -ne 0 ]; then
    echo "X  Zip failed (exit code $ZIP_STATUS). Nothing was written."
    read -n1 -r -p "Press any key to close..."
    exit 1
fi

echo "Top-level entries inside $ZIP_NAME:"
unzip -Z1 "$OUT_ZIP" | sed -E 's#/.*#/#' | sort -u | sed 's/^/   /'
echo "------------------------------------------------------------------"
if unzip -Z1 "$OUT_ZIP" | grep -qx "index.html"; then
    echo "OK  index.html IS at the ROOT of the zip - ready for Netlify drag-and-drop."
else
    echo "X   index.html is NOT at the root - do NOT deploy this zip."
fi
echo
echo "Zip written to:"
echo "   $OUT_ZIP"
echo "=================================================================="
echo
read -n1 -r -p "Done. Press any key to close this window..."
echo
exit 0

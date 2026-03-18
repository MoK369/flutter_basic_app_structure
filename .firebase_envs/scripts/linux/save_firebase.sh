#!/bin/bash

DEST=".firebase_envs/files"

echo "Saving Firebase files to $DEST ..."
mkdir -p "$DEST"

# File list
FILES=(
  "android/app/google-services.json"
  "ios/Runner/GoogleService-Info.plist"
  "lib/firebase_options.dart"
  ".firebaserc"
  "firestore.rules"
  "firestore.indexes.json"
  "firebase-config.js"
  "firebase.json"
)

# Copy files if they exist
for FILE in "${FILES[@]}"; do
  if [ -f "$FILE" ]; then
    echo "Copying $FILE -> $DEST"
    cp "$FILE" "$DEST/"
  else
    echo "Skipping $FILE (not found)"
  fi
done

# Directories
DIRS=(
  ".firebase"
  "firestore_export"
)

for DIR in "${DIRS[@]}"; do
  if [ -d "$DIR" ]; then
    echo "Copying directory $DIR -> $DEST"
    rm -rf "${DEST:?}/$(basename "$DIR")"
    cp -r "$DIR" "$DEST/"
  else
    echo "Skipping directory $DIR (not found)"
  fi
done

echo "Done saving Firebase files."
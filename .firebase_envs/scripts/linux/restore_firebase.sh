#!/bin/bash

SRC=".firebase_envs/files"

echo "Restoring Firebase files from $SRC ..."

# File list
FILES=(
  "google-services.json:android/app/google-services.json"
  "GoogleService-Info.plist:ios/Runner/GoogleService-Info.plist"
  "firebase_options.dart:lib/firebase_options.dart"
  ".firebaserc:.firebaserc"
  "firestore.rules:firestore.rules"
  "firestore.indexes.json:firestore.indexes.json"
  "firebase-config.js:firebase-config.js"
  "firebase.json:firebase.json"
)

# Restore files
for MAP in "${FILES[@]}"; do
  SRC_FILE="${MAP%%:*}"
  DEST_FILE="${MAP##*:}"

  if [ -f "$SRC/$SRC_FILE" ]; then
    echo "Restoring $SRC_FILE -> $DEST_FILE"
    mkdir -p "$(dirname "$DEST_FILE")"
    cp "$SRC/$SRC_FILE" "$DEST_FILE"
  else
    echo "Skipping $SRC_FILE (not saved)"
  fi
done

# Directories
DIRS=(
  ".firebase"
  "firestore_export"
)

for DIR in "${DIRS[@]}"; do
  if [ -d "$SRC/$(basename "$DIR")" ]; then
    echo "Restoring directory $(basename "$DIR")"
    rm -rf "$DIR"
    cp -r "$SRC/$(basename "$DIR")" "$DIR"
  else
    echo "Skipping directory $DIR (not saved)"
  fi
done

echo "Done restoring Firebase files."

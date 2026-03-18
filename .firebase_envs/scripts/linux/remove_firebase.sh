#!/bin/bash

echo "Removing Firebase files..."

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

for FILE in "${FILES[@]}"; do
  if [ -f "$FILE" ]; then
    echo "Deleting $FILE"
    rm -f "$FILE"
  else
    echo "Skipping $FILE (not found)"
  fi
done

DIRS=(
  ".firebase"
  "firestore_export"
)

for DIR in "${DIRS[@]}"; do
  if [ -d "$DIR" ]; then
    echo "Deleting directory $DIR"
    rm -rf "$DIR"
  else
    echo "Skipping directory $DIR (not found)"
  fi
done

echo "Firebase files removed."
npx --yes sv create . \
  --template minimal \
  --types ts \
  --add prettier eslint vitest="usages:unit,component" tailwindcss="plugins:typography,forms" sveltekit-adapter="adapter:auto" devtools-json \
  --install npm \
  --no-dir-check
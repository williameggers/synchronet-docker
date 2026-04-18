#! /bin/bash

cd /tmp

ARCH=$(uname -m)

echo ""
echo "Installing Deno..."

# linux/amd64 --- -Lsf
[ "$ARCH" == "x86_64" ] && curl -Lsf "https://github.com/denoland/deno/releases/latest/download/deno-x86_64-unknown-linux-gnu.zip" -o deno.zip || true

# linux/arm64
[ "$ARCH" == "aarch64" -o "$ARCH" == "arm64" ] && curl -Lsf "https://github.com/denoland/deno/releases/latest/download/deno-aarch64-unknown-linux-gnu.zip" -o deno.zip || true

# extract deno.zip to /usr/local/bin/deno
[ -f "deno.zip" ] && unzip deno.zip && rm deno.zip && mv deno /usr/local/bin/deno && chmod +x /usr/local/bin/deno
[ -f /usr/local/bin/deno ] && echo "Deno Installed" || echo "Missing Deno"

rm -rf /tmp/*
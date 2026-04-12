#!/bin/bash
set -euo pipefail

_base_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && cd ../.. && pwd)"
_cache_tar="$_base_dir/.github/cache/build-cache-$ARCH.tar.zst"

[ -f "${_cache_tar}" ] || exit 0

zstd -t -- "${_cache_tar}"
tar --zstd -xf "${_cache_tar}" -C "${_base_dir}"

# we no longer need the tarball once it's
# extracted, so let's get rid of it
rm -f "${_cache_tar}"

# This allows the aarch64 linux build to cross compile correctly for cargo build tools?
export CC_x86_64_unknown_linux_gnu="${CC_FOR_BUILD}"
export CXX_x86_64_unknown_linux_gnu="${CXX_FOR_BUILD}"
export CC_aarch64_unknown_linux_gnu="${CC}"
export CXX_aarch64_unknown_linux_gnu="${CXX}"
export HOST_CC="${CC_FOR_BUILD}"
export HOST_CXX="${CXX_FOR_BUILD}"

# This in the src cargo.toml, but force it here?
if [[ "${target_platform}" == osx-* ]]; then
  export RUSTFLAGS="-C link-arg=-undefined -C link-arg=dynamic_lookup ${RUSTFLAGS:-}"
fi


$PYTHON -m pip install . -vv
cd rust/sasktran2-py-ext/ && cargo bundle-licenses --format yaml --output ../../THIRDPARTY.yml
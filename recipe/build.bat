SET PYTHONUTF8=1
SET PYTHONIOENCODING=utf-8

set "CARGO_TARGET_DIR=D:\ctarget"
set "WHEEL_DIR=%SRC_DIR%\dist"

maturin build --release --out "%WHEEL_DIR%"
if %ERRORLEVEL% neq 0 exit %ERRORLEVEL%

%PYTHON% -m pip install --no-index --find-links="%WHEEL_DIR%" %PKG_NAME%
if %ERRORLEVEL% neq 0 exit %ERRORLEVEL%

cd rust\sasktran2-py-ext
cargo-bundle-licenses --format yaml --output ..\..\THIRDPARTY.yml
if %ERRORLEVEL% neq 0 exit %ERRORLEVEL%
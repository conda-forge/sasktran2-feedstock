SET PYTHONUTF8=1
SET PYTHONIOENCODING=utf-8

cd rust/sasktran2-py-ext/ && cargo-bundle-licenses --format yaml --output ../../THIRDPARTY.yml
maturin build --release
if %ERRORLEVEL% neq 0 exit %ERRORLEVEL%
%PYTHON% -m pip install --find-links=rust\sasktran2-py-ext\target\wheels %PKG_NAME%
if %ERRORLEVEL% neq 0 exit %ERRORLEVEL%

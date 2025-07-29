$PYTHON -m pip install . -vv
cd rust/sasktran2-py-ext/ && cargo bundle-licenses --format yaml --output ../../THIRDPARTY.yml
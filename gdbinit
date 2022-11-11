set print pretty on
set print object on
set print vtbl on

set disassembly-flavor intel
set confirm off

python
import sys
sys.path.insert(0, '/usr/local/share/mnmlstc/core')
try:
  import gnu
  gnu.register(None)
except ImportError: pass
end

local binmodule = require"binmodule.dots"
if binmodule then
  os.exit(0)
else
  print"binmodule not found"
  os.exit(1)
end

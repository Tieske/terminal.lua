-- This example demonstrates the use of the text-attribute stack, and how to
-- use it to manage text attributes in a more structured way.

local t = require("terminal")


-- initialize terminal; backup (switch to alternate buffer) and set output to stdout
t.initialize(true, io.stdout)

-- clear the screen, and move cursor to top-left
t.clear()
t.cursor_push(1,1)

-- push text attribues on the stack
t.textpush{
  fg = "white",
  brightness = "dim",
}
t.print("Hello dim white World!")


t.textpush{
  fg = "white",
  bg = "blue",
  brightness = "normal",
}
t.print("Hello white on blue World!")


t.textpush{
  fg = "red",
  bg = "black",
  brightness = "bright",
}
t.print("Hello bright red World!")

-- Unwind the stack, and restore text attributes along the way
t.textpop()
t.print("Hello white on blue World! (again)")

t.textpop()
t.print("Hello dim white World! (again)")

t.textpop()
t.write("Press any key, or wait 5 seconds...")
t.flush()
t.readansi(5)

-- restore all settings (reverts to original screen buffer)
t.shutdown()

-- this is printed on the original screen buffer
print("done!")

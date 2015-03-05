local ffi = require('ffi')
local bundle = require('luvi').bundle

require('./bundle-action')

-- Get path
local dir = "native/" .. ffi.os .. "-" .. ffi.arch
local entries = bundle.readdir(dir)
local path = dir .. '/' .. entries[1]

local glfw = bundle.action(path, function (path)
  return ffi.load(path)
end)

ffi.cdef(bundle.readfile("libs/glfw.h"))

return glfw


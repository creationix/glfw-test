local glfw = require('glfw')

assert(glfw.glfwInit() ~= 0, "Failed to initialize GLFW")

local window = glfw.glfwCreateWindow(640, 480, "Hello World", nil, nil)

glfw.glfwMakeContextCurrent(window)
-- glfw.glfwSwapInterval(1)

local function keyCallback(window, key, scancode, action, mods)
  p{
    type = "KEY",
    window = window,
    key = key,
    scancode = scancode,
    action = action,
    mods = mods
  }
end
jit.off(keyCallback)
glfw.glfwSetKeyCallback(window, keyCallback)

local function posCallback(window, x, y)
  p{
    type="POS",
    window = window,
    x = x,
    y = y,
  }
end
jit.off(posCallback)
glfw.glfwSetWindowPosCallback(window, posCallback)

local function sizeCallback(window, w, h)
  p{
    type="SIZE",
    window=window,
    w=w,
    h=h
  }
end
jit.off(sizeCallback)
glfw.glfwSetWindowSizeCallback(window, sizeCallback)

-- Loop until the user closes the window
while glfw.glfwWindowShouldClose(window) == 0 do

  --TODO: render

  -- Swap front and back buffers
  glfw.glfwSwapBuffers(window)

  -- Wait for and process events
  glfw.glfwWaitEvents();
end

glfw.glfwTerminate();

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

local function posCallback(window, xPos, yPos)
  p{
    type="POS",
    window = window,
    xPos = xPos,
    yPos = yPos,
  }
end
jit.off(posCallback)
glfw.glfwSetWindowPosCallback(window, posCallback)

local function sizeCallback(window, width, height)
  p{
    type = "SIZE",
    window = window,
    width = width,
    height = height,
  }
end
jit.off(sizeCallback)
glfw.glfwSetWindowSizeCallback(window, sizeCallback)

local function mouseButtonCallback(window, button, action, mods)
  p{
    type = "MOUSE_BUTTON",
    window = window,
    button = button,
    action = action,
    mods = mods,
  }
end
jit.off(mouseButtonCallback)
glfw.glfwSetMouseButtonCallback(window, mouseButtonCallback)

local function cursorPosCallback(window, xPos, yPos)
  p{
    type = "CURSOR_POS",
    window = window,
    xPos = xPos,
    yPos = yPos,
  }
end
jit.off(cursorPosCallback)
glfw.glfwSetCursorPosCallback(window, cursorPosCallback)

-- Loop until the user closes the window
while glfw.glfwWindowShouldClose(window) == 0 do

  --TODO: render

  -- Swap front and back buffers
  glfw.glfwSwapBuffers(window)

  -- Wait for and process events
  glfw.glfwWaitEvents();
end

glfw.glfwTerminate();

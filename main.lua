local glfw, wrapper = unpack(require('glfw'))

assert(glfw.glfwInit() ~= 0, "Failed to initialize GLFW")

local window = glfw.glfwCreateWindow(640, 480, "Hello World", nil, nil)

glfw.glfwMakeContextCurrent(window)
-- glfw.glfwSwapInterval(1)

glfw.glfwSetWindowPosCallback(window, wrapper.GLFWwindowposCallback)
glfw.glfwSetWindowSizeCallback(window, wrapper.GLFWwindowsizeCallback)
-- local function keyCallback(window, key, scancode, action, mods)
--   p{
--     type = "KEY",
--     window = window,
--     key = key,
--     scancode = scancode,
--     action = action,
--     mods = mods
--   }
-- end
-- jit.off(keyCallback)
-- glfw.glfwSetKeyCallback(window, keyCallback)

-- local function posCallback(window, xPos, yPos)
--   p{
--     type="POS",
--     window = window,
--     xPos = xPos,
--     yPos = yPos,
--   }
-- end
-- jit.off(posCallback)
-- glfw.glfwSetWindowPosCallback(window, posCallback)

-- local function sizeCallback(window, width, height)
--   p{
--     type = "SIZE",
--     window = window,
--     width = width,
--     height = height,
--   }
-- end
-- jit.off(sizeCallback)
-- glfw.glfwSetWindowSizeCallback(window, sizeCallback)

-- local function mouseButtonCallback(window, button, action, mods)
--   p{
--     type = "MOUSE_BUTTON",
--     window = window,
--     button = button,
--     action = action,
--     mods = mods,
--   }
-- end
-- jit.off(mouseButtonCallback)
-- glfw.glfwSetMouseButtonCallback(window, mouseButtonCallback)

-- local function cursorPosCallback(window, xPos, yPos)
--   p{
--     type = "CURSOR_POS",
--     window = window,
--     xPos = xPos,
--     yPos = yPos,
--   }
-- end
-- jit.off(cursorPosCallback)
-- glfw.glfwSetCursorPosCallback(window, cursorPosCallback)

-- Loop until the user closes the window
while glfw.glfwWindowShouldClose(window) == 0 do

  while true do
    local event = wrapper.GLFWEventShift()
    p(event)
    if event == nil then break end
    if event.type == wrapper.GLFWwindowposevt then
      p {
        type = "POS",
        window = event.window,
        xpos = event.xpos,
        ypos = event.ypos
      }
    elseif event.type == wrapper.GLFWwindowsizeevt then
      p {
        type = "SIZE",
        window = event.window,
        xpos = event.width,
        ypos = event.height
      }
    end
    wrapper.GLFWEventRelease(event)
  end

  --TODO: render

  -- Swap front and back buffers
  glfw.glfwSwapBuffers(window)

  -- Wait for and process events
  glfw.glfwWaitEvents();

end

glfw.glfwTerminate();

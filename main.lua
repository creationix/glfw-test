local glfw, wrapper, toLua = unpack(require('glfw'))

assert(glfw.glfwInit() ~= 0, "Failed to initialize GLFW")

local window = glfw.glfwCreateWindow(640, 480, "Hello World", nil, nil)

glfw.glfwMakeContextCurrent(window)
-- glfw.glfwSwapInterval(1)

glfw.glfwSetWindowPosCallback(window, wrapper.glfwWindowPosCallback)
glfw.glfwSetWindowSizeCallback(window, wrapper.glfwWindowSizeCallback)
glfw.glfwSetKeyCallback(window, wrapper.glfwKeyCallback)
glfw.glfwSetMouseButtonCallback(window, wrapper.glfwMouseButtonCallback)
glfw.glfwSetCursorPosCallback(window, wrapper.glfwCursorPosCallback)

-- Loop until the user closes the window
while glfw.glfwWindowShouldClose(window) == 0 do

  -- Consume and log all events
  while true do
    local event = wrapper.glfwEventShift()
    if event == nil then break end
    p(toLua(event))
    wrapper.glfwEventRelease(event)
  end

  -- --TODO: render

  -- -- Swap front and back buffers
  -- glfw.glfwSwapBuffers(window)

  -- Wait for and process events
  glfw.glfwWaitEvents();

end

glfw.glfwTerminate();

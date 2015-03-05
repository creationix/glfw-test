local glfw = require('glfw')
p(glfw.glfwInit())

local window = glfw.glfwCreateWindow(640, 480, "Hello World", nil, nil)

glfw.glfwMakeContextCurrent(window)

-- Loop until the user closes the window
while glfw.glfwWindowShouldClose(window) == 0 do

  --TODO: render

  -- Swap front and back buffers
  glfw.glfwSwapBuffers(window)

  -- Poll for and process events
  glfw.glfwPollEvents();
end

glfw.glfwTerminate();

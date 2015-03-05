return {
  name = "glfw-demo",
  version = "0.0.0",
  private = true,
  dependencies = {
    "luvit/require",
    "luvit/pretty-print",
    "creationix/glfw",
  },
  files = {
    "**.lua",
    "**.h",
    "**/$OS-$ARCH**",
  }
}

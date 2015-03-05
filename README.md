# glfw-test
A test app for using glfw in luvit 2.0

## Testing

Currently I only have binaries for OSX-x64, Linux-x64 and Window-x64.

To test this program run the following on a linux or OSX machine:

```sh
curl -L https://github.com/luvit/lit/raw/master/get-lit.sh | sh
./lit make github://creationix/glfw-test
./glfw-demo
```

Or if you're on windows, run:

```bash
PowerShell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://github.com/luvit/lit/raw/master/get-lit.ps1'))"
lit make github://creationix/glfw-test
glfw-demo
```

It should pop-up a black window with the title "Hello World".  It should exit when you close the window.

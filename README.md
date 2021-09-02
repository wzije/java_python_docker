# Docker Info

## Contain

- OpenJDK 18
- Python 3.9

## Troubleshot

1. Error : error install pyzmq==20.0.0

   ```vim
   Installing build dependencies: finished with status 'error'
   Complete output from command /usr/lib/python3.6.6/bin/python3.6 /usr/lib/python3.6.6/lib/python3.6/site-packages/pip install --ignore-installed --no-user --prefix /tmp/pip-build-env-c3okpqft/overlay --no-warn-script-location --no-binary :none: --only-binary :none: -i https://pypi.org/simple -- setuptools wheel "cffi>=1.4.1; python_implementation != 'PyPy'":
   ```

   Solution : `apk add libffi-dev`

2. Error : Error uninstall six

   ```vim
   ERROR: Cannot uninstall 'six'. It is a distutils installed project and thus we cannot accurately determine which files belong to it which would lead to only a partial uninstall.
   ```

   Solution : add this at the end of line `--ignore-installed six`

Reff :

- <https://github.com/docker/compose/issues/8105>
- <https://www.gitmemory.com/issue/jfloff/alpine-python/44/500217349>

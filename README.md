# Docker Info

## Contain

- OpenJDK 18
- Python 3.9
- requirement.txt packages

## Execution

- Build `docker build -t java-python-img .`
- Run `docker run -it --rm --name java-python-app java-python-img`
- accessing inside docker `docker run -it java-python-img sh`

## How much the image size?

```vim
docker images | grep java
java-test   latest   462f0086460d   7 minutes ago    841MB <-- yadaa it's still big enough ha? :v
```

## Troubleshot

1. Error : error install pyzmq==20.0.0

   ```vim
   c/_cffi_backend.c:15:17: fatal error: ffi.h: No such file or directory
      #include <ffi.h>
                     ^
   compilation terminated.
   error: command 'gcc' failed with exit status 1

   ----------------------------------------
   Command "/usr/lib/python3.6.6/bin/python3.6 -u -c "import setuptools, tokenize;__file__='/tmp/pip-install-labi968q/cffi/setup.py';f=getattr(tokenize, 'open', open)(__file__);code=f.read().replace('\r\n', '\n');f.close();exec(compile(code, __file__, 'exec'))" install --record /tmp/pip-record-t4nbxvbv/install-record.txt --single-version-externally-managed --prefix /tmp/pip-build-env-r9ugyqb3/overlay --compile" failed with error code 1 in /tmp/pip-install-labi968q/cffi/
   ```

   Solution : install libffi-dev

   ```vim
   apk add libffi-dev
   ```

2. Error : Error uninstall six

   ```vim
   ERROR: Cannot uninstall 'six'. It is a distutils installed project and thus we cannot accurately determine which files belong to it which would lead to only a partial uninstall.
   ```

   Solution : add --ignore-installed after end of line requirement.txt install command

   ```docker
   RUN pip install --no-cache-dir -r /usr/src/myapp/requirement.txt  --ignore-installed six
   ```

3. Error : wget download ijava-x.zip, maybe some host can't resolve it

   Solution : rebuild docker file

Reff :

- <https://github.com/docker/compose/issues/8105>
- <https://www.gitmemory.com/issue/jfloff/alpine-python/44/500217349>

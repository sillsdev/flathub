# FieldWorks flatpak packaging

This repository is intended to hold the draft flatpak specification while it's
being prepared. A number of files should be removed from this repository, and
a significant history re-write, before performing a pull request to submit the 
flatpak specification to flathub.

## Multiple branches

(Probably not possible in the initial pull request submission to flathub, but)
flatpak allows multiple branches to be used for a software application. So we
can have a stable branch that provides the latest stable FieldWorks version
(which may go, for example, from 9.0.14 to 9.0.15 to 9.1.10 to 10.0.3), a 9.0
branch that provides the latest 9.0 version (which may go, for example, from
9.0.14 to 9.0.15, but never to 9.1.10), and a 9.1 branch that provides the
latest 9.1 version (eg 9.1.10, 9.1.11, but never 9.2.0 or 10.0.0).

Using multiple branches will allow users to choose whether they want to use
FW 9.0 or FW 9.1, without being required to use the latest stable (as is the
normal process with the apt/deb repository).

This won't be applicable in the original pull request submission to flathub for
the flatpak packaging specification, but is something we can follow up with
later.

## Building

### Dependencies

git clone https://github.com/sillsdev/flathub --branch org.sil.FieldWorks
flatpak install flathub org.gnome.Sdk//3.36
flatpak install flathub org.gnome.Platform//3.36

Install tools:

```bash
sudo apt install flatpak-builder
```

#### Optional dependencies 

Clone projects to help generate dependency download lists:
```bash
git clone https://github.com/silnrsi/encoding-converters-core.git --branch master
git clone https://github.com/sillsdev/flexbridge.git --branch develop
git clone https://github.com/sillsdev/FieldWorks.git --branch support/9.0
```

Install tool flatpak-dotnet-generator.py and dependency dotnet5 sdk:
```bash
flatpak install flathub org.freedesktop.Sdk.Extension.dotnet5
git clone https://github.com/flatpak/flatpak-builder-tools.git
```

### Build

```bash
flatpak-builder --user --install --force-clean build-dir org.sil.FieldWorks.yml
```

Note that your first build will take time to download and build all dependencies.

Build up to the fieldworks module, apply the sources for fieldworks, but open a
shell before building fieldworks by appending `--build-shell=fieldworks`

Also provide access to the debugging symbols package, and clean up build
results better, by using the build script: `./build`

## Testing

Run FieldWorks in the result (optionally with additional debugging):

```bash
flatpak run --devel --env=FW_DEBUG=true org.sil.FieldWorks
```

Open a shell inside the FieldWorks flatpak instead of running FieldWorks:

```bash
flatpak run --devel --env=FW_DEBUG=true --command=bash org.sil.FieldWorks
```
## Debugging flatpak FieldWorks

Run FieldWorks from the flatpak by running this command (as copied from FieldWorks launch.json): flatpak run --devel --env=FW_DEBUG=true --env=FW_MONO_OPTS=--debugger-agent=address=127.0.0.1:55555,transport=dt_socket,server=y,suspend=n org.sil.FieldWorks

Then debug target "Attach to local (such as flatpak)" in VSCode.



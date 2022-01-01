# WeSay flatpak packaging

This repository is intended to hold the draft flatpak specification while it's
being prepared. A number of files should be removed from this repository, and
a significant history re-write, before performing a pull request to submit the
flatpak specification to flathub.

## Building

### Dependencies

Flathub repo, flatpak manifest, tools:

```bash
flatpak --user remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak --user install flathub org.gnome.Sdk//3.36
flatpak --user install flathub org.gnome.Platform//3.36
flatpak --user install flathub org.freedesktop.Sdk.Extension.mono6//19.08
flatpak update
git clone https://github.com/sillsdev/flathub --branch org.sil.WeSay
sudo apt install flatpak-builder xonsh
```

### Build

```bash
./build
```

## Testing

Run app in the result:

```bash
./run
```

Open a shell inside the flatpak instead of running the app:

```bash
./shell
```

## Validate appdata

```bash
flatpak install flathub org.freedesktop.appstream-glib
flatpak run org.freedesktop.appstream-glib validate .../org.sil.WeSay.metainfo.xml
```

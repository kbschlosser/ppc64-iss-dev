Adapted from: https://github.com/OpenVADL/aarch64-iss-dev
# PPC64 ISS Dev Setup

## Installation

1. Docker Desktop installieren (https://www.docker.com/get-started/) und öffnen.
   Gegebenenfalls unter Einstellungen->Resourcen den verfügbaren RAM erhöhen.
2. Dieses Repository clonen
3. Das cloned repository in VS Code öffnen
4. Auf Extensions (linke Leiste unten) klicken und "Dev Containers" installieren
5. Auf View->"Command Palette" klicken und "Dev Containers: Rebuild and Reopen in Container" ausführen
6. OpenVADL clonen und bauen:
   ```
   git clone git@github.com:OpenVADL/openvadl.git
   cd openvadl
   ./gradlew installDist nativeCompile
   ```
   Ab jetzt sollten die commands `openvadl` und `nativevadl` von überall im container aus funktionieren.
7. Den ISS generieren mit `iss-gen-sys ppc64/ppc64.vadl`
   Bei der ersten Ausführung wird QEMU automatisch heruntergeladen und in `/root/gen/iss` extrahiert.
8. Den ISS bauen mit `iss-make ppc64sfs`
9. Tests bauen und ausführen:
   ```
   cd test
   make run-vadl-test1   # lässt test1.S auf dem generierten ISS rennen
   make run-qemu-test1   # lässt test1.S auf dem upstream ISS rennen
   ```


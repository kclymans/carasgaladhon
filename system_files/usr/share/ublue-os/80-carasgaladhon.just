# Install system flatpaks
_install-caragaladhon-flatpaks:
    #!/bin/bash
    BAZZITE_FLATPAK_LIST="$(curl https://raw.githubusercontent.com/ublue-os/bazzite/main/scripts/kde_flatpaks/flatpaks | tr '\n' ' ')"
    CARASGALADHON_FLATPAK_LIST="$(curl https://raw.githubusercontent.com/noelmiller/caragaladhon/main/flatpaks/carasgaladhon_flatpaks | tr '\n' ' ')"
    echo "Installing Bazzite Flatpaks.."
    flatpak --system -y install ${BAZZITE_FLATPAK_LIST}
    echo "Installing Carasgaladhon Flatpaks.."
    flatpak --system -y install ${CARASGALADHON_FLATPAK_LIST}

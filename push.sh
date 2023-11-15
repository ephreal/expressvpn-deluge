VERSION=$1
# The version should be in semver format.

docker tag expressvpn-deluge:latest efreal/expressvpn-deluge:latest
docker tag expressvpn-deluge:latest efreal/expressvpn-deluge:v${VERSION}
docker push efreal/expressvpn-deluge:v${VERSION}
docker push efreal/expressvpn-deluge:latest

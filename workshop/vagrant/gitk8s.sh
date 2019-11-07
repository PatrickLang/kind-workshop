mkdir -p ~/go/src/k8s.io/
cd ~/go/src/k8s.io
# Pull just a single branch and no history to save space
# The Kubernetes build/release script needs a tag to determine version, so --branch release-1.16 won't work
git clone --branch v1.16.3-beta.0 https://github.com/kubernetes/kubernetes.git --depth 2
# Reference

## Kubernetes-related

- [Kubectl install](https://kubernetes.io/docs/tasks/tools/install-kubectl-macos/#install-with-homebrew-on-macos) (Homebrew)
- [Kubectx install](https://github.com/ahmetb/kubectx#homebrew-macos-and-linux) (Homebrew)
- [Helm install](https://helm.sh/docs/intro/install/#from-homebrew-macos)
  - [Enable shell autocompletion](https://helm.sh/docs/helm/helm_completion_zsh/)

To add to `.zshrc`

```bash
source <(kubectl completion zsh)
source <(kubectx completion zsh)
source <(helm completion zsh)
```

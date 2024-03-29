<p align="center">
  <img src="./assets/logo.png" width="300">
  <br />
  <br />
  <a href="https://goreportcard.com/report/github.com/blyndusk/go-eland">
    <img src="https://goreportcard.com/badge/github.com/blyndusk/go-eland" />
  </a>
  <br />
  <a href="https://github.com/blyndusk/go-eland/releases">
    <img src="https://img.shields.io/github/v/release/blyndusk/go-eland" />
  </a>
  <a href="https://github.com/blyndusk/go-eland/commits/main">
    <img src="https://img.shields.io/github/release-date/blyndusk/go-eland" />
  </a>
  <a href="https://github.com/blyndusk/go-eland/issues">
    <img src="https://img.shields.io/github/issues/blyndusk/go-eland" />
  </a>
  <a href="https://github.com/blyndusk/go-eland/pulls">
    <img src="https://img.shields.io/github/issues-pr/blyndusk/go-eland" />
  </a>
  <a href="https://github.com/blyndusk/go-eland/blob/main/LICENSE">
    <img src="https://img.shields.io/github/license/blyndusk/go-eland" />
  </a>
</p>
<p align="center">
  <a href="https://github.com/gogolcorp/go-eland/actions/workflows/labeler.yml">
    <img src="https://github.com/gogolcorp/go-eland/actions/workflows/labeler.yml/badge.svg" />
  </a>
  <a href="https://github.com/gogolcorp/go-eland/actions/workflows/ci.yml">
    <img src="https://github.com/gogolcorp/go-eland/actions/workflows/ci.yml/badge.svg" />
  </a>
  <a href="https://github.com/gogolcorp/go-eland/actions/workflows/cd.yml">
    <img src="https://github.com/gogolcorp/go-eland/actions/workflows/cd.yml/badge.svg" />
  </a>
  <a href="https://github.com/gogolcorp/go-eland/actions/workflows/releaser.yml">
    <img src="https://github.com/gogolcorp/go-eland/actions/workflows/releaser.yml/badge.svg" />
  </a>
</p>

## I - Introduction

<!-- <img width="60%" align="left" alt="coffee" src="./assets/images/goeland.gif"/> -->

![goeland](./assets/images/goeland.gif)

**Go-éland** is my *customizable system configuration wizard* made for **Ubuntu**.

Providing a **CLI**, it's written in `Golang` for the *UX/UI part*, and in `Bash` for all *executable content*.

Its operation is as follows:

Each task has **several actions**, each action **calls a `bash` file** that will be executed, and the logs will be sent back to the `Golang CLI`

There are many *packages, applications and others* that are optionally installable. all these resources are **centralized** in a **[config.sh](config/config.sh)** file.

## II - Table of content

- [I - Introduction](#i---introduction)
- [II - Table of content](#ii---table-of-content)
- [II - Features](#ii---features)
  - [A - Apt packages](#a---apt-packages)
  - [B - Bash dotfiles](#b---bash-dotfiles)
  - [C - Zsh overlay](#c---zsh-overlay)
  - [D - Snap packages](#d---snap-packages)
  - [E - CLIs](#e---clis)
- [V - CI/CD, release and container registry](#v---cicd-release-and-container-registry)
  - [A - CI](#a---ci)
  - [B - CD](#b---cd)
  - [C - Labeler](#c---labeler)
- [VI - Project setup](#vi---project-setup)
  - [A - Stack](#a---stack)
  - [B - Makefile](#b---makefile)
- [VII - Contributing](#vii---contributing)
- [VIII - License](#viii---license)

## II - Features

### A - Apt packages

#### Install packages <!-- omit in toc -->

- install `apt` packages from [config.sh](config/config.sh)

#### Update packages <!-- omit in toc -->

- update and upgrade `apt` packages

### B - Bash dotfiles

#### Synchronize files <!-- omit in toc -->

- copy [aliases](config/files/aliases.sh) and [functions](config/files/functions.sh) from this repo to the Ubuntu

#### Write imports <!-- omit in toc -->

- write the files importation in the `.zshrc` or `.bashrc` file

### C - Zsh overlay

#### Oh My Zsh <!-- omit in toc -->

- install [`oh-my-zsh`](<https://github.com/configurationwith> ohmyzsh/ohmyzsh/) framework
- install [`oh-my-zsh`](https://github.com/ohmyzsh/ohmyzsh/) plugins from [config.sh](config/config.sh)

#### Prompt <!-- omit in toc -->

- install [Starship](https://github.com/starship/starship) prompt
- synchronize [custom configuration](config/files/starship.toml)

### D - Snap packages

- install `snap` packages from [config.sh](config/config.sh)
- refresh existing `snap` packages

### E - CLIs

- install `CLIs`  from [config.sh](config/config.sh) as `Docker`,  `Kubectl`,  `Terraform`,

#### Update packages <!-- omit in toc -->

- update and upgrade `apt` packages

## V - CI/CD, release and container registry

### A - CI

[![CI](https://github.com/gogolcorp/go-eland/actions/workflows/ci.yml/badge.svg)](https://github.com/gogolcorp/go-eland/actions/workflows/ci.yml)

The **CI** workflow is located at [.github/workflows/ci.yml](.github/workflows/ci.yml). It's triggered a **each push** on **all branches**, scoping `Golang files`.

It consist of:

- **install Golang** on the VM
- get the dependancies **using the cache of other Actions run**
- **lint the files** to check or syntax errors
- **build** the application

### B - CD

[![CD](https://github.com/gogolcorp/go-eland/actions/workflows/cd.yml/badge.svg)](https://github.com/gogolcorp/go-eland/actions/workflows/cd.yml)

The **CD** workflow is located at [.github/workflows/cd.docker.yml](.github/workflows/cd.docker.yml). It's triggered a **each push** on **`main` branch**, scoping `Golang files`.

It consist of:

- **login** into the GitHub container registry (ghcr.io)
- **build and push** the Golang api using the **production Dockerfile** located at [build/pakage/sample-api/Dockerfile](build/pakage/sample-api/Dockerfile)

After that, you can check the **pushed container** at: `https://github.com/<username>?tab=packages&repo_name=<repository-name>`

> IMPORTANT: you need to **update the production Dockerfile** with your **username** AND **_repository name_**. Otherwise, there will be errors at push:

```bash
LABEL org.opencontainers.image.source = "https://github.com/<username>/<repository-name>"
```

### C - Labeler

[![LABELER](https://github.com/gogolcorp/go-eland/actions/workflows/labeler.yml/badge.svg)](https://github.com/gogolcorp/go-eland/actions/workflows/labeler.yml)

The **labeler** workflow consists in **assigning specific labels** on **pull requests** according to the files that have been modified in the **commits attached to this pull request**.

## VI - Project setup

The project use **Docker** and **Docker Compose** to build and run local and distant images in our workspace.

### A - Stack

All the images use the **same network**, more informations at [docker-compose.yml](docker-compose.yml)

| CONTAINER | PORT        | IMAGE                                                                    |
| :-------- | :---------- | :----------------------------------------------------------------------- |
| GOLANG    | `3333:3333` | [build/pakage/sample-api/Dockerfile](build/pakage/sample-api/Dockerfile) |
| ADMINER   | `3334:8080` | [build/package/adminer/Dockerfile](build/package/adminer/Dockerfile)     |
| POSTGRES  | `5432:5432` | [postgres:latest](https://hub.docker.com/_/postgres)                     |

> Adminer is a GUI that allows us to **manage your database** by permetting to to **create, edit, delete** the different entities, tables, etc.

### B - Makefile

#### TL;DR <!-- omit in toc -->

```bash
make setup-env start logs
```

#### `make help` <!-- omit in toc -->

**Display** informations about other commands.

#### `make setup-env` <!-- omit in toc -->

**Copy** the sample environment files.

#### `make start` <!-- omit in toc -->

Up the containers with **full cache reset** to avoid cache errors.

#### `make stop` <!-- omit in toc -->

**Down** the containers.

#### `make logs` <!-- omit in toc -->

**Display and follow** the logs.

#### `make lint` <!-- omit in toc -->

**Lint** the Go files using `gofmt`.

## VII - Contributing

See [CONTRIBUTING.md](assets/docs/CONTRIBUTING.md) for more informations.

## VIII - License

Under [MIT](./LICENSE) license.

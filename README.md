# Containerized Prettier

This exists because I greatly dislike installing and running tools on
my local system.  Dependencies are a mess, versions are ugly, keeping
things up to date is tiring.  It's all distasteful.

Therefore, because my linters (shout out to MegaLinter!!) want me to
keep my YAML, JSON, etc. files nice and pretty, I use prettier
fairly regularly.  Because I don't want to install and manage Node,
npm, nvm, etc., this containerized version of Prettier now exists.

While searching around DockerHub, I found that several folks did
the same thing; however, I also saw that they hadn't been updated
in months or years.  However, I also saw the the most recent
version of Prettier was released (as of the time of this writing)
three days ago.  So, the old Prettier images are out of date.

Because I can automate the building and pushing of images to
DockerHub and GHCR and I can automate the updating of the
Docker and npm configurations (via Dockerfile and package.json,
respectively) via the Pull Request process initiated by
Dependabot, my hope is that this image will be rebuilt regularly
and remain reasonably current, particularly with regards to
potential security concerns.

## Building

Building the image requires a container engine such as
[Docker](https://docker.com/) or [Podman](https://podman.io/).

```sh
docker build \
  --tag prettier:latest \
  .
```

## Running

Running a container, like building the image, requires a container
engine.  This example shows how to run a container with the current
directory and a style cache bind-mounted to it.  If the cache directory
doesn't exist, it'll be created.

```sh
docker run \
  --interactive \
  --rm \
  --tty \
  --user "$(id --user)" \
  --volume "${PWD}:${PWD}" \
  --workdir "${PWD}" \
  docker.io/wesleydeanflexion/prettier:latest
```

### Public registries

The image is built and published to several public registries for your convenience:

* DockerHub: docker.io/wesleydeanflexion/prettier:latest
* GitHub Container Registry: ghcr.io/flexion/prettier:latest


### Running as an alias

Including this line in your shell configuration file (e.g., .bashrc)
will set an alias of `prettier` that'll run the containerized image
without installing Prettier on your local system.

```sh
alias prettier='docker run -it --rm -u "$(id --user)" -v "${PWD}:${PWD}" -w "${PWD}" docker.io/wesleydeanflexion/prettier:latest'
```


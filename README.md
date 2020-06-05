# Github Actions self hosted

Github Actions self hosted container Dockerfile.

## Usage

### Build
Build the Docker image:

```bash
docker build -t kengz/github-actions:0.0.1 -t kengz/github-actions:latest .
docker push kengz/github-actions
```

### Run

Run Github Actions container:

- on your the Github Actions host machine, pull the image `docker pull kengz/github-actions`
- run the container: `docker run --rm -it kengz/github-actions`
- go to your `Github repo > Settings > Actions > Add Runner`, run the `Configure` commands as shown there.

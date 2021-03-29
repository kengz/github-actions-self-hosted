# Github Actions self hosted

Github Actions self hosted container Dockerfile.

## Usage

### Build

There are 2 Docker images, with one supporting GPU used for model training:
- kengz/github-actions
- kengz/github-actions-gpu

Build and push the images:

```bash
# the cpu image
docker build -t kengz/github-actions:0.0.2 -t kengz/github-actions:latest .
docker push kengz/github-actions
# the gpu image
docker build -f gpu.Dockerfile -t kengz/github-actions-gpu:0.0.2 -t kengz/github-actions-gpu:latest .
docker push kengz/github-actions-gpu
```

### Run

Run Github Actions container:

- on your the Github Actions host machine, pull the image `docker pull kengz/github-actions`
- run the container: `docker run --rm --shm-size=8g -it -v /var/run/docker.sock:/var/run/docker.sock kengz/github-actions`
- go to your `Github repo > Settings > Actions > Add Runner`, run the `Configure` commands as shown there.

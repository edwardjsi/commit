---

## 🏷️ Tagging the Docker Image

To prepare your image for Docker Hub, tag it using the format:

```
docker tag myapp-opt devopsedward/myapp-opt:v1.0
```

- `myapp-opt`: The name of your locally built image.
- `devopsedward`: Your Docker Hub username.
- `v1.0`: A semantic version tag for clarity and reproducibility.

Tagging helps track versions, isolate environments, and enable rollback in CI/CD workflows.

---

## 🚀 Pushing the Image to Docker Hub

Once tagged, push the image to your public registry:

```
docker push devopsedward/myapp-opt:v1.0
```

This makes the image available for:
- CI/CD pipelines
- Kubernetes deployments
- Team collaboration
- Public sharing and reproducibility

--

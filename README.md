# TerraVision with MCP Server Docker image

## Usage

```bash
docker run --rm -it -v "$(pwd):/project" sunaoka/terravision \
    draw --source /project/yourfiles/ --varfile /project/your.tfvars
```

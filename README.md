
# n8n Cloud-Ready Automation Guide

n8n is an extendable workflow automation tool. This project provides a single entrypoint for all setup and management tasks via the `magic.sh` script.

---

## Quick Start (Recommended)

Run the following command to launch the interactive automation menu:

```bash
./magic.sh
```

You will be prompted to select from options such as:
- Install Docker
- Install Docker Compose
- Start/Stop n8n containers
- View running containers
- Clean up unused Docker images/volumes
- Set swap memory
- Create/Delete NGINX server block
- Install Let's Encrypt SSL certificate

All steps are automated and require minimal manual intervention. Make sure your `.env` file is configured with the required environment variables before running `magic.sh`.

---

## Usage Details

1. **Configure Environment**
	- Edit the `.env` file with your settings (domain, ports, credentials, etc).
2. **Run Automation**
	- Execute `./magic.sh` and follow the menu prompts.
3. **Access n8n**
	- After setup, access the web UI at your configured domain or [http://localhost:5678](http://localhost:5678).

---

## Advanced Options

You can re-run `magic.sh` at any time to:
- Scale workers
- Reconfigure NGINX
- Renew SSL certificates
- Clean up Docker resources

---

## Documentation
- [Official Documentation](https://docs.n8n.io/)
- [Community Forum](https://community.n8n.io/)

---

## License
This project is licensed under the [Apache 2.0 License](LICENSE).

# Docker Networking: Concepts and Hands-On Guide

This guide explains Docker's networking modes—**bridge**, **host**, and **user-defined**—and provides reproducible commands to test each setup. It’s designed to be modular, teachable, and interview-ready.

---

## 🧠 Conceptual Overview

| Network Type      | Isolation | DNS Support | Use Case                          |
|-------------------|-----------|-------------|-----------------------------------|
| Bridge (default)  | Yes       | No          | Simple, isolated containers       |
| Host              | No        | N/A         | Performance-critical, Linux only  |
| User-defined      | Yes       | Yes         | Multi-container communication     |

- **Bridge**: Docker’s default network. Containers get private IPs and NAT to host.
- **Host**: Shares host’s network stack. No isolation. Linux-only.
- **User-defined**: Custom bridge network with built-in DNS-based container discovery.

---

## 🧱 Inspect Default Bridge Network

```bash
docker network ls
docker network inspect bridge


• 	The default  network is created automatically.
• 	Containers on this network can reach the internet but not each other by name.

🧪 Test Bridge Network

• 	Confirms outbound internet access.
• 	DNS resolution works from inside the container.

Bash

	docker run -dit --name bridge_test alpine
	docker exec -it bridge_test ping google.com
	
🧩 Test Host Network (Linux only

Bash
	docker run -dit --name host_test --network host alpine
	
- Shares the host’s network stack.
- No isolation—useful for performance-critical apps.

🔧 Create and Use a User-Defined Network

Bash

	docker network create mynet
	
Launch two containers on mynet:	

Bash

	docker run -dit --name container1 --network mynet alpine
	docker run -dit --name container2 --network mynet alpine
	
Test container-to-container DNS:

Bash

	docker exec -it container1 ping container2
	
• 	Should resolve by name and succeed.
• 	This only works on user-defined bridge networks.

🔍 Inspect Network Detail

	docker network inspect mynet
	
🧼 Cleanup

	docker rm -f bridge_test host_test container1 container2
	docker network rm mynet

🧠 Troubleshooting Notes
• 	If a container fails to start with network not found, recreate the network and re-run the container.
• 	Use  docker ps -a to check container status.
• 	Use  docker network connect mynet to manually attach containers.
• 	If ping fails, ensure both containers are running and attached to the same user-defined network.
	

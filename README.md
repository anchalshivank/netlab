# NetLab Guide

This repository is designed for testing purposes, specifically to simulate a real-life network scenario for the **libp2p** library. It allows you to mock a network of nodes using multiple containers, where each container acts as an independent node.

## Overview

### Purpose

The main goal of this setup is to test the **libp2p** library in a simulated environment. Since setting up a real-world infrastructure can be costly and complex, this repository provides a lightweight, containerized solution to replicate a network of nodes.

### Environment

- **Operating System:** Linux
- **Containerization:** Multiple containers running on a local terminal, with each terminal representing a node.

## Network Configuration

### Node Setup

The network consists of the following nodes:

- **ISP Node**
- **Router Node**
- **Public Node**

Each node is configured with specific IP routes to ensure proper communication across the network. The following sections provide the routing configuration for each node.

### Routing Configuration

#### ISP Node

Routes:
- Default route via `203.0.113.1` on `eth0`.
- Direct route to the `198.51.100.0/24` network on `eth1`.
- Local route to the `203.0.113.0/24` network on `eth0`.

#### Router Node

Routes:
- Default route via `192.168.1.1` on `eth0`.
- Direct route to the `192.168.1.0/24` network on `eth0`.
- Route to the `198.51.100.0/24` network via `203.0.113.2` on `eth1`.
- Local route to the `203.0.113.0/24` network on `eth1`.

#### Public Node

Routes:
- Default route via `198.51.100.1` on `eth0`.
- Direct route to the `198.51.100.0/24` network on `eth0`.
- Route to the `203.0.113.0/24` network via `198.51.100.3` on `eth0`.
## Usage Guide

### Step 1: Clone the Project

Clone the repository from GitHub:

```bash
git clone https://github.com/anchalshivank
cd netlab
```
### Step 2: Rebuild and Start Containers
Run the following command to rebuild the environment and start the containers:
```bash
./rebuild
```
This command will set up the containers, representing each node in the network.

### Step 3: Access Specific Nodes
To interact with a specific node, use the following commands:

**ISP Node:**

```bash
docker exec -it isp bash
```

**Public Node:**
```bash
docker exec -it public_node bash
```

**Router Node:**
```bash
docker exec -it router bash
```
Once inside the container, you can configure and manage the node as needed for your testing.


## Contributions
We welcome contributions to improve this repository. If you have suggestions, bug fixes, or new features, please feel free to open an issue or submit a pull request. Your contributions help make this project better for everyone!

Thank you for your interest and support!

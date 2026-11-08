# PC0 → PC1 Routed Network Lab (with Switch)

## Overview
This lab demonstrates routed connectivity between two end devices (PC0 and PC1) using a switch and a single router. PC0 and PC1 are on different networks, and the router provides Layer 3 routing between them. The switch provides Layer 2 connectivity for PC0.

---

## Topology
PC0 ---- Switch ---- Router ---- PC1

---

## IP Addressing Table

| Device | Interface | IP Address     | Subnet Mask       |
|--------|-----------|----------------|--------------------|
| PC0    | NIC       | 192.168.1.10   | 255.255.255.0     |
| Switch | F0/1      | N/A (Layer 2)  | N/A               |
| Router | G0/0      | 192.168.1.2    | 255.255.255.0     |
| PC1    | NIC       | 192.168.0.10   | 255.255.255.0     |
| Router | G0/1      | 192.168.0.1    | 255.255.255.0     |

---

## Router Configuration
```bash
enable
configure terminal

interface GigabitEthernet0/0
 ip address 192.168.1.2 255.255.255.0
 no shutdown

interface GigabitEthernet0/1
 ip address 192.168.0.1 255.255.255.0
 no shutdown

end
write memory
```

---

## Switch Configuration
(Basic Layer 2 switching — no VLANs required)
- Ensure ports connected to PC0 and Router G0/0 are up
- No IP addressing required
- No additional configuration needed unless VLANs are added

---

## PC Configuration

### PC0
- IP: 192.168.1.10
- Mask: 255.255.255.0
- Default Gateway: 192.168.1.2

### PC1
- IP: 192.168.0.10
- Mask: 255.255.255.0
- Default Gateway: 192.168.0.1

---

## Connectivity Testing
### 1. Ping Router from PC0
ping 192.168.1.2

### 2. Ping Router from PC1
ping 192.168.0.1

### 3. Ping PC1 from PC0
ping 192.168.0.10

Expected result: Successful replies

If pings fail, verify:
- IP addresses
- Subnet masks
- Default gateways
- Router interfaces are up
- Switch ports are not administratively down

---

## Purpose of the Lab
This lab demonstrates:
- Basic routed network design
- How switches provide Layer 2 connectivity
- Router interface configuration
- End‑to‑end connectivity testing
- Communication between devices on different networks

---

## Files Included
- PC0 to PC1 routed network.pkt — Packet Tracer project file
- PC0-to-PC1-routed-network.md — This documentation

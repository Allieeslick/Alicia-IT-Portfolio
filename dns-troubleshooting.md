# DNS Troubleshooting with Windows Server

I had an issue where my domain controller kept recreating DNS records I didn’t want. Every time I deleted them, they came back. The wrong records were causing my virtual machines to resolve the wrong IP address.

## What Happened
My domain controller has two network adapters:
- Internal network (correct)
- NAT network (only for internet)

The NAT NIC kept registering itself in DNS, creating:
- Wrong IPv4 A record
- Unwanted IPv6 AAAA record

## Commands I Used
These are the commands I ran while troubleshooting:

```
ipconfig /flushdns
Clear-DnsServerCache -Force
Restart-Service DNS
net stop netlogon
net start netlogon
```

## What I Did to Fix It
- Turned off DNS registration on the NAT NIC  
- Deleted the incorrect DNS records  
- Ran the commands above to flush DNS and restart services  

## Result
After making these changes, only the correct internal IP stayed in DNS and my machines were able to resolve the domain controller properly again.

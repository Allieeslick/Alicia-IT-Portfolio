# Connecting Rocky Linux to Windows Server

## Project Overview
I connected a Rocky Linux 10 virtual machine to my Windows Server 2022 Active Directory domain. This project demonstrates that I can integrate Linux into a Windows-based environment and manage authentication across different operating systems. It also gave me hands-on experience with the tools and services that make domain joins work.

## Purpose of the Project
My goal was to understand how Linux systems authenticate against Active Directory and what conditions must be in place for a successful join. I wanted to learn how SSSD, Kerberos, and realmd operate, and build confidence working with identity services before moving into deeper Linux administration.

## Environment Setup
I built this project in VirtualBox using internal networking. The environment included:

- Windows Server 2022 domain controller — **192.168.10.10**
- Rocky Linux 10 minimal installation — **192.168.10.20**
- Static IP addressing with DNS pointing to the domain controller

This setup reflects how mixed environments are commonly structured.

## Key Steps I Completed

### Preparing the Linux System
I installed the required packages for Active Directory integration:

- realmd  
- sssd  
- adcli  
- oddjob  
- oddjob-mkhomedir  
- Samba tools  

These components allow Linux to discover the domain, authenticate users, and create home directories automatically.

### Correcting the Hostname and FQDN
The initial domain join failed because the Linux system was still using the default hostname **localhost**.

I updated it to a proper FQDN:

```
hostnamectl set-hostname rocky1.alicia.local
```

Then I edited `/etc/hosts` to include:

```
192.168.10.20 rocky1.alicia.local rocky1
```

### Configuring Networking and DNS with nmcli
I configured the Linux VM to use a static IP, gateway, and the domain controller for DNS.

```
nmcli connection modify enp0s3 ipv4.addresses 192.168.10.20/24
nmcli connection modify enp0s3 ipv4.gateway 192.168.10.1
nmcli connection modify enp0s3 ipv4.dns 192.168.10.10
nmcli connection modify enp0s3 ipv4.method manual
nmcli connection modify enp0s3 ipv4.ignore-auto-dns yes
nmcli connection up enp0s3
```

### Verifying Connectivity
I confirmed that the Linux VM could reach the domain controller and resolve the domain.

```
ping 192.168.10.10
ping dc1
nslookup alicia.local
realm discover alicia.local
```

### Joining the Domain
Once the hostname and DNS were correct, the join succeeded.

```
realm join -U Administrator alicia.local
```

A silent return from this command indicates a successful join.

### Verifying Authentication
I confirmed the join and tested identity resolution:

```
realm list
id administrator@alicia.local
```

This showed that SSSD and Kerberos were working correctly and that the Linux system was fully integrated with Active Directory.

## Troubleshooting Experience
This project helped me understand how hostname configuration, DNS, and identity services affect authentication. I worked through each layer until the join succeeded, which strengthened my understanding of how Linux and Windows communicate during the authentication process.

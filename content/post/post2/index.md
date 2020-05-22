---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Notes on IoT security"
subtitle: "Some personal notes taken whilst reading up on IoT security"
summary: "Some personal notes taken whilst reading up on IoT security"
authors: []
tags: []
categories: []
date: 2020-05-15T16:57:26+01:00
lastmod: 2020-05-15T16:57:26+01:00
featured: false
draft: false

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
image:
  caption: ""
  focal_point: ""
  preview_only: false

# Projects (optional).
#   Associate this post with one or more of your projects.
#   Simply enter your project's folder or file name without extension.
#   E.g. `projects = ["internal-project"]` references `content/project/deep-learning/index.md`.
#   Otherwise, set `projects = []`.
projects: [learning about IoT security]
---

I don't normally make typed notes when reading (I prefer to write with pen and paper). However, in the interests of populating this blog and practising a bit of markup, here we go!
I seriously doubt that these notes could be useful to anyone else; my suggestion would be to go to the source. I've added links to the resources. 

---

#### "Azure Sphere - raising the bar for the end-to-end security in IoT"
###### Adrian Buzescu [via linkedin](https://www.linkedin.com/pulse/azure-sphere-raising-bar-end-to-end-iot-adrian-buzescu/)

Cloud as a service presents an attractive business proposition. Recurrent monetization is very lucrative!

According to Adrian Buzescu, security must start with the device. "Adding" security means adding complexity and it is unclear who should be responsible or how securitisation is coordinated. This complexity, together with the abundance of solutions addressing only parts of the equation (i.e. only secure boot/ only device enrollment to the Cloud) translates to high upfront cost and non-viable time to market.

What is needed is a simple way for OEMs designing and manufacturing secure IoT to build security into their products from the start.


Through its lifecycle, an IoT device performs multiple functions that can be implemented by different players. Different players assume ownership of specific functions through cryptographic keys and certificates. 
Device management service can be different from operation service.
Device management might be delegated to a different service provider. 


Microsoft Azure Sphere is a bundled solution to streamline HW security for IoT:

- HW root of trust establishment
- secure, encrypted boot chain all the way to Linux kernel
- reilience: monitoring, detection and self-remediation of intrusion and network attacks
- device ID provisioning
- HW-enforced secure connectivity
- Azure IoT enrollment
- firmware update as a service for 10 years

---
#### "The Seven Properties of Highly Secure Devices"
###### Galen Hunt, George Letey, Edmund B. Nightingale; [Microsoft research (pdf)](https://www.microsoft.com/en-us/research/wp-content/uploads/2017/03/SevenPropertiesofHighlySecureDevices.pdf)

- Hardware-based root of trust
  - unforgeable cryptographic keys generated and protected by side-channel resistant hardware. *devices should have unique unforgeable identity tied to HW*
- small trusted computing base.
  - *software should not be able to access private keys*
- defense in depth
  - multiple mitigations (at different layers) against threats
- compartmentalisation
  - *a failure in one component of the device shouldn't affect others*
- certificate-based authentication
  - signed certificate, signed by unforgeable cryptographic key, proves the device's identity and authenticity. *devices should use certificates _instead_ of passwords to authenticate.
- renewable security
  - *secure state should be recoverable:* devices should be able to be updated to be made secure or else if the decice is compromised, it should be revoked.
- failure reporting
  - software failures (e.g. buffer overflow) should be reported to cloud-based failure analysis system.

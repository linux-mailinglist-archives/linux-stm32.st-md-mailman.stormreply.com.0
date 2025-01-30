Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E493A228D6
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Jan 2025 07:13:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F07BFC7803C;
	Thu, 30 Jan 2025 06:13:51 +0000 (UTC)
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 83D9BC6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Jan 2025 06:13:44 +0000 (UTC)
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20250130061341epoutp04ff3bffb1bf4e2883f0e40c8e400f646e~fY7el-rcJ2172321723epoutp04a
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Jan 2025 06:13:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20250130061341epoutp04ff3bffb1bf4e2883f0e40c8e400f646e~fY7el-rcJ2172321723epoutp04a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1738217621;
 bh=mztnCaIfHV9x+Yu8hRVDPHeOy7Gt+locQNzg3InAHw0=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=rIxNK1SJxI+kr8oKzEzSnj/WY8bjOZUxA+10qURZa3MHn/TQ8QsnmXKnpuJ0+/GGZ
 Xghd2imI7C+FCvPfyyNaBhASoeoAMIKtBbSh3uT2UQkaFO6yLG868OX6suCo4nisvC
 Q2gfEUWf46w791KaQ1YVnWjVeWcxcFVrRJVNJIgo=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTP id
 20250130061340epcas5p14b19103336506df38be9e60b4b6ed97e~fY7eADqDL0799607996epcas5p1t;
 Thu, 30 Jan 2025 06:13:40 +0000 (GMT)
Received: from epsmgec5p1new.samsung.com (unknown [182.195.38.182]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4Yk7xv05Z6z4x9Py; Thu, 30 Jan
 2025 06:13:39 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
 epsmgec5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 8F.A0.19710.2981B976; Thu, 30 Jan 2025 15:13:38 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
 20250130060554epcas5p4035cae282c2bf0df98d9d1086ec86c97~fY0sAw_OS0133901339epcas5p4L;
 Thu, 30 Jan 2025 06:05:54 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20250130060554epsmtrp2f4afe7f2e17be1554037ce8a5e047085~fY0r-tffn1752517525epsmtrp2i;
 Thu, 30 Jan 2025 06:05:54 +0000 (GMT)
X-AuditID: b6c32a44-363dc70000004cfe-5c-679b189231f5
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 95.D2.18949.2C61B976; Thu, 30 Jan 2025 15:05:54 +0900 (KST)
Received: from FDSFTE596 (unknown [107.122.82.131]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20250130060551epsmtip274c505e64f7493196e8cdb953c009479~fY0oaE8sX0835108351epsmtip2a;
 Thu, 30 Jan 2025 06:05:50 +0000 (GMT)
From: "Swathi K S" <swathi.ks@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>
In-Reply-To: <1da56c20-c522-428e-81ff-bc2f9ee0f524@kernel.org>
Date: Thu, 30 Jan 2025 11:35:17 +0530
Message-ID: <005b01db72dd$059f81c0$10de8540$@samsung.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQDx5RsunPn3lkU9PtjwM0wRa6rGBAHz93duAhzDMjcC64gLR7TKB+9g
Content-Language: en-in
X-Brightmail-Tracker: H4sIAAAAAAAAA01Ta0xTZxj2O6ftaZnVIyB8YlRSRyIo0GLBjylOJ5JjcJFpgruopYFjIZTS
 9YKDP6AYcWyCqEwpt0rEcWcCZeVWGTCIsFAIl5QfqAgoAooBR7hMWeHAxr/nfd7nfZ/vfb+8
 XNy2gHDiRig0tEohlQs4NqzqZtc97rdgpkyYPHUAzb/+BaDnOdUcZB5swlFJQyeGssxXWSi3
 pZONRltfEGigsQZDLe0PMPQ07y0bmc2/EairOoWNKob72Who/Czqqc3ioHtmE4aS+0fYKOdD
 KRu16h3QbMckQHmG9wRamjAANPSunkC6LiMbtfw1hqOleiOB8p7r2Ue2U1WFAxg1mmogqBrd
 IEHpK7RURdGPHKryQTxVY5zBqClTH4dKqSoC1B8mETU614BTVY9nAPXxSjZBzVTsDNr0beSh
 cFoaRqucaUVodFiEQuYnCDwjOSbx9hGK3EW+6IDAWSGNov0E/ieD3AMi5NaVCJxjpHKtlQqS
 qtUCz8OHVNFaDe0cHq3W+AloZZhcKVZ6qKVRaq1C5qGgNZ+JhEIvb6swJDJcbxoGyjb7H54m
 nUwAiWQy4HEhKYZJKfUgGdhwbck6AHvLuwgmmAYwe2EKY4JZAIde1eNrJabKIRaTaAAwdbyD
 zQRjABYYGtjLKg7pBvNSTMQytifdYaXl15W+ONnBho2GRM5ygkcehvllmSsFduRXMNeSssKz
 SBf40jDMWsZ80hdeK+zjMHgLfJIxssLj5F748P7E6pOc4fzoQzZjFgC7em5hjMYR/jn/M75s
 DMkXPNjfxogg6Q8n7idwGGwHx9uqCAY7wZm3Dau8BBan9LEYHA4HF9JW+c9hY2+WledaDVxh
 ea0nQ++A6e1lq76b4I3FEYzh+dCYs4Z3ww8T/astt8Hq/CniJhDo1o2mWzeabt0Iuv/d9IBV
 BLbRSnWUjA71VooU9KX/fjw0OqoCrJyMm78RWHI/ejQBjAuaAOTiAnv++c57Mlt+mDQ2jlZF
 S1RaOa1uAt7WfafhTltDo603p9BIRGJfodjHx0fsu99HJHDkJ9ZcldmSMqmGjqRpJa1aq8O4
 PKcEzFE2Nxev3zceQwTu/vSfR5dr8yebIkp2bd9nfLS57ja59afjxQVzAbpaMHNK3k1nfBnZ
 +e5Cb2mI5e6068usuMVdScfza2KulHvcPSoZEB3Fp429YwqvwCFPiSD/mqj8WZrtTQde5cXr
 b5o23jjRLXP5PZh1MN1iep8xa2zM3umRvDFLsn8DT3xa6H2ncD5kMj1e7uV1omqpLHM+zgYE
 F5R+08dvPphxvvv22BGXZwt5RKKDvtUibY5VnslSnlp0jHjzxeO8jNoNId9dNidpMJu/z13c
 0vH95pIdX3Ne1bVrdf09n+xluehen8vck2qHTxWrL9iPXXriGnv9rG6XIfj0nckcAUsdLhW5
 4Sq19F9IxoHduwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprAKsWRmVeSWpSXmKPExsWy7bCSvO4hsdnpBhP7TCx+vpzGaPFg3jY2
 i/N3DzFbrNl7jslizvkWFov5R86xWjw99ojd4uaBnUwWR04tYbK4t+gdq8X58xvYLS5s62O1
 2PT4GqvFw1fhFpd3zWGzmHF+H5NF17UnrBbz/q5ltTi2QMzi2+k3jBaLtn5ht/j/eiujxcMP
 e9gtZl3YwWpx5MwLZov/e3awWyx6sIDVQdpjy8qbTB5P+7eye+ycdZfdY8GmUo9NqzrZPDYv
 qffYueMzk8f7fVfZPPq2rGL0OLjP0OPpj73MHlv2f2b0+Nc0l93j8ya5AL4oLpuU1JzMstQi
 fbsEroyzc6ewFfwUrrh6eRpLA+NW/i5GTg4JAROJfZsfsnQxcnEICexmlHizaSk7REJS4lPz
 VFYIW1hi5b/n7BBFzxglrnQdYAZJsAloSSzq2wfWICKgK7H5xnIwm1ngJavE0TUREA1vGSVW
 PtnCCJLgFLCTWLpuNthUYQF/iWmXDoLZLAKqEs+2PmYBsXkFLCXaVl5lg7AFJU7OfMICMVRb
 ovdhKyOMvWzha2aI6xQkfj5dxgpxhJvEhcuTmCBqxCWO/uxhnsAoPAvJqFlIRs1CMmoWkpYF
 jCyrGCVTC4pz03OLDQuM8lLL9YoTc4tL89L1kvNzNzGCE42W1g7GPas+6B1iZOJgPMQowcGs
 JMIbe25GuhBvSmJlVWpRfnxRaU5q8SFGaQ4WJXHeb697U4QE0hNLUrNTUwtSi2CyTBycUg1M
 3OVbvh24Xx9z46iF5twNx3wUJLfnTZ49k7/nwDvGcy++rTv760GlvfR534SDB5Y2FWU2ul2c
 6LfmUniZRB+DrafvRrHQCebXah8Z8HPfOnJb3VZrR+Hs9MDPN0IU8+z/n+Lo0nqmedlddMax
 itOLSlISli/8uKgmaPXODV82zO8Olr5fXnv8xIkHe9cGHFLJcdY0Y7617oXB1ZaMPUJf1myd
 HjVPTbrwdN/eeaskWrb5S+XMObxldUCl1CX/ia7C3p/27wrz4DMLXv32tfr2z1fn8b5IviW2
 a91UrWUFLTMt7/q4fZpes7BCivFp7JLDygGt1/nqxd5J2pmEPHqVO6PjUGnu8QZpLuFWEcWl
 ukosxRmJhlrMRcWJALevC2mjAwAA
X-CMS-MailID: 20250130060554epcas5p4035cae282c2bf0df98d9d1086ec86c97
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250128102725epcas5p44b02ac2980a3aeb0016ce9fdef011ecf
References: <20250128102558.22459-1-swathi.ks@samsung.com>
 <CGME20250128102725epcas5p44b02ac2980a3aeb0016ce9fdef011ecf@epcas5p4.samsung.com>
 <20250128102558.22459-2-swathi.ks@samsung.com>
 <1da56c20-c522-428e-81ff-bc2f9ee0f524@kernel.org>
Cc: andrew@lunn.ch, jayati.sahu@samsung.com, edumazet@google.com,
 linux-fsd@tesla.com, alim.akhtar@samsung.com,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 linux-samsung-soc@vger.kernel.org, ssiddha@tesla.com, pankaj.dubey@samsung.com,
 joabreu@synopsys.com, kuba@kernel.org, pabeni@redhat.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, ravi.patel@samsung.com,
 richardcochran@gmail.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, rcsekar@samsung.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, gost.dev@samsung.com, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH v5 1/4] dt-bindings: net: Add FSD EQoS
 device tree bindings
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>



> -----Original Message-----
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: 28 January 2025 19:45
> To: Swathi K S <swathi.ks@samsung.com>; robh@kernel.org;
> davem@davemloft.net; edumazet@google.com; kuba@kernel.org;
> pabeni@redhat.com; conor+dt@kernel.org; richardcochran@gmail.com;
> mcoquelin.stm32@gmail.com; andrew@lunn.ch; alim.akhtar@samsung.com;
> linux-fsd@tesla.com
> Cc: netdev@vger.kernel.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-stm32@st-md-mailman.stormreply.com;
> linux-arm-kernel@lists.infradead.org; linux-samsung-soc@vger.kernel.org;
> alexandre.torgue@foss.st.com; peppe.cavallaro@st.com;
> joabreu@synopsys.com; rcsekar@samsung.com; ssiddha@tesla.com;
> jayati.sahu@samsung.com; pankaj.dubey@samsung.com;
> ravi.patel@samsung.com; gost.dev@samsung.com
> Subject: Re: [PATCH v5 1/4] dt-bindings: net: Add FSD EQoS device tree
> bindings
> 
> On 28/01/2025 11:25, Swathi K S wrote:
> > +  Tesla ethernet devices based on dwmmac support Gigabit ethernet.
> > +
> > +allOf:
> > +  - $ref: snps,dwmac.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: tesla,fsd-ethqos.yaml
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    minItems: 5
> > +    maxItems: 10
> 
> Why is this flexible?
> 
> Anyway, you need to list and describe the items instead of min/maxItems.
> 
> > +
> > +  clock-names:
> > +    minItems: 5
> > +    maxItems: 10
> 
> Same here.
> 
> > +
> > +  iommus:
> > +    maxItems: 1
> > +
> > +  phy-mode:
> > +    enum:
> > +     - rgmii-id
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - clock-names
> > +  - iommus
> > +  - phy-mode
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/fsd-clk.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +    ethernet_1: ethernet@14300000 {
> 
> Please implement last comment from Rob.

This label is used to enable the node in dts. Could see similar labels in other yaml files. Am I missing something here?

> 
> > +              compatible = "tesla,fsd-ethqos";
> > +              reg = <0x0 0x14300000 0x0 0x10000>;
> 
> And since there is going to be new version, switch to the preferred
> indentation (4-space). Other option is 2 spaces, but not 8.
> 
> > +...
> 
> 
> Best regards,
> Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

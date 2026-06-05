Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yMOnCeXfImquegEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 05 Jun 2026 16:40:37 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9365C648EAD
	for <lists+linux-stm32@lfdr.de>; Fri, 05 Jun 2026 16:40:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=HAB+w2Kh;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=kernel.org (policy=quarantine)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 498BBC87ED6;
	Fri,  5 Jun 2026 14:40:36 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EED53C01FB6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jun 2026 14:40:34 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 5F03040DC0;
 Fri,  5 Jun 2026 14:40:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13C291F00893;
 Fri,  5 Jun 2026 14:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1780670433;
 bh=HBdEaxKJ/QaWxr/2mdJ3GwGXzFp8BgaoQqxpPy/Cpgc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=HAB+w2Kho16GGymIhaGe5gcuYH/Kd65BNSM7PWtW/9HpWhab9RYvn2qg0mrGXTyRy
 rr9cURPmAh2E2CPwzX7JI76h9jDqwZ47+Njo+5WY7j01wCDdpzB6+BZPMeI0meBRUs
 CHCroh7yfhWYtIxPixkdavdjIV1kCU5b+DxiAbRCmtj1YmbbOyrFJNwhtmAmcoFv4p
 YChGrMdeB2HjIIeTIoPint6dghaOhpHGMlP0+p6Re5Yuqv9+R1Y6jd+/1AAyKyAgYQ
 2pEZqgE8IMbiwUkEmRy6E8V8ePnkT83CH+NLQX1tBELC9fdBzo9kei+2rE4LlvAuKl
 n53qncG7cbD+Q==
Date: Fri, 5 Jun 2026 09:40:32 -0500
From: Rob Herring <robh@kernel.org>
To: Alex Elder <elder@riscstar.com>
Message-ID: <20260605144032.GA3659201-robh@kernel.org>
References: <20260605010022.968612-1-elder@riscstar.com>
 <20260605010022.968612-11-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260605010022.968612-11-elder@riscstar.com>
Cc: me@ziyao.cc, ast@kernel.org, linux-kernel@vger.kernel.org,
 Daniel Thompson <daniel@riscstar.com>, chenchuangyu@xiaomi.com,
 edumazet@google.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, mohd.anwar@oss.qualcomm.com,
 weishangjuan@eswincomputing.com, daniel@iogearbox.net, chenhuacai@kernel.org,
 john.fastabend@gmail.com, maxime.chevallier@bootlin.com,
 siyanteng@cqsoftware.com.cn, sdf@fomichev.me, kuba@kernel.org,
 pabeni@redhat.com, konradybcio@kernel.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org, hawk@kernel.org, arnd@arndb.de, brgl@kernel.org,
 linux-arm-msm@vger.kernel.org, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 livelycarpet87@gmail.com, linux-gpio@vger.kernel.org,
 rmk+kernel@armlinux.org.uk, wens@kernel.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org,
 linusw@kernel.org, a0987203069@gmail.com, davem@davemloft.net,
 andrew+netdev@lunn.ch, boon.khai.ng@altera.com, mcoquelin.stm32@gmail.com,
 inochiama@gmail.com, krzk+dt@kernel.org, julianbraha@gmail.com,
 andersson@kernel.org, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next v2 10/14] dt-bindings: net:
 toshiba, tc9654-dwmac: add TC9564 Ethernet bridge
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [5.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20260515];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:elder@riscstar.com,m:me@ziyao.cc,m:ast@kernel.org,m:linux-kernel@vger.kernel.org,m:daniel@riscstar.com,m:chenchuangyu@xiaomi.com,m:edumazet@google.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:mohd.anwar@oss.qualcomm.com,m:weishangjuan@eswincomputing.com,m:daniel@iogearbox.net,m:chenhuacai@kernel.org,m:john.fastabend@gmail.com,m:maxime.chevallier@bootlin.com,m:siyanteng@cqsoftware.com.cn,m:sdf@fomichev.me,m:kuba@kernel.org,m:pabeni@redhat.com,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:hawk@kernel.org,m:arnd@arndb.de,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:livelycarpet87@gmail.com,m:linux-gpio@vger.kernel.org,m:rmk+kernel@armlinux.org.uk,m:wens@kernel.org,m:bpf@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:gregkh@linuxfoundation.org,m:linusw@kernel.org,m:a0987203069@gmail.com,m:
 davem@davemloft.net,m:andrew+netdev@lunn.ch,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:inochiama@gmail.com,m:krzk+dt@kernel.org,m:julianbraha@gmail.com,m:andersson@kernel.org,m:hkallweit1@gmail.com,m:johnfastabend@gmail.com,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[47];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[ziyao.cc,kernel.org,vger.kernel.org,riscstar.com,xiaomi.com,google.com,st-md-mailman.stormreply.com,oss.qualcomm.com,eswincomputing.com,iogearbox.net,gmail.com,bootlin.com,cqsoftware.com.cn,fomichev.me,redhat.com,arndb.de,altera.com,bp.renesas.com,armlinux.org.uk,lists.infradead.org,linuxfoundation.org,davemloft.net,lunn.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9365C648EAD

On Thu, Jun 04, 2026 at 08:00:17PM -0500, Alex Elder wrote:
> From: Daniel Thompson <daniel@riscstar.com>
> 
> Add devicetree bindings for the Toshiba TC956x family of Ethernet-AVB/TSN
> bridges.
> 
> The TC9564 contains a PCIe switch with one upstream and three downstream
> PCIe ports.  The third PCIe downstream port has an attached embedded PCIe
> endpoint, and that endpoint implements two PCIe functions.  Each internal
> PCIe function has a Synopsys XGMAC Ethernet interface capable of 10 Gbps
> operation.
> 
> The TC9564 also implements an embedded GPIO controller, which exposes
> 10 lines externally.  Some platforms use these GPIO lines, so this
> GPIO controller is managed by a separate driver.  Other embedded
> peripherals (like a microcontroller, SRAM, and UART) are currently
> unused.
> 
> The GPIO controller is managed by registers accessed via MMIO on an
> internal PCIe function's registers.
> 
> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  .../bindings/net/toshiba,tc9564-dwmac.yaml    | 120 ++++++++++++++++++
>  MAINTAINERS                                   |   6 +
>  2 files changed, 126 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/toshiba,tc9564-dwmac.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/toshiba,tc9564-dwmac.yaml b/Documentation/devicetree/bindings/net/toshiba,tc9564-dwmac.yaml
> new file mode 100644
> index 0000000000000..6e7a63dfcf86a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/toshiba,tc9564-dwmac.yaml
> @@ -0,0 +1,120 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/toshiba,tc9564-dwmac.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Toshiba TC956x Ethernet-AVB/TSN Controller
> +
> +maintainers:
> +  - Alex Elder <elder@riscstar.com>
> +  - Daniel Thompson <daniel@riscstar.com>
> +
> +description: |
> +  The Toshiba TC9564 (and more generally, TC956x) incorporates a PCIe
> +  gen 3 switch with one upstream and three downstream ports.  The first
> +  two downstream ports are exposed externally, while the third is used
> +  by an internal PCIe endpoint.  The PCIe endpoint implements two PCIe
> +  functions, and attached to each of these is a 10 Gbps capable Synopsys
> +  Ethernet controller.
> +
> +  The TC956x additionally implements other internal IP blocks, and in
> +  particular it implements a GPIO controller.  Ten of the 35 GPIO lines
> +  implemented are exposed externally and are usable by the platform.
> +  It is platform-dependent whether the GPIO function must be exposed,
> +  and if it is, PCIe function 0 supplies it.
> +
> +              ----------------------------------
> +              |              Host              |
> +              ------+...+----------+........+---
> +                    |i2c|          |  PCIe  |
> +    ----------------+...+----------+........+------
> +    | TC956x        |I2C|          |upstream|     |
> +    |               -----        --+--------+---  |
> +    |  -----  ------  -------    | PCIe switch |  |
> +    |  |SPI|  |GPIO|  |reset|    |             |  |
> +    |  -----  ------  |clock|    | DS3 DS2 DS1 |  |
> +    |                 -------    ---++--++--++--  |
> +    |  -----  ------     downstream//    \\  \\   |  downstream
> +    |  |MCU|  |SRAM|    /==========/      \\  \===== PCIe port 1
> +    |  -----  ------   //PCIe port 3       \\     |
> +    |                  ||                   \======= downstream
> +    |  ----+-----------++-----------+----         |  PCIe port 2
> +    |  | M | internal PCIe endpoint | M |         |
> +    |  | S |------------------------| S |  ------ |
> +    |  | I |   PCIe   |  |   PCIe   | I |  |UART| |
> +    |  | G |function 0|  |function 1| G |  ------ |

I don't see nodes for these PCI functions. Boot this platform with 
CONFIG_PCI_DYNAMIC_OF_NODES enabled and use the resulting DT node 
structure. Anything else is wrong. This will give you the DTS:

dtc -O dts /proc/device-tree

The ethernet nodes should be just these PCI function nodes. You need to 
make the DWMAC PCI driver (stmmac_pci.c) bind to those 2 PCI devices. 
And really, a DT node for them should be completely optional (unless 
there's some power on ctrl needed).

Everything else like SPI, GPIO, UART, etc. should be under the PCIe 
switch upstream node in a pci-ep-bus.


> +    |  | E |----++----|  |----++----| E |         |
> +    |  | N |  eMAC 0  |  |  eMAC 1  | N |         |
> +    --------+.......+------+.....+-----------------
> +            |USXGMII|      |SGMII|
> +          --+.......+--  --+.....+--
> +          |  ARQ113C  |  | QEP8121 |
> +          |    PHY    |  |   PHY   |
> +          -------------  -----------
> +
> +properties:
> +  compatible:
> +    enum:
> +      - pci1179,0220 # Toshiba TC9564 (a.k.a. Qualcomm QPS615)
> +
> +  gpio:
> +    type: object
> +    description: Embedded GPIO controller
> +    $ref: /schemas/gpio/gpio.yaml#

gpio.yaml alone does not define a GPIO controller. How many #gpio-cells 
needs to be defined.

Is there no address associated with the controller? 

> +
> +  ethernet:
> +    type: object
> +    description: XGMAC Ethernet controller
> +    $ref: /schemas/net/ethernet-controller.yaml#
> +    properties:
> +      mdio:
> +        $ref: snps,dwmac.yaml#/properties/mdio

Either all of snps,dwmac.yaml should apply or none of it. Generally, we 
only reference whole schema files (OF graph being a notable exception).

> +    required:
> +      - mdio
> +
> +required:
> +  - compatible
> +
> +allOf:
> +  - $ref: /schemas/pci/pci-device.yaml#
> +  - $ref: /schemas/pci/pci-bus-common.yaml#

These 2 are just pci-pci-bridge.yaml.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

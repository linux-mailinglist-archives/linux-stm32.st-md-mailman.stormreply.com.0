Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hOJJI9AfImoLSwEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 05 Jun 2026 03:01:04 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D512064434F
	for <lists+linux-stm32@lfdr.de>; Fri, 05 Jun 2026 03:01:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=riscstar-com.20251104.gappssmtp.com header.s=20251104 header.b=SdsywYre;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=riscstar.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0692C8F273;
	Fri,  5 Jun 2026 01:01:02 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EF056C8F272
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jun 2026 01:01:00 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id
 5614622812f47-486118ecd5dso877149b6e.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 04 Jun 2026 18:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1780621260; x=1781226060;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/ZIGHz/o3y+3ogj7r6nfssUl4myckUIIzkFFbrT9qoc=;
 b=SdsywYreVtTrLiRaaNVEaIyI8DnQieD8m/SN3qHMYRKOQkCWHydYiELIP/YdJHv3Pb
 YAX2P6M8NYvbk550naWf0IdUVPQFR2RedSD7/o4q84hxBnxP/GTTpEIERz62j0pbDlba
 MEvNXobH+sGwPE/f8p7caWsiEg6qrzvtBwpdS0L/V0f9+Z2AbmLn+2YFIyhj1eErWsVI
 bGne7dhYO96T75yk2Pa3j5T8l5TBffrbAvbhM8xt5htyRkN62QLN+GGfuqWMTYhj7zX1
 AzeROvoWHqsuxrmx3BxYWP+pjkJahZdneVyIiuds4ciMC4cnvFQP5SlMNFGa3sylj6cZ
 akHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780621260; x=1781226060;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/ZIGHz/o3y+3ogj7r6nfssUl4myckUIIzkFFbrT9qoc=;
 b=gluOSQsYAdHHQkc0wLoJVyM17GRg/X2URG5AwylN/mgg3NKNzxuUc0KIq03MdEmfuV
 efEbk4LySMvwjoQlKH7Genh9aM91kBy+UwgjqA/jRLbiAqMwey2l+Cr7+fsWqmfN5+90
 hSXUr8WgSTQS6r+oKmvWUsJ522V6kx+8jEv0ewkGIbmdtN6A5CT47rzymN7GArJdMn6v
 EZpQvsTA70QNv2+kV4XyUuyPPCiqY/b4PNlBTU69syG5+wbKMhQSyznRRoPHuDbjDDsG
 XJWAgDcBodtX0vK4U+yDcbv+bVNPg77ujfhYS89UfBOdjuqQMZyx/+1D+7EUEGim+KMP
 9b0w==
X-Forwarded-Encrypted: i=1;
 AFNElJ+D2Rd3i0SXaOIcpnHlJLUw897H9sxV1uJ0fhecGngdy4HXRGNRWphFmtHHksvr3tfIbQDwomsQO1Mseg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx0KHd8h35ZPqC9OB3gGb61qF+S8jrL4wTHIYND8c/Y3pr7tig/
 IikcWj/j91R2KXrBnJbzK2VP6ioKt4p8DzYRhNgxrUCeJjXrpxF3eHf6Q87EuBjDVcU=
X-Gm-Gg: Acq92OGE4bbrnNu6wsFFMVUYuLNd9tpfyO2CaeBMb/oINhyfmcWWRB+zQ0mzAvz4tyz
 G2J4t70wL0YJrTzAY982Z8L2QqoNdzg5mIG0DbsXDN/6FVr9Gx7OfihQSmgFl/WJ7V7gzlOHuhs
 VpgQltu9DylRXubkt4OHbZyNwaJ1K5lPVZ7QP4o3Qfc7Gci1eR7SKZpA/C7YuDAsROE3Cn2Y9KD
 +Tw9wxbqRYGl3DhYIBcyieNzkruL4kVx0/lmrkQRqEBU34aupOzOBwGM8o7a8z98Bla7FtfFHUD
 /gP6HABd5dtK5oywbhGM/cchlrjOrgTUj+p36MrRw+muXpwz3OnbBIB2tw996z1zP9KJm53MJHV
 pUO1/GOQe8bQWMlTVSQMwShQ8ysZFVN9xtAXbG2aD+iiw813G3+t8NR74Jk+t/y4X1XOkR7/Pvm
 XCPVuXiaDcdyhVTCSEzYUOZiIsxIftyBa4U0LYTg==
X-Received: by 2002:a05:6808:11cb:b0:467:de0e:feb6 with SMTP id
 5614622812f47-4868dc583f1mr883548b6e.11.1780621259486; 
 Thu, 04 Jun 2026 18:00:59 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-4865b6ec694sm5544631b6e.5.2026.06.04.18.00.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2026 18:00:59 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com,
 rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linusw@kernel.org, brgl@kernel.org, arnd@arndb.de,
 gregkh@linuxfoundation.org
Date: Thu,  4 Jun 2026 20:00:17 -0500
Message-ID: <20260605010022.968612-11-elder@riscstar.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260605010022.968612-1-elder@riscstar.com>
References: <20260605010022.968612-1-elder@riscstar.com>
MIME-Version: 1.0
Cc: me@ziyao.cc, linux-kernel@vger.kernel.org,
 Daniel Thompson <daniel@riscstar.com>, chenchuangyu@xiaomi.com,
 linux-stm32@st-md-mailman.stormreply.com, mohd.anwar@oss.qualcomm.com,
 weishangjuan@eswincomputing.com, daniel@iogearbox.net, chenhuacai@kernel.org,
 john.fastabend@gmail.com, siyanteng@cqsoftware.com.cn, sdf@fomichev.me,
 devicetree@vger.kernel.org, hawk@kernel.org, elder@riscstar.com,
 linux-arm-msm@vger.kernel.org, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 livelycarpet87@gmail.com, ast@kernel.org, linux-gpio@vger.kernel.org,
 wens@kernel.org, linux-arm-kernel@lists.infradead.org, inochiama@gmail.com,
 a0987203069@gmail.com, boon.khai.ng@altera.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, bpf@vger.kernel.org, julianbraha@gmail.com,
 hkallweit1@gmail.com
Subject: [Linux-stm32] [PATCH net-next v2 10/14] dt-bindings: net: toshiba,
	tc9654-dwmac: add TC9564 Ethernet bridge
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
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:maxime.chevallier@bootlin.com,m:rmk+kernel@armlinux.org.uk,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:me@ziyao.cc,m:linux-kernel@vger.kernel.org,m:daniel@riscstar.com,m:chenchuangyu@xiaomi.com,m:linux-stm32@st-md-mailman.stormreply.com,m:mohd.anwar@oss.qualcomm.com,m:weishangjuan@eswincomputing.com,m:daniel@iogearbox.net,m:chenhuacai@kernel.org,m:john.fastabend@gmail.com,m:siyanteng@cqsoftware.com.cn,m:sdf@fomichev.me,m:devicetree@vger.kernel.org,m:hawk@kernel.org,m:elder@riscstar.com,m:linux-arm-msm@vger.kernel.org,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:livelycarpet87@gmail.com,m:ast@kernel.org,m:linux-gpio@vger.kernel.org,m:wens@kernel.org,m:li
 nux-arm-kernel@lists.infradead.org,m:inochiama@gmail.com,m:a0987203069@gmail.com,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:bpf@vger.kernel.org,m:julianbraha@gmail.com,m:hkallweit1@gmail.com,m:andrew@lunn.ch,m:rmk@armlinux.org.uk,m:krzk@kernel.org,m:conor@kernel.org,m:johnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[ziyao.cc,vger.kernel.org,riscstar.com,xiaomi.com,st-md-mailman.stormreply.com,oss.qualcomm.com,eswincomputing.com,iogearbox.net,kernel.org,gmail.com,cqsoftware.com.cn,fomichev.me,altera.com,bp.renesas.com,lists.infradead.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[48];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[elder@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[riscstar.com:mid,riscstar.com:from_mime,riscstar.com:email,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,devicetree.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D512064434F

From: Daniel Thompson <daniel@riscstar.com>

Add devicetree bindings for the Toshiba TC956x family of Ethernet-AVB/TSN
bridges.

The TC9564 contains a PCIe switch with one upstream and three downstream
PCIe ports.  The third PCIe downstream port has an attached embedded PCIe
endpoint, and that endpoint implements two PCIe functions.  Each internal
PCIe function has a Synopsys XGMAC Ethernet interface capable of 10 Gbps
operation.

The TC9564 also implements an embedded GPIO controller, which exposes
10 lines externally.  Some platforms use these GPIO lines, so this
GPIO controller is managed by a separate driver.  Other embedded
peripherals (like a microcontroller, SRAM, and UART) are currently
unused.

The GPIO controller is managed by registers accessed via MMIO on an
internal PCIe function's registers.

Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../bindings/net/toshiba,tc9564-dwmac.yaml    | 120 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 2 files changed, 126 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/toshiba,tc9564-dwmac.yaml

diff --git a/Documentation/devicetree/bindings/net/toshiba,tc9564-dwmac.yaml b/Documentation/devicetree/bindings/net/toshiba,tc9564-dwmac.yaml
new file mode 100644
index 0000000000000..6e7a63dfcf86a
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/toshiba,tc9564-dwmac.yaml
@@ -0,0 +1,120 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/toshiba,tc9564-dwmac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Toshiba TC956x Ethernet-AVB/TSN Controller
+
+maintainers:
+  - Alex Elder <elder@riscstar.com>
+  - Daniel Thompson <daniel@riscstar.com>
+
+description: |
+  The Toshiba TC9564 (and more generally, TC956x) incorporates a PCIe
+  gen 3 switch with one upstream and three downstream ports.  The first
+  two downstream ports are exposed externally, while the third is used
+  by an internal PCIe endpoint.  The PCIe endpoint implements two PCIe
+  functions, and attached to each of these is a 10 Gbps capable Synopsys
+  Ethernet controller.
+
+  The TC956x additionally implements other internal IP blocks, and in
+  particular it implements a GPIO controller.  Ten of the 35 GPIO lines
+  implemented are exposed externally and are usable by the platform.
+  It is platform-dependent whether the GPIO function must be exposed,
+  and if it is, PCIe function 0 supplies it.
+
+              ----------------------------------
+              |              Host              |
+              ------+...+----------+........+---
+                    |i2c|          |  PCIe  |
+    ----------------+...+----------+........+------
+    | TC956x        |I2C|          |upstream|     |
+    |               -----        --+--------+---  |
+    |  -----  ------  -------    | PCIe switch |  |
+    |  |SPI|  |GPIO|  |reset|    |             |  |
+    |  -----  ------  |clock|    | DS3 DS2 DS1 |  |
+    |                 -------    ---++--++--++--  |
+    |  -----  ------     downstream//    \\  \\   |  downstream
+    |  |MCU|  |SRAM|    /==========/      \\  \===== PCIe port 1
+    |  -----  ------   //PCIe port 3       \\     |
+    |                  ||                   \======= downstream
+    |  ----+-----------++-----------+----         |  PCIe port 2
+    |  | M | internal PCIe endpoint | M |         |
+    |  | S |------------------------| S |  ------ |
+    |  | I |   PCIe   |  |   PCIe   | I |  |UART| |
+    |  | G |function 0|  |function 1| G |  ------ |
+    |  | E |----++----|  |----++----| E |         |
+    |  | N |  eMAC 0  |  |  eMAC 1  | N |         |
+    --------+.......+------+.....+-----------------
+            |USXGMII|      |SGMII|
+          --+.......+--  --+.....+--
+          |  ARQ113C  |  | QEP8121 |
+          |    PHY    |  |   PHY   |
+          -------------  -----------
+
+properties:
+  compatible:
+    enum:
+      - pci1179,0220 # Toshiba TC9564 (a.k.a. Qualcomm QPS615)
+
+  gpio:
+    type: object
+    description: Embedded GPIO controller
+    $ref: /schemas/gpio/gpio.yaml#
+
+  ethernet:
+    type: object
+    description: XGMAC Ethernet controller
+    $ref: /schemas/net/ethernet-controller.yaml#
+    properties:
+      mdio:
+        $ref: snps,dwmac.yaml#/properties/mdio
+    required:
+      - mdio
+
+required:
+  - compatible
+
+allOf:
+  - $ref: /schemas/pci/pci-device.yaml#
+  - $ref: /schemas/pci/pci-bus-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    pcie {
+        #address-cells = <3>;
+        #size-cells = <2>;
+
+        pci@0,0 {
+            compatible = "pci1179,0220";
+            reg = <0x50000 0x0 0x0 0x0 0x0>;
+            #address-cells = <3>;
+            #size-cells = <2>;
+            device_type = "pci";
+            ranges;
+
+            gpio {
+                  gpio-controller;
+                  #gpio-cells = <2>;
+            };
+
+            ethernet {
+                phy-mode = "10gbase-r";
+                phy-handle = <&tc9564_emac0_phy>;
+
+                mdio {
+                  compatible = "snps,dwmac-mdio";
+                  #address-cells = <1>;
+                  #size-cells = <0>;
+
+                  tc9564_emac0_phy: ethernet-phy@1c {
+                      compatible = "ethernet-phy-id311c.1c12";
+                      reg = <0x1c>;
+                  };
+              };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 2aa6ea012c848..f976c9fa9d9c0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27052,6 +27052,12 @@ F:	Documentation/devicetree/bindings/media/i2c/toshiba,tc358743.txt
 F:	drivers/media/i2c/tc358743*
 F:	include/media/i2c/tc358743.h
 
+TOSHIBA TC956X/QUALCOMM QPS615 DWMAC ETHERNET DRIVER
+M:	Alex Elder <elder@kernel.org>
+M:	Daniel Thompson <danielt@kernel.org>
+S:	Maintained
+F:	Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml
+
 TOSHIBA WMI HOTKEYS DRIVER
 M:	Azael Avalos <coproscefalo@gmail.com>
 L:	platform-driver-x86@vger.kernel.org
-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

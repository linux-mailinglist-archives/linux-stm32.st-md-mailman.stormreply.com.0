Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id pX/4DH6T+GnEwgIAu9opvQ:T3
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 04 May 2026 14:39:27 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 630824BD033
	for <lists+linux-stm32@lfdr.de>; Mon, 04 May 2026 14:39:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 204D3C60465;
	Mon,  4 May 2026 12:39:27 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7E4ECC8F26F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 May 2026 15:54:55 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id
 6a1803df08f44-8acb3daf2aaso30532716d6.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 01 May 2026 08:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777650894; x=1778255694;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YQxIO0Y/h8byqARAs3DXDHZ5gcHRkK0ijPD4wFq7rUk=;
 b=ponrIf1GgwcQz9BQxEPNV4O10QXcxinwF2uu4zliZIGH83Miy83YUnawnPWqArrlYe
 aazNsse8wGhprfI17jaW9JbBTzCFkTAlrTRA3Blb4detj/5l5O5tXa88FoTKCIpZ7JWj
 HYQwJjV7GpGW7Nocr5UjR0a/u5DAR0uGqttgny576wOhBvfYH4vX8Hr4nWgqF/jaQF1W
 pPh8zeYL72mAohs4Eo/gq0HQTaIaOgIhQ3lq0yQ4t7iMweq+9kmze9+wekHHTO45Bdzn
 3uzIHKpixW1BefSbjPgUb1fo2r6K7CisRWVs+G1LmVR27f64Dh6xZq8EUHZoCzW3nh74
 JelQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777650894; x=1778255694;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YQxIO0Y/h8byqARAs3DXDHZ5gcHRkK0ijPD4wFq7rUk=;
 b=IjbnI2LTebkVqzhw1FAwjd7wh6XXEDFvyJdPl7gNp3cFlmNrCEpsbuOh2eMcft1mHo
 FGwxu6iMjaw7b0wp07vSqAHNV9uIr+ctdov0SmcWz8XSzpyl/pHMS4Goonf/THVKvVBi
 cc/Atcy8kKPI1/sW1Vw2eoLzaim0QqKEqnUPXebVJgWgSATV/N/Y6E4+2XY5arODvEhd
 FAMMcfzkYjiAzMib+ITwf4l2YHSsLsIGfgUX7CeGppdChl8f3jvW+nRnodRymVxpfTnl
 3E9YjrkNAkxC7rXdYVPW4wmTKkw1C0nrGMGPUO48JjEoSbd1R8C5bTUgZcB6SDKeHcaB
 jVGg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9dCw0Eqvrq8LxzxokYnJjlRoNs7XnoOt+k6lNu2DoQdqOpBThp0vQt6cEHRLNgKG0v+CTVe434R4Q99A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy2TWPwvAdNMkmwZivZ5zCnzGiAaHsRU8SSd/RZpzR34auf2Fnw
 2CQ1ej9++S/V6rKepfsSYGU98GvG5BZyv9xIHA0CV0jx7gfePre06KOteofB41+o4lQ=
X-Gm-Gg: AeBDieui8zOExPInhKEAGeN4LgxN3SrVdF0PI7tAl98HCOG2Fie1IR0XpAHryXequQB
 16tsaLgh2W2cLiIh0OBO1P8AGBC8ut91fGC2ugGUiaNcjlavPps2vX5gTUngJENSfc5d126/1Vz
 6tsocaTcbfEMQJMRr8VYt8D74pqZbgbniq7t77VozjNAGGtP+HJiOjLm26/dyNJ1svD0ifIF1+2
 0PX+j5o0IQX7lRQkYO+x32lkhMMF0h4PpXamseEFRc4ep4hnxjPr64j+x/VccAYIqYag/hU0xLZ
 p83iN6aM+t3Q/HkGnqZLcE4i1HoJiV7QXephuc3vIVbTZB0gkkUgz9SmtqA4Md7vNaXdBEqUmsE
 zlpzxfumRJMir7pE17eROY3kYznIiSqPnR+OIPbR8+Z8SVGg8ucOrKYT9HROmtPBuNqC4qnxvtI
 MnGI00W6pn0WNpyRibhlXwMJlSgwcijs2x3ntRoQXjUy68/hhSTSRoNCtm23GVJ2B569+kiRo/A
 WdcDA==
X-Received: by 2002:a05:6214:54c9:b0:8a6:f065:3ef9 with SMTP id
 6a1803df08f44-8b6664fcf69mr1373226d6.15.1777650894371; 
 Fri, 01 May 2026 08:54:54 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net.
 [75.72.117.212]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8b539aa7293sm26615406d6.22.2026.05.01.08.54.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 May 2026 08:54:53 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com,
 rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linusw@kernel.org, brgl@kernel.org, arnd@arndb.de,
 gregkh@linuxfoundation.org
Date: Fri,  1 May 2026 10:54:16 -0500
Message-ID: <20260501155421.3329862-9-elder@riscstar.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260501155421.3329862-1-elder@riscstar.com>
References: <20260501155421.3329862-1-elder@riscstar.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 04 May 2026 12:39:23 +0000
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
 matthew.gerlach@altera.com, hkallweit1@gmail.com
Subject: [Linux-stm32] [PATCH net-next 08/12] dt-bindings: net: toshiba,
	tc965x-dwmac: add TC956x Ethernet bridge
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
X-Rspamd-Queue-Id: 630824BD033
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [9.19 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	DATE_IN_PAST(1.00)[68];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:maxime.chevallier@bootlin.com,m:rmk+kernel@armlinux.org.uk,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:me@ziyao.cc,m:linux-kernel@vger.kernel.org,m:daniel@riscstar.com,m:chenchuangyu@xiaomi.com,m:linux-stm32@st-md-mailman.stormreply.com,m:mohd.anwar@oss.qualcomm.com,m:weishangjuan@eswincomputing.com,m:daniel@iogearbox.net,m:chenhuacai@kernel.org,m:john.fastabend@gmail.com,m:siyanteng@cqsoftware.com.cn,m:sdf@fomichev.me,m:devicetree@vger.kernel.org,m:hawk@kernel.org,m:elder@riscstar.com,m:linux-arm-msm@vger.kernel.org,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:livelycarpet87@gmail.com,m:ast@kernel.org,m:linux-gpio@vger.kernel.org,m:wens@kernel.org,m:li
 nux-arm-kernel@lists.infradead.org,m:inochiama@gmail.com,m:a0987203069@gmail.com,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:bpf@vger.kernel.org,m:julianbraha@gmail.com,m:matthew.gerlach@altera.com,m:hkallweit1@gmail.com,m:andrew@lunn.ch,m:rmk@armlinux.org.uk,m:krzk@kernel.org,m:conor@kernel.org,m:johnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[49];
	FORGED_SENDER(0.00)[elder@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[ziyao.cc,vger.kernel.org,riscstar.com,xiaomi.com,st-md-mailman.stormreply.com,oss.qualcomm.com,eswincomputing.com,iogearbox.net,kernel.org,gmail.com,cqsoftware.com.cn,fomichev.me,altera.com,bp.renesas.com,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.741];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:52.209.6.89:c];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel,dt];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,devicetree.org:url,stm-ict-prod-mailman-01.stormreply.prv:helo,0.0.0.0:email,1c:email]
X-Spam: Yes

From: Daniel Thompson <daniel@riscstar.com>

Add devicetree bindings for the Toshiba TC956x family of Ethernet-AVB/TSN
bridges.

Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../bindings/net/toshiba,tc956x-dwmac.yaml    | 111 ++++++++++++++++++
 1 file changed, 111 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml

diff --git a/Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml b/Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml
new file mode 100644
index 0000000000000..d95d22a3761da
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml
@@ -0,0 +1,111 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/toshiba,tc956x-dwmac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Toshiba TC956x Ethernet-AVB/TSN Controller
+
+maintainers:
+  - Alex Elder <elder@riscstar.com>
+  - Daniel Thompson <daniel@riscstar.com>
+
+description: |
+  This node provides properties for configuring the Ethernet PCI functions
+  that are attached to the internal downstream port of the TC956x's PCIe
+  switch.
+
+  TC956x are a family of Ethernet-AVB/TSN bridge chips that combine a PCIe
+  switch together with a number of Ethernet controllers. These bindings
+  cover only the Ethernet functions of these devices.
+
+allOf:
+  - $ref: /schemas/pci/pci-bus-common.yaml#
+  - $ref: /schemas/pci/pci-device.yaml#
+
+unevaluatedProperties: false
+
+properties:
+  compatible:
+    enum:
+      - pci1179,0220 # Toshiba TC9564 (a.k.a. Qualcomm QPS615)
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-controller: true
+
+  # We can't allOf reference Ethernet-controller.yaml because we end up with
+  # contradictory $nodename rules (`ethernet@` versus `pci@`). Happily only a
+  # small number of the properties are useful on TC956x so we can just reference
+  # what we need.
+  phy-connection-type:
+    $ref: ethernet-controller.yaml#/properties/phy-connection-type
+
+  phy-handle:
+    $ref: ethernet-controller.yaml#/properties/phy-handle
+
+  phy-mode:
+    $ref: ethernet-controller.yaml#/properties/phy-mode
+
+  mdio:
+    $ref: snps,dwmac.yaml#/properties/mdio
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    pcie {
+      #address-cells = <3>;
+      #size-cells = <2>;
+
+      tc956x_emac0: pci@0,0 {
+        compatible = "pci1179,0220";
+        reg = <0x50000 0x0 0x0 0x0 0x0>;
+        #address-cells = <3>;
+        #size-cells = <2>;
+        device_type = "pci";
+        ranges;
+
+        gpio-controller;
+        #gpio-cells = <2>;
+
+        phy-mode = "10gbase-r";
+        phy-handle = <&tc956x_emac0_phy>;
+
+        mdio {
+          compatible = "snps,dwmac-mdio";
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          tc956x_emac0_phy: ethernet-phy@1c {
+            compatible = "ethernet-phy-id311c.1c12";
+            reg = <0x1c>;
+          };
+        };
+      };
+      pci@0,1 {
+        compatible = "pci1179,0220";
+        reg = <0x50100 0x0 0x0 0x0 0x0>;
+        #address-cells = <3>;
+        #size-cells = <2>;
+        device_type = "pci";
+        ranges;
+
+        phy-mode = "sgmii";
+        phy-handle = <&tc956x_emac1_phy>;
+
+        mdio {
+          compatible = "snps,dwmac-mdio";
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          tc956x_emac1_phy: ethernet-phy@1c {
+            compatible = "ethernet-phy-id004d.d101";
+            reg = <0x1c>;
+          };
+        };
+      };
+    };
-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

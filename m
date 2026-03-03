Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KB7BG5MzpmlJMQAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 03 Mar 2026 02:04:19 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F22E31E776A
	for <lists+linux-stm32@lfdr.de>; Tue, 03 Mar 2026 02:04:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5FF27C3F944;
	Tue,  3 Mar 2026 01:04:18 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B078C35E3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Mar 2026 01:04:16 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-82746ed8cdcso3102686b3a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 02 Mar 2026 17:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772499855; x=1773104655;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=LJfO34USsvCpv1UH9qU1hYEgkmphxj2R3COc9IPiZ2A=;
 b=Jr3gGovSVm0gyswX9oTGWN1Mw92r6P45PBYfvsoo9bYzw4okC4JQRx2okQIOw2oo3t
 V+p77RbX8IvMp/skXT7ahJtFZP+3Y1wtpVgD4koHLnKUTzM5uvPoG0EiAnn3bq1ASblb
 HZyMefGeVp8w0hT6+0z3zNb/EQmiLXnVOiOPnN25W2o1feVpoiJ6BJkyZqdlGyQh1IuB
 tY+hy7YxqO3IzP2sdZshCVw/GQT0Z9iIZiuyfKAfhnK0bAImO0+AAuNq6PtOeJvhw5rl
 1bKgbHjUhWQZZQ9fMcQMXzrR27hHrIHrlQs2IEbFbl64Yzox4FJqQDOiv5+M5eKNx6oQ
 +5OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772499855; x=1773104655;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LJfO34USsvCpv1UH9qU1hYEgkmphxj2R3COc9IPiZ2A=;
 b=WLTL2vWTzADjVaJ7bk78kCgpSS3tpEgL0RyC7ttoMRwFTA0ktFe478yTfFuls3Wle/
 zmJp5b0ojmgLrq2/TLSnvmmQc42lUSEDSQwckgCjcsSoEbQROzrr0GZwLsA3+SEF8Laj
 ca08yZDHt1LhSHiLXmt76q3DV50GaAK4QsMwgEQuJBjHQkf5FuUMuBPsLGRkzF2IfjY7
 62yCHNimslwi41LmdsgXYJhocX4426Cdz4Akfopk7Mncg9uc/tj+Iu0EEU8deAZbc650
 gkACclzGaHaoLlmygGj0pd9zbchDOflSRteH7Ay7FcgQfRA0fE9MUZRIkBhpS7fjCv9n
 bIUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXD0n6SKY0945KDbwH00Chd9VLGG9UbgchhFacH9G8xh8xu7Y9Xa5UsnAgYrCrSB1DCyG40Y5LoUWgVHQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yye6fH4ehMkvoCliIZTVJwyoW9OX6g+/P8wrYQGigJq6L9p1+6C
 CszNxW12+4FR/23eRrl1Auryc/yPWrhl8SVXIkj4u4HK1FpEmwLuR7eR
X-Gm-Gg: ATEYQzxvo7nmIFn/KcALs3TTK83TTRL1L4qR4Dja3O3HpicLzHzbfVhmvttRYIkb/48
 7xmFGGXcFEjxPNimHArxXdFiqwSISXphbrTFXx5z7UHgCU//cOJfAn6WgkBGRRDla+25E5aMSSY
 QXTtILXVE8hi+exBHJaXUZOBWfRGkOPrkTfClbdWUKm1Xf2y44pWai8ND8ZoP84vmD9RTF/mGW/
 sNSH49jXA7POXmG9Et/dQ4eK21m0Sw4Pw2dJu9H02VfyfUAmdEwloqPXwFqwmnGCGoQQBNlE5ug
 PFPcUvJ63F3aR3DJg20Ijgy01iLQAWrc+YNPVxNulQlLWtu0yEztoDEk8TtwzCRUpGIU9kpQ5by
 2GUlz0V5Rp+KUcE9X7Uonf8310TwI1lBKj1psUOZxgBRJ1IjJATAEenbCdpfreML488Z923I3cx
 fgIFR+PCbDBJiXF0+CQk//8g==
X-Received: by 2002:a17:90b:578d:b0:343:e2ba:e8be with SMTP id
 98e67ed59e1d1-35965c3c945mr12250080a91.10.1772499855342; 
 Mon, 02 Mar 2026 17:04:15 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3599c49eb5bsm361668a91.11.2026.03.02.17.04.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2026 17:04:14 -0800 (PST)
Date: Tue, 3 Mar 2026 09:03:46 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Boon Khai Ng <boon.khai.ng@altera.com>, 
 Chen-Yu Tsai <wens@kernel.org>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>, 
 Conor Dooley <conor+dt@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Inochi Amaoto <inochiama@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
 Jose Abreu <joabreu@synopsys.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paolo Abeni <pabeni@redhat.com>, Paul Walmsley <pjw@kernel.org>, 
 Quentin Schulz <quentin.schulz@cherry.de>,
 Richard Cochran <richardcochran@gmail.com>, 
 Rob Herring <robh@kernel.org>, Shangjuan Wei <weishangjuan@eswincomputing.com>,
 Yanteng Si <siyanteng@cqsoftware.com.cn>, Yao Zi <me@ziyao.cc>,
 Yixun Lan <dlan@kernel.org>
Message-ID: <aaYyUAaz7cSnBXl9@inochi.infowork>
References: <20260227075718.2243818-1-inochiama@gmail.com>
 <CAJM55Z_soPhC9P03edfq_A-GN07PbGqu31aHgE_5kKhkQwkMmQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJM55Z_soPhC9P03edfq_A-GN07PbGqu31aHgE_5kKhkQwkMmQ@mail.gmail.com>
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Longbin Li <looong.bin@gmail.com>, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v5 0/3] riscv: spacemit: Add
 ethernet support for K3
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
X-Rspamd-Queue-Id: F22E31E776A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:emil.renner.berthing@canonical.com,m:rmk+kernel@armlinux.org.uk,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:alexandre.torgue@foss.st.com,m:andrew+netdev@lunn.ch,m:boon.khai.ng@altera.com,m:wens@kernel.org,m:yong.liang.choong@linux.intel.com,m:conor+dt@kernel.org,m:davem@davemloft.net,m:edumazet@google.com,m:peppe.cavallaro@st.com,m:inochiama@gmail.com,m:kuba@kernel.org,m:joabreu@synopsys.com,m:krzk+dt@kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:maxime.chevallier@bootlin.com,m:mcoquelin.stm32@gmail.com,m:palmer@dabbelt.com,m:pabeni@redhat.com,m:pjw@kernel.org,m:quentin.schulz@cherry.de,m:richardcochran@gmail.com,m:robh@kernel.org,m:weishangjuan@eswincomputing.com,m:siyanteng@cqsoftware.com.cn,m:me@ziyao.cc,m:dlan@kernel.org,m:devicetree@vger.kernel.org,m:dlan@gentoo.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:looong.bin@gmail.com,m:linux-riscv@lists.infradead.org,m:spacemit@lists.linux.dev,m:linux-stm32@st-md-mailman.stormreply.com
 ,m:linux-arm-kernel@lists.infradead.org,m:rmk@armlinux.org.uk,m:andrew@lunn.ch,m:conor@kernel.org,m:krzk@kernel.org,m:mcoquelinstm32@gmail.com,m:looongbin@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[canonical.com,armlinux.org.uk,eecs.berkeley.edu,ghiti.fr,foss.st.com,lunn.ch,altera.com,kernel.org,linux.intel.com,davemloft.net,google.com,st.com,gmail.com,synopsys.com,bp.renesas.com,bootlin.com,dabbelt.com,redhat.com,cherry.de,eswincomputing.com,cqsoftware.com.cn,ziyao.cc];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[inochiama@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[39];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.963];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[inochiama@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gentoo.org,gmail.com,lists.infradead.org,lists.linux.dev,st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,kernel,netdev,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[d4015000:email,inochi.infowork:mid,5.245.225.0:email]
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 08:08:59AM -0500, Emil Renner Berthing wrote:
> Quoting Inochi Amaoto (2026-02-27 08:57:14)
> > Add initial support for ethernet controller of the Spacemit K3 SoC.
> > This ethernet controller is almost a standard Synopsys DesignWare
> > MAC (version 5.40a). This controller require a syscon device to
> > configure some basic features, like interface type and internal delay.
> 
> I don't know how we can accept this when it can't be tested since it still
> doesn't come with the device tree nodes. If you don't want it to be part of the
> series, just share a tree where this code is working. There are plenty of free
> public git hosting sites available.
> 

It seems like you have not read my reply before, I was forbidden from
opening other's patch. So some dependency can not be satisfied. For me,
the only thing I can open is the ethernet device node. The other things,
like clock, pinctrl and gpio devices. You should collect by yourself and
I can not provide.

Here is the ethernet DTS patch

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index b691304d4b74..1dfeef564ef3 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -5,6 +5,7 @@
  */
 
 #include "k3.dtsi"
+#include "k3-pinctrl.dtsi"
 
 / {
 	model = "SpacemiT K3 Pico-ITX";
@@ -24,6 +25,25 @@ memory@100000000 {
 	};
 };
 
+&eth0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac0_cfg>;
+
+	phy-mode = "rgmii-id";
+	phy-handle = <&phy0>;
+	status = "okay";
+
+	mdio {
+		phy0: phy@1 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <1>;
+			reset-gpios = <&gpio 0 15 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <10000>;
+		};
+	};
+};
+
 &uart0 {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
new file mode 100644
index 000000000000..aa8e7cfd7efe
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+#include <dt-bindings/gpio/gpio.h>
+
+#define K3_PADCONF(pin, func) (((pin) << 16) | (func))
+
+&pinctrl {
+	gmac0_cfg: gmac0-cfg {
+		/* Base pins: - Used by RMII directly */
+		gmac0_base_pins: gmac0-0-pins {
+			pinmux = <K3_PADCONF(0, 1)>,
+				 <K3_PADCONF(1, 1)>,
+				 <K3_PADCONF(2, 1)>,
+				 <K3_PADCONF(3, 1)>,
+				 <K3_PADCONF(6, 1)>,
+				 <K3_PADCONF(7, 1)>,
+				 <K3_PADCONF(11, 1)>,
+				 <K3_PADCONF(12, 1)>,
+				 <K3_PADCONF(13, 1)>;
+
+			bias-disable;
+			drive-strength = <25>;
+			power-source = <1800>;
+		};
+
+		/* RGMII extra pins: add on top of base pins */
+		gmac0_rgmii_add_pins: gmac0-1-pins {
+			pinmux = <K3_PADCONF(4, 1)>,
+				 <K3_PADCONF(5, 1)>,
+				 <K3_PADCONF(8, 1)>,
+				 <K3_PADCONF(9, 1)>,
+				 <K3_PADCONF(10, 1)>;
+
+			bias-disable;
+			drive-strength = <25>;
+			power-source = <1800>;
+		};
+
+		/* Optional int pins */
+		gmac0_int_pins: gmac0-3-pins {
+			pinmux = <K3_PADCONF(14, 1)>;
+
+			bias-disable;
+			drive-strength = <25>;
+			power-source = <1800>;
+		};
+
+		gmac0-6-pins {
+			pinmux = <K3_PADCONF(15, 0)>;
+
+			bias-disable;
+			drive-strength = <25>;
+			power-source = <1800>;
+		};
+	};
+};
diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index 6cc31e94c13a..066006826e92 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -5,6 +5,7 @@
  */
 
 #include <dt-bindings/clock/spacemit,k3-clocks.h>
+#include <dt-bindings/reset/spacemit,k3-resets.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 
 /dts-v1/;
@@ -437,6 +438,112 @@ soc: soc {
 		dma-noncoherent;
 		ranges;
 
+		gmac_axi_setup: stmmac-axi-config {
+			snps,wr_osr_lmt = <0xf>;
+			snps,rd_osr_lmt = <0xf>;
+			/* max axi burst len is 256 */
+			snps,blen = <256 128 64 32 16 0 0>;
+		};
+
+		eth0: ethernet@cac80000 {
+			compatible = "spacemit,k3-dwmac", "snps,dwmac-5.40a";
+			reg = <0x0 0xcac80000 0x0 0x2000>;
+			clocks = <&syscon_apmu CLK_APMU_EMAC0_BUS>,
+				 <&syscon_apmu CLK_APMU_EMAC0_1588>,
+				 <&syscon_apmu CLK_APMU_EMAC0_RGMII_TX>;
+			clock-names = "stmmaceth", "ptp_ref", "tx";
+			interrupt-parent = <&saplic>;
+			interrupts = <131 IRQ_TYPE_LEVEL_HIGH>,
+				     <276 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq", "eth_wake_irq";
+			resets = <&syscon_apmu RESET_APMU_EMAC0>;
+			reset-names = "stmmaceth";
+			rx-fifo-depth = <8192>;
+			tx-fifo-depth = <8192>;
+			snps,multicast-filter-bins = <64>;
+			snps,perfect-filter-entries = <32>;
+			snps,aal;
+			snps,tso;
+			snps,txpbl = <8>;
+			snps,rxpbl = <8>;
+			snps,force_sf_dma_mode;
+			snps,axi-config = <&gmac_axi_setup>;
+			spacemit,apmu = <&syscon_apmu 0x3e4 0x3e8>;
+			status = "disabled";
+
+			mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		eth1: ethernet@cac82000 {
+			compatible = "spacemit,k3-dwmac", "snps,dwmac-5.40a";
+			reg = <0x0 0xcac82000 0x0 0x2000>;
+			clocks = <&syscon_apmu CLK_APMU_EMAC1_BUS>,
+				 <&syscon_apmu CLK_APMU_EMAC1_1588>,
+				 <&syscon_apmu CLK_APMU_EMAC1_RGMII_TX>;
+			clock-names = "stmmaceth", "ptp_ref", "tx";
+			interrupt-parent = <&saplic>;
+			interrupts = <133 IRQ_TYPE_LEVEL_HIGH>,
+				     <277 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq", "eth_wake_irq";
+			resets = <&syscon_apmu RESET_APMU_EMAC1>;
+			reset-names = "stmmaceth";
+			rx-fifo-depth = <8192>;
+			tx-fifo-depth = <8192>;
+			snps,multicast-filter-bins = <64>;
+			snps,perfect-filter-entries = <32>;
+			snps,aal;
+			snps,tso;
+			snps,txpbl = <8>;
+			snps,rxpbl = <8>;
+			snps,force_sf_dma_mode;
+			snps,axi-config = <&gmac_axi_setup>;
+			spacemit,apmu = <&syscon_apmu 0x3ec 0x3f0>;
+			status = "disabled";
+
+			mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		eth2: ethernet@cac8e000 {
+			compatible = "spacemit,k3-dwmac", "snps,dwmac-5.40a";
+			reg = <0x0 0xcac8e000 0x0 0x2000>;
+			clocks = <&syscon_apmu CLK_APMU_EMAC2_BUS>,
+				 <&syscon_apmu CLK_APMU_EMAC2_1588>,
+				 <&syscon_apmu CLK_APMU_EMAC2_RGMII_TX>;
+			clock-names = "stmmaceth", "ptp_ref", "tx";
+			interrupt-parent = <&saplic>;
+			interrupts = <130 IRQ_TYPE_LEVEL_HIGH>,
+				     <278 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq", "eth_wake_irq";
+			resets = <&syscon_apmu RESET_APMU_EMAC2>;
+			reset-names = "stmmaceth";
+			rx-fifo-depth = <4096>;
+			tx-fifo-depth = <4096>;
+			snps,multicast-filter-bins = <64>;
+			snps,perfect-filter-entries = <32>;
+			snps,aal;
+			snps,tso;
+			snps,txpbl = <8>;
+			snps,rxpbl = <8>;
+			snps,force_sf_dma_mode;
+			snps,axi-config = <&gmac_axi_setup>;
+			spacemit,apmu = <&syscon_apmu 0x248 0x24c>;
+			status = "disabled";
+
+			mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		syscon_apbc: system-controller@d4015000 {
 			compatible = "spacemit,k3-syscon-apbc";
 			reg = <0x0 0xd4015000 0x0 0x1000>;
-- 
2.53.0

Inochi

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

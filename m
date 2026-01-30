Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KO93JRwXfGk/KgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Jan 2026 03:27:40 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 80425B6698
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Jan 2026 03:27:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F318C0693F;
	Fri, 30 Jan 2026 02:27:40 +0000 (UTC)
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com
 [74.125.82.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 84593C36B12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Jan 2026 02:27:38 +0000 (UTC)
Received: by mail-dy1-f173.google.com with SMTP id
 5a478bee46e88-2b729f4c154so3170061eec.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Jan 2026 18:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769740057; x=1770344857;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sIZl5Xq7e2X6jMUzOZkJ4nra133biX/ZFgfGxWt8hQY=;
 b=JmFvo3iSdr5XEzFNKDWTSw9MLImcnY9wKuQNYYnicKSRU95spY7zrXaZcSMcUy3+bn
 IW/ojO4qndzy0NSB1xDnDJ7bh5sHjaXFkEMuHwIxHhwNGgC6zA2jjBZZ5/iwnv+dUQK1
 HncGCAAjQdS96u1+Gi3lXFeSf4XoZAV128zTcJIwi5rW61k8gnkUy5vW5xsHKqQAGJgI
 vagGvd8c9WpXTQekrz8tD2XfRShMfblMnZSr9YlkiBxQ537pZ1kkpt9PhnQo0GsREYVH
 Rb8jOsrGpsIxPq5rMV5wPqVVy7cZko1dDeAyzCuXrEi9zIhtQDxxU1fOTXSfZx/9ns3y
 TFzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769740057; x=1770344857;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=sIZl5Xq7e2X6jMUzOZkJ4nra133biX/ZFgfGxWt8hQY=;
 b=H8+yCasHVJ/BpGbi3YkNpBk6YPt9pKvMasuc0IZ8y9btup/I/XPLwz49Omz/J5Sh2r
 INYDW1/v5pE6jCK0EfaOupH/y2HwqATq+VPRCVpqaim+dQu9PT8x0uiTLHZhwoybMynM
 mbqYSPgK7NHJP1+5ma7nvB2+Cn44IRkj1+DUzWGzsC6MEYIljzvXIHyCyt8tfEltyppa
 CMI2SbfVHY0oDKhqdZeQ5KEfQqNYHfV2yINxRr4B5ZodDkuLy80/S09l8tN/sINBGZzm
 mYrSQAcOcJBEm+vGOwn+hiLf4aUuQTCFXkHpmlFkYgOM/rNQSF9iJgue540oihgkRiAW
 +L1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXf6FKvJHST7MVN36SYMOLNCNb5bYYVvqnp6bxrlCHSPoeER1xbGYdlwxvwNiSm8x1GrIWLF8jaH1N5rQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyC4N1XEZgDEtOBNdJnC7kIzTmf6wXAOA2/3+a9LY7AFBzdLs27
 UpMDusY2m2dR2nPBA/4YSH+IgHPQ7m68lK453oU2wJB6apQhZrF7EU4e
X-Gm-Gg: AZuq6aKg/4fs5wTh9laYTvVRsL2ZyPsRb+NBnaMqyEm+dSDclGzUFWkfZomdhbpHHrR
 oTZe1SbgDrMpNKdS2kwnvj9yS1DjRZ+MMpa0uI8u9hn2QzX3dJRD1mS/3R2n5RUX5KlUCKGwU4b
 fNSOrDjNPzx8mHQN+Oqjh0Suw9AdPzHPfROuD1ZY8PN+nRwgqSA57F28qn3wvPsmyOCSynatTFt
 9lTqtiOX6XHEJPcNcL07LAKD0ZviRoJBWFsQMTailvEpXmUTg0IQ5+7TBt6p1NOFu+P29HOIA3I
 zc0hb5RqqcF9U5iimYA8KO4b5CX5DIxPVpAgr3AtwNaTod/BvQ7zcx/V03CN+jfyQ43VfSOKbTM
 du66ZvaPCSKawdVFbEMKDtIl/oZtHUYOOkmLVY9+h9FDluRPo4/R001fgd6Xt9bBm/r2drkFq82
 OZytl2osxqpQ==
X-Received: by 2002:a05:7300:8186:b0:2b7:c5d7:84b3 with SMTP id
 5a478bee46e88-2b7c866dbc3mr1042558eec.19.1769740056871; 
 Thu, 29 Jan 2026 18:27:36 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2b7a1af8a7bsm9327816eec.34.2026.01.29.18.27.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jan 2026 18:27:36 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Yanteng Si <siyanteng@cqsoftware.com.cn>, Yao Zi <ziyao@disroot.org>,
 Inochi Amaoto <inochiama@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Shangjuan Wei <weishangjuan@eswincomputing.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Chen-Yu Tsai <wens@kernel.org>, Zhi Li <lizhi2@eswincomputing.com>,
 Boon Khai Ng <boon.khai.ng@altera.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>
Date: Fri, 30 Jan 2026 10:27:04 +0800
Message-ID: <20260130022705.1059214-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260130022705.1059214-1-inochiama@gmail.com>
References: <20260130022705.1059214-1-inochiama@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Longbin Li <looong.bin@gmail.com>,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v4 3/3] net: stmmac: Add glue layer
	for Spacemit K3 SoC
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dlan@gentoo.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:richardcochran@gmail.com,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:rmk+kernel@armlinux.org.uk,m:siyanteng@cqsoftware.com.cn,m:ziyao@disroot.org,m:inochiama@gmail.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:weishangjuan@eswincomputing.com,m:maxime.chevallier@bootlin.com,m:wens@kernel.org,m:lizhi2@eswincomputing.com,m:boon.khai.ng@altera.com,m:quentin.schulz@cherry.de,m:peppe.cavallaro@st.com,m:joabreu@synopsys.com,m:devicetree@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:looong.bin@gmail.com,m:linux-riscv@lists.infradead.org,m:spacemit@lists.linux.dev,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,
 m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,m:looongbin@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gentoo.org,gmail.com,foss.st.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,armlinux.org.uk,cqsoftware.com.cn,disroot.org,bp.renesas.com,eswincomputing.com,bootlin.com,altera.com,cherry.de,st.com,synopsys.com];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[inochiama@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[37];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,lists.infradead.org,lists.linux.dev,st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[inochiama@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt,kernel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 80425B6698
X-Rspamd-Action: no action

The ethernet controller on Spacemit K3 SoC is Synopsys DesignWare
MAC (version 5.40a), with the following special points:
1. The rate of the tx clock line is auto changed when the mac speed
   rate is changed, and no need for changing the input tx clock.
2. This controller require a extra syscon device to configure the
   interface type, enable wake up interrupt and delay configuration
   if needed.

Add Spacemit dwmac driver support on the Spacemit K3 SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-spacemit.c  | 194 ++++++++++++++++++
 3 files changed, 207 insertions(+)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index 907fe2e927f0..583a4692f5da 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -216,6 +216,18 @@ config DWMAC_SOPHGO
 	  for the stmmac device driver. This driver is used for the
 	  ethernet controllers on various Sophgo SoCs.
 
+config DWMAC_SPACEMIT
+	tristate "Spacemit dwmac support"
+	depends on OF && (ARCH_SPACEMIT || COMPILE_TEST)
+	select MFD_SYSCON
+	default m if ARCH_SPACEMIT
+	help
+	  Support for ethernet controllers on Spacemit RISC-V SoCs
+
+	  This selects the Spacemit platform specific glue layer support
+	  for the stmmac device driver. This driver is used for the
+	  Spacemit K3 ethernet controllers.
+
 config DWMAC_STARFIVE
 	tristate "StarFive dwmac support"
 	depends on OF && (ARCH_STARFIVE || COMPILE_TEST)
diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
index 7bf528731034..9e32045631d8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Makefile
+++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
@@ -27,6 +27,7 @@ obj-$(CONFIG_DWMAC_RZN1)	+= dwmac-rzn1.o
 obj-$(CONFIG_DWMAC_S32)		+= dwmac-s32.o
 obj-$(CONFIG_DWMAC_SOCFPGA)	+= dwmac-altr-socfpga.o
 obj-$(CONFIG_DWMAC_SOPHGO)	+= dwmac-sophgo.o
+obj-$(CONFIG_DWMAC_SPACEMIT)	+= dwmac-spacemit.o
 obj-$(CONFIG_DWMAC_STARFIVE)	+= dwmac-starfive.o
 obj-$(CONFIG_DWMAC_STI)		+= dwmac-sti.o
 obj-$(CONFIG_DWMAC_STM32)	+= dwmac-stm32.o
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
new file mode 100644
index 000000000000..25d497a54ff7
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
@@ -0,0 +1,194 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Spacemit DWMAC platform driver
+ *
+ * Copyright (C) 2026 Inochi Amaoto <inochiama@gmail.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/math.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/mfd/syscon.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+
+#include "stmmac_platform.h"
+
+/* ctrl register bits */
+#define CTRL_PHY_INTF_RGMII		BIT(3)
+#define CTRL_PHY_INTF_MII		BIT(4)
+#define CTRL_WAKE_IRQ_EN		BIT(9)
+#define CTRL_PHY_IRQ_EN			BIT(12)
+
+/* dline register bits */
+#define RGMII_RX_DLINE_EN		BIT(0)
+#define RGMII_RX_DLINE_STEP		GENMASK(5, 4)
+#define RGMII_RX_DLINE_CODE		GENMASK(15, 8)
+#define RGMII_TX_DLINE_EN		BIT(16)
+#define RGMII_TX_DLINE_STEP		GENMASK(21, 20)
+#define RGMII_TX_DLINE_CODE		GENMASK(31, 24)
+
+#define MAX_DLINE_DELAY_CODE		0xff
+#define MAX_WORKED_DELAY		2800
+/* Note: the delay step value is at 0.1ps */
+#define K3_DELAY_STEP			367
+
+static int spacemit_dwmac_set_delay(struct regmap *apmu, unsigned int dline_offset,
+				    unsigned int tx_code, unsigned int rx_code)
+{
+	unsigned int mask, val;
+
+	mask = RGMII_TX_DLINE_STEP | RGMII_TX_DLINE_CODE | RGMII_TX_DLINE_EN |
+	       RGMII_RX_DLINE_STEP | RGMII_RX_DLINE_CODE | RGMII_RX_DLINE_EN;
+
+	/*
+	 * Since the delay step provided by config 0 is small enough, and
+	 * it can cover the range of the valid delay, so there is no needed
+	 * to use other step config.
+	 */
+	val = FIELD_PREP(RGMII_TX_DLINE_STEP, 0) |
+	      FIELD_PREP(RGMII_TX_DLINE_CODE, tx_code) | RGMII_TX_DLINE_EN |
+	      FIELD_PREP(RGMII_RX_DLINE_STEP, 0) |
+	      FIELD_PREP(RGMII_RX_DLINE_CODE, rx_code) | RGMII_RX_DLINE_EN;
+
+	return regmap_update_bits(apmu, dline_offset, mask, val);
+}
+
+static int spacemit_dwmac_detected_delay_value(unsigned int delay)
+{
+	if (delay == 0)
+		return 0;
+
+	if (delay > MAX_WORKED_DELAY)
+		return -EINVAL;
+
+	/*
+	 * Note K3 require a specific factor for calculate
+	 * the delay, in this scenario it is 0.9. So the
+	 * formula is code * step / 10 * 0.9
+	 */
+	return DIV_ROUND_CLOSEST(delay * 10 * 10, K3_DELAY_STEP * 9);
+}
+
+static int spacemit_dwmac_fix_delay(struct plat_stmmacenet_data *plat_dat,
+				    struct regmap *apmu,
+				    unsigned int dline_offset,
+				    unsigned int tx_delay, unsigned int rx_delay)
+{
+	int rx_code;
+	int tx_code;
+
+	rx_code = spacemit_dwmac_detected_delay_value(rx_delay);
+	if (rx_code < 0)
+		return rx_code;
+
+	tx_code = spacemit_dwmac_detected_delay_value(tx_delay);
+	if (tx_code < 0)
+		return tx_code;
+
+	return spacemit_dwmac_set_delay(apmu, dline_offset, tx_code, rx_code);
+}
+
+static int spacemit_dwmac_update_ifconfig(struct plat_stmmacenet_data *plat_dat,
+					  struct stmmac_resources *stmmac_res,
+					  struct regmap *apmu,
+					  unsigned int ctrl_offset)
+{
+	unsigned int mask = CTRL_PHY_INTF_MII | CTRL_PHY_INTF_RGMII | CTRL_WAKE_IRQ_EN;
+	unsigned int val = 0;
+
+	switch (plat_dat->phy_interface) {
+	case PHY_INTERFACE_MODE_MII:
+		val = CTRL_PHY_INTF_MII;
+		break;
+
+	case PHY_INTERFACE_MODE_RMII:
+		break;
+
+	case PHY_INTERFACE_MODE_RGMII:
+	case PHY_INTERFACE_MODE_RGMII_ID:
+	case PHY_INTERFACE_MODE_RGMII_RXID:
+	case PHY_INTERFACE_MODE_RGMII_TXID:
+		val = CTRL_PHY_INTF_RGMII;
+		break;
+
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	if (stmmac_res->wol_irq >= 0)
+		val |= CTRL_WAKE_IRQ_EN;
+
+	return regmap_update_bits(apmu, ctrl_offset, mask, val);
+}
+
+static int spacemit_dwmac_probe(struct platform_device *pdev)
+{
+	struct plat_stmmacenet_data *plat_dat;
+	struct stmmac_resources stmmac_res;
+	struct device *dev = &pdev->dev;
+	unsigned int offset[2];
+	struct regmap *apmu;
+	struct clk *clk_tx;
+	u32 rx_delay = 0;
+	u32 tx_delay = 0;
+	int ret;
+
+	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to get platform resources\n");
+
+	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
+	if (IS_ERR(plat_dat))
+		return dev_err_probe(dev, PTR_ERR(plat_dat),
+				     "failed to parse DT parameters\n");
+
+	clk_tx = devm_clk_get_enabled(&pdev->dev, "tx");
+	if (IS_ERR(clk_tx))
+		return dev_err_probe(&pdev->dev, PTR_ERR(clk_tx),
+				     "failed to get tx clock\n");
+
+	apmu = syscon_regmap_lookup_by_phandle_args(pdev->dev.of_node, "spacemit,apmu", 2, offset);
+	if (IS_ERR(apmu))
+		return dev_err_probe(dev, PTR_ERR(apmu),
+				"Failed to get apmu regmap\n");
+
+	ret = spacemit_dwmac_update_ifconfig(plat_dat, &stmmac_res,
+					     apmu, offset[0]);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to configure ifconfig\n");
+
+	of_property_read_u32(pdev->dev.of_node, "tx-internal-delay-ps", &tx_delay);
+	of_property_read_u32(pdev->dev.of_node, "rx-internal-delay-ps", &rx_delay);
+
+	ret = spacemit_dwmac_fix_delay(plat_dat, apmu, offset[1], tx_delay, rx_delay);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to configure delay\n");
+
+	return stmmac_dvr_probe(dev, plat_dat, &stmmac_res);
+}
+
+static const struct of_device_id spacemit_dwmac_match[] = {
+	{ .compatible = "spacemit,k3-dwmac" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, spacemit_dwmac_match);
+
+static struct platform_driver spacemit_dwmac_driver = {
+	.probe  = spacemit_dwmac_probe,
+	.remove = stmmac_pltfr_remove,
+	.driver = {
+		.name = "spacemit-dwmac",
+		.pm = &stmmac_pltfr_pm_ops,
+		.of_match_table = spacemit_dwmac_match,
+	},
+};
+module_platform_driver(spacemit_dwmac_driver);
+
+MODULE_AUTHOR("Inochi Amaoto <inochiama@gmail.com>");
+MODULE_DESCRIPTION("Spacemit DWMAC platform driver");
+MODULE_LICENSE("GPL");
-- 
2.52.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

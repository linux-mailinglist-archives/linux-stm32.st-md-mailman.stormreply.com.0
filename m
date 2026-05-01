Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPW4A4CT+Gl8wgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 04 May 2026 14:39:28 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6D24BD044
	for <lists+linux-stm32@lfdr.de>; Mon, 04 May 2026 14:39:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4F603C60469;
	Mon,  4 May 2026 12:39:27 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8FCEC8F26F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 May 2026 15:55:02 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id
 6a1803df08f44-8b4eb1fd5d0so12954846d6.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 01 May 2026 08:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777650901; x=1778255701;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TLtmgJRm59utBOLEfAtowzngTeaKeZzm+b79FRaQwf0=;
 b=s7HBaqxhUMNxapATezpatuHc/qgrezgjNbcQboFjJoqHPew3aXixEQZfbTkNLiKbeX
 X7PfVCJaCtHCbvLYCeA8ga817yDFiPOVEVDd/RXDalrcG3oF0rnnBHlqsSlXfMLj8kVS
 M6x+gfk03NaXjm2Jc1ITA6+S7S4lGxmhGzzUvAT5Y2O+8WZuyTM+zY+uob7aZHmJt946
 RfeIlCZsPWxqCPymOvI2LK+iUH5nCUdD16EmDCBJvitoG/etkQ17ReoqLsJyml4xwA3/
 ChryFyU40/85p0sx0ynCAUPnb3hvuKmzp7jFWXGc05JvVoR8vu/Aa/pYBZwgj0QSMnsp
 o7yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777650901; x=1778255701;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TLtmgJRm59utBOLEfAtowzngTeaKeZzm+b79FRaQwf0=;
 b=IDdYQsFp4wv2DP94J3PgbXRDCtjtLKaNgjqlPGGzpyU8n56d0Dj6jTb8/8Z0ngDyxl
 W8oiso8x3VVS96Vw625cHMTk6RHSdw6EF/UpO2bRmsrvkgjkyF4HsBKZ99B3LdFX6V2t
 IzGuhrDd2q5zHP7+CBgzG/IY/wm9G8HVR56n/qHGBSTuLEfwOfVbIcd3exOAvuLn1bKr
 qeNSDE/ZucioJYple6XmvH1Vl4FnIpP2YF2+V8cXqP5/dHLqa71O8SaSNZJ708TfTiRQ
 286067z/YoAmYlw/XRCxCDpKetjaXVTgJQDl1y8UXG8bHfgjZLW2dGXIJdktd/hIRU1E
 FpIg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+KNep7FBSqV/qda1p8iLmPMhLECqie/0lcmMaXZh9BWsGtdj31mITYG8UUucFRW451y7oqvQb25mkxvw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzjdqwy0Woz8S+OoSyEMNFilLiTtOj7XeTMWzIpKMbjyfLbViP5
 3EAGFEYA7D6IhSZiowsZB9A17xMLqLoJy++3xV+leP+mtTJfORvzTZRKJL9WVTOm5RM=
X-Gm-Gg: AeBDiesTMNmoEae+nbQcsqUWBtD3dqnFjV9Kw8Adyy3IeaKlyEWjqp9NuOyEekJHCzD
 1aY7/SWcXBExR5wmf6I+rCAMFRUZ8vRvkLoh99ReBu/HVYaTQ4fF+S3HekBnrlETS7Sv8qVDkfb
 Gl6DaZX2OIpkGGJwvblq3pyW7pMxKS8nyli9P6clRWOykXlldd0ogh0uQfRvep268LMlIEampH/
 ple1t/+G8k96jEUHo/C57ict5ccG4VSTp19T9J16WLDKhCObYBABlp9hVYoskDOA/BvMCqxO4RC
 kKwdT/mzcY+RCuLPD2J4UbfRSuJwcJlXR3pjZnd08xc6a7xt4yC/fmBjrFTlS8hmcZ7wtfnhijJ
 Ei9NXkOn2V7kQw+FmpRHi/ghUwumte/WkWhtyzprlBrIGBS2OOfW1jxgw0kyqxRNfzEfXSihMt+
 GM6UR1pwkURg0BJvm51LClUhsteH1n5XBgJ0yQmzqs4CflOK1/vqqV7TVEUiTDtYvhDPYCSpsPt
 4aWKw==
X-Received: by 2002:a05:6214:4802:b0:8ae:652b:e3c4 with SMTP id
 6a1803df08f44-8b668d0b700mr535566d6.49.1777650901165; 
 Fri, 01 May 2026 08:55:01 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net.
 [75.72.117.212]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8b539aa7293sm26615406d6.22.2026.05.01.08.54.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 May 2026 08:55:00 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com,
 rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linusw@kernel.org, brgl@kernel.org, arnd@arndb.de,
 gregkh@linuxfoundation.org
Date: Fri,  1 May 2026 10:54:18 -0500
Message-ID: <20260501155421.3329862-11-elder@riscstar.com>
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
Subject: [Linux-stm32] [PATCH net-next 10/12] net: stmmac: tc956x: add
	TC956x/QPS615 support
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
X-Rspamd-Queue-Id: AE6D24BD044
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	DATE_IN_PAST(1.00)[68];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:maxime.chevallier@bootlin.com,m:rmk+kernel@armlinux.org.uk,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:me@ziyao.cc,m:linux-kernel@vger.kernel.org,m:daniel@riscstar.com,m:chenchuangyu@xiaomi.com,m:linux-stm32@st-md-mailman.stormreply.com,m:mohd.anwar@oss.qualcomm.com,m:weishangjuan@eswincomputing.com,m:daniel@iogearbox.net,m:chenhuacai@kernel.org,m:john.fastabend@gmail.com,m:siyanteng@cqsoftware.com.cn,m:sdf@fomichev.me,m:devicetree@vger.kernel.org,m:hawk@kernel.org,m:elder@riscstar.com,m:linux-arm-msm@vger.kernel.org,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:livelycarpet87@gmail.com,m:ast@kernel.org,m:linux-gpio@vger.kernel.org,m:wens@kernel.org,m:li
 nux-arm-kernel@lists.infradead.org,m:inochiama@gmail.com,m:a0987203069@gmail.com,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:bpf@vger.kernel.org,m:julianbraha@gmail.com,m:matthew.gerlach@altera.com,m:hkallweit1@gmail.com,m:andrew@lunn.ch,m:rmk@armlinux.org.uk,m:krzk@kernel.org,m:conor@kernel.org,m:johnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[elder@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_CC(0.00)[ziyao.cc,vger.kernel.org,riscstar.com,xiaomi.com,st-md-mailman.stormreply.com,oss.qualcomm.com,eswincomputing.com,iogearbox.net,kernel.org,gmail.com,cqsoftware.com.cn,fomichev.me,altera.com,bp.renesas.com,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.732];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,dgc_info.name:url]

From: Daniel Thompson <daniel@riscstar.com>

Toshiba TC956x is an Ethernet AVB/TSN bridge and is essentially a
small and highly-specialized SoC. TC956x includes an "eMAC" subsystem
that can be accessed, along with several other peripherals, via two
PCIe endpoint functions. There is a main driver for the endpoint that
decomposes things and creates auxiliary bus devices to model the SoC.

The eMAC consists of a Designware XGMAC, XPCS and PMA. Each eMAC is
supported by an MSIGEN that bridges TC956x level interrupts to PCIe
MSIs.

Add a driver for the eMAC/MSIGEN combination.

Co-developed-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Daniel Thompson <daniel@riscstar.com>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  13 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   2 +
 .../ethernet/stmicro/stmmac/dwmac-tc956x.c    | 791 ++++++++++++++++++
 include/soc/toshiba/tc956x-dwmac.h            |  84 ++
 4 files changed, 890 insertions(+)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-tc956x.c
 create mode 100644 include/soc/toshiba/tc956x-dwmac.h

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index e3dd5adda5aca..66bcfaccbe21f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -404,6 +404,19 @@ config DWMAC_MOTORCOMM
 	  This enables glue driver for Motorcomm DWMAC-based PCI Ethernet
 	  controllers. Currently only YT6801 is supported.
 
+config DWMAC_TC956X
+	tristate "Toshiba TC956X DWMAC support"
+	depends on PCI
+	depends on COMMON_CLK
+	depends on TOSHIBA_TC956X_PCI
+	default m if TOSHIBA_TC956X_PCI
+	help
+	  This selects the Toshiba TC956X (and Qualcomm QPS615) support in the
+	  stmmac driver.
+
+	  This provides support for the ethernet controllers found on these
+	  devices.
+
 config STMMAC_PCI
 	tristate "STMMAC PCI bus support"
 	depends on PCI
diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
index a1cea2f57252e..e8e7f95dbe3e8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Makefile
+++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
@@ -51,4 +51,6 @@ obj-$(CONFIG_STMMAC_PCI)	+= stmmac-pci.o
 obj-$(CONFIG_DWMAC_INTEL)	+= dwmac-intel.o
 obj-$(CONFIG_DWMAC_LOONGSON)	+= dwmac-loongson.o
 obj-$(CONFIG_DWMAC_MOTORCOMM)	+= dwmac-motorcomm.o
+obj-$(CONFIG_TC956X_PCI)	+= tc956x-pci.o
+obj-$(CONFIG_DWMAC_TC956X)	+= dwmac-tc956x.o
 stmmac-pci-objs:= stmmac_pci.o
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-tc956x.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-tc956x.c
new file mode 100644
index 0000000000000..27ff83dd3bd9e
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-tc956x.c
@@ -0,0 +1,791 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * Copyright (C) 2026 by RISCstar Solutions Corporation.  All rights reserved.
+ *
+ * Derived from code having the following copyrights:
+ * Copyright (C) 2011-2012  Vayavya Labs Pvt Ltd
+ * Copyright (C) 2025 Toshiba Electronic Devices & Storage Corporation
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/bitops.h>
+#include <linux/iopoll.h>
+#include <linux/irqdomain.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/pcs/pcs-xpcs-regmap.h>
+#include <linux/pcs/pcs-xpcs.h>
+#include <linux/phy.h>
+#include <linux/regmap.h>
+#include <linux/stmmac.h>
+#include <linux/types.h>
+#include <linux/units.h>
+
+#include <soc/toshiba/tc956x-dwmac.h>
+
+#include "common.h"
+#include "dwxgmac2.h"
+#include "stmmac.h"
+
+#define DRIVER_NAME			"dwmac-tc956x"
+
+#define TC956X_PTP_CLOCK_RATE		(250 * HZ_PER_MHZ)
+
+#define TC956X_RX_FIFO_KB		46	/* Shared by all RX queues */
+#define TC956X_TX_FIFO_KB		46	/* Shared by all TX queues */
+
+/* Fields and values for the EMACTL registers */
+#define EMAC_SP_SEL_MASK		GENMASK(3, 0)
+#define SP_SEL_SGMII_2500M		4
+#define SP_SEL_SGMII_1000M		5
+#define SP_SEL_SGMII_100M		6
+#define SP_SEL_SGMII_10M		7
+#define EMAC_PHY_INF_SEL_MASK		GENMASK(5, 4)
+#define PCS_CLK_PHY			1	/* Clock from PHY */
+#define EMAC_INV_SGM_SIG_DET		BIT(6)	/* 1 = polarity inverted */
+#define EMAC_LPIHWCLKEN			BIT(8)	/* 1 = low power mode */
+#define EMAC_INIT_DONE			BIT(21)
+
+/* MSIGEN Registers */
+#define MSI_OUT_EN_OFFSET		0x0000
+#define MSI_MASK_CLR_OFFSET		0x000c
+#define MSI_MASK_VALUE			BIT(0)
+#define MSI_INT_STS_OFFSET		0x0010
+
+enum msigen_hwirq {
+	HWIRQ_LPI		= 0,
+	HWIRQ_PMT		= 1,
+	HWIRQ_EVENT		= 2,
+	HWIRQ_TX0		= 3,
+	HWIRQ_RX0		= 11,
+	HWIRQ_XPCS		= 19,
+	HWIRQ_PHY		= 20,
+	HWIRQ_PFMAILBOX		= 21,
+	HWIRQ_MSIREQ_PLS	= 24
+};
+
+#define HWIRQ_COUNT			25
+
+/* Offset to the XPCS memory block, relative to the EMAC address range */
+#define DWMAC_XPCS_OFFSET		0x3a00
+
+/* Offset to the PMATOP memory block, relative to the EMAC address range */
+#define DWMAC_PMATOP_OFFSET			0x4000
+
+#define PMA_CML_GL_PM_CFG0			0x01b8
+
+/*
+ * Five sets three registers must be configured for PMA.  The HWT_REFCLK
+ * registers are each separated by 0x14 bytes.  The Common0 configuration
+ * registers are separated by 0x8 bytes.
+ */
+#define PMA_REG_COUNT				5
+
+#define PMA_HWT_REFCK_R_EN			0x1080
+#define PMA_HWT_REFCK_TERM_EN			0x1090
+#define PMA_HWT_REFCK_STRIDE			0x0014
+
+#define PMA_COMM_CFG_0_1			0x1888
+#define PMA_COMM_CFG_0_1_STRIDE			0x0008
+
+/* PMA_COMM_CFG_0_1 fields (WRITE_MASK is a field name) */
+#define COMM_CFG_WRITE_MASK_MASK		GENMASK(16, 9)
+#define WRITE_MASK_VALUE			0xf7	/* Power-on value */
+#define COMM_CFG_ENABLE				BIT(8)
+#define COMM_CFG_WRITE_DATA_MASK		GENMASK(7, 0)
+#define WRITE_DATA_VALUE			0x04	/* Power-on value */
+
+/**
+ * struct tc956x_data - Toshiba-specific platform data
+ * @dev:		Device pointer
+ * @irq_domain:		MSIGEN IRQ domain
+ * @auxbus_data:	Pointer to data passed from the parent device
+ * @plat:		Pointer to our stmmac platform data
+ * @dma_cfg:		DMA config buffer used by plat_stmmacenet_data
+ * @mdio_bus_data:	MDIO bus data used by plat_stmmacenet_data
+ * @axi:		AXI data used by plat_stmmacenet_data
+ * @desc:		DMA descriptor data used by mac_device_info
+ * @dma:		DMA operations data used by mac_device_info
+ */
+struct tc956x_data {
+	struct device *dev;
+	struct irq_domain *irq_domain;
+	struct tc956x_dwmac_data *auxbus_data;
+	struct plat_stmmacenet_data *plat;
+
+	/* These three fields are used by the plat_stmmacenet_data structure */
+	struct stmmac_dma_cfg dma_cfg;
+	struct stmmac_mdio_bus_data mdio_bus_data;
+	struct stmmac_axi axi;
+
+	/* These two fields are used by the mac_device_info structure */
+	struct stmmac_desc_ops desc;
+	struct stmmac_dma_ops dma;
+};
+
+struct tc956x_mac_speed {
+	phy_interface_t phy_interface;
+	int speed;
+	u32 sp_sel;
+};
+
+static struct tc956x_mac_speed mac_speed[] = {
+	{ PHY_INTERFACE_MODE_2500BASEX,	SPEED_2500,  SP_SEL_SGMII_2500M, },
+	{ PHY_INTERFACE_MODE_SGMII,	SPEED_2500,  SP_SEL_SGMII_2500M, },
+	{ PHY_INTERFACE_MODE_SGMII,	SPEED_1000,  SP_SEL_SGMII_1000M, },
+	{ PHY_INTERFACE_MODE_SGMII,	SPEED_100,   SP_SEL_SGMII_100M, },
+	{ PHY_INTERFACE_MODE_SGMII,	SPEED_10,    SP_SEL_SGMII_10M, },
+};
+
+/* TC956x uses indirect addressing so this need only describe a 1KiB range */
+static const struct regmap_config xpcs_regmap_config = {
+	.reg_bits	= 32,
+	.val_bits	= 32,
+	.reg_base	= 0x00,		/* Minimum XPCS reg offset */
+	.max_register	= 0xff,		/* Register DW_VR_CSR_VIEWPORT */
+	.reg_shift	= REGMAP_UPSHIFT(2),
+};
+
+static void tc956x_msigen_irq_handler(struct irq_desc *desc)
+{
+	struct irq_domain *irq_domain = irq_desc_get_handler_data(desc);
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	struct irq_chip_generic *gc;
+	unsigned long status;
+	unsigned int hwirq;
+
+	gc = irq_get_domain_generic_chip(irq_domain, 0);
+
+	chained_irq_enter(chip, desc);
+
+	status = irq_reg_readl(gc, MSI_INT_STS_OFFSET);
+	for_each_set_bit(hwirq, &status, HWIRQ_COUNT)
+		generic_handle_domain_irq(irq_domain, hwirq);
+
+	/*
+	 * Clear the MSI flag. Most interrupts within TC956X are level-high
+	 * type. If any interrupts are still asserted then clearing this flag
+	 * will cause the (edge-triggered) MSI to be regenerated.
+	 */
+	irq_reg_writel(gc, MSI_MASK_VALUE, MSI_MASK_CLR_OFFSET);
+
+	chained_irq_exit(chip, desc);
+}
+
+static int tc956x_msigen_irq_chip_init(struct irq_chip_generic *gc)
+{
+	struct tc956x_data *td = gc->domain->host_data;
+
+	gc->reg_base = td->auxbus_data->msigen;
+	gc->chip_types[0].regs.mask = MSI_OUT_EN_OFFSET;
+	gc->chip_types[0].chip.irq_mask = irq_gc_mask_clr_bit;
+	gc->chip_types[0].chip.irq_unmask = irq_gc_mask_set_bit;
+
+	/* Disable all interrupts */
+	irq_reg_writel(gc, 0, MSI_OUT_EN_OFFSET);
+
+	return 0;
+}
+
+static void tc956x_msigen_irq_chip_exit(struct irq_chip_generic *gc)
+{
+	irq_reg_writel(gc, 0, MSI_OUT_EN_OFFSET);
+}
+
+static int tc956x_msigen_irq_domain_init(struct irq_domain *irq_domain)
+{
+	struct tc956x_data *td = irq_domain->host_data;
+
+	irq_set_chained_handler_and_data(td->auxbus_data->msigen_irq,
+					 tc956x_msigen_irq_handler,
+					 irq_domain);
+
+	return 0;
+}
+
+static void tc956x_msigen_irq_domain_exit(struct irq_domain *irq_domain)
+{
+	struct tc956x_data *td = irq_domain->host_data;
+
+	irq_set_chained_handler_and_data(td->auxbus_data->msigen_irq,
+					 NULL, NULL);
+}
+
+/* We have one IRQ chip instance with 25 IRQs in its domain */
+static struct irq_domain *
+tc956x_msigen_irq_domain_instantiate(struct tc956x_data *td)
+{
+	struct irq_domain_chip_generic_info dgc_info;
+	struct irq_domain_info info;
+
+	dgc_info.name = "tc956x-msigen";
+	dgc_info.handler = handle_level_irq;
+	dgc_info.irqs_per_chip = HWIRQ_COUNT;
+	dgc_info.num_ct = 1;
+	dgc_info.init = tc956x_msigen_irq_chip_init;
+	dgc_info.exit = tc956x_msigen_irq_chip_exit;
+
+	info.domain_flags = IRQ_DOMAIN_FLAG_DESTROY_GC;
+	info.size = HWIRQ_COUNT;
+	info.hwirq_max = HWIRQ_COUNT;
+	info.ops = &irq_generic_chip_ops;
+	info.host_data = td;
+	info.dgc_info = &dgc_info;
+	info.init = tc956x_msigen_irq_domain_init;
+	info.exit = tc956x_msigen_irq_domain_exit;
+
+	return devm_irq_domain_instantiate(td->dev, &info);
+}
+
+/**
+ * tc956x_pma_init() - Initialize PMA
+ * @td:	bsp_priv pointer
+ *
+ * Initialize (or re-initialize) the PMA, configure the clocks and wait for the
+ * eMAC to be ready.
+ */
+static void tc956x_pma_init(struct tc956x_data *td)
+{
+	const struct tc956x_chip *chip = td->auxbus_data->chip;
+	void __iomem *emac_ctl = td->auxbus_data->emac_ctl;
+	u32 id = td->auxbus_data->mac_id;
+	void __iomem *pmatop;
+	u32 val;
+	u32 i;
+
+	/*
+	 * When we re-initialize the PMA then the reset will already have
+	 * been deasserted. We must make sure the PMA reset is asserted before
+	 * we change the clock settings.
+	 */
+	tc956x_reset_assert(chip, id, MAC_RESET_PMA);
+
+	pmatop = td->auxbus_data->emac + DWMAC_PMATOP_OFFSET;
+
+	/* Power on CML buffer (0 = normal mode, 1 = power down) */
+	writel(0, pmatop + PMA_CML_GL_PM_CFG0);
+
+	/* This value switches clock from C0_REFCK to CLK_REF_I */
+	val = u32_encode_bits(WRITE_MASK_VALUE, COMM_CFG_WRITE_MASK_MASK);
+	val |= COMM_CFG_ENABLE;
+	val |= u32_encode_bits(WRITE_DATA_VALUE, COMM_CFG_WRITE_DATA_MASK);
+
+	for (i = 0; i < PMA_REG_COUNT; i++) {
+		u32 offset =  i * PMA_HWT_REFCK_STRIDE;
+
+		/* Disable C0_REFCK and 100 ohm termination */
+		writel(0, pmatop + PMA_HWT_REFCK_R_EN + offset);
+		writel(0, pmatop + PMA_HWT_REFCK_TERM_EN + offset);
+
+		/* Switch clock from C0_REFCK to CLK_REF_I */
+		offset =  i * PMA_COMM_CFG_0_1_STRIDE;
+		writel(val, pmatop + PMA_COMM_CFG_0_1 + offset);
+	}
+
+	tc956x_reset_deassert(chip, id, MAC_RESET_PMA);
+
+	WARN_ON(readl_poll_timeout(emac_ctl, val, val & EMAC_INIT_DONE, 50, 1000000));
+}
+
+static int tc956x_mac_speed_select(struct tc956x_data *td, int speed)
+{
+	phy_interface_t phy_interface = td->plat->phy_interface;
+	struct net_device *netdev;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(mac_speed); i++) {
+		if (mac_speed[i].speed != speed)
+			continue;
+
+		if (mac_speed[i].phy_interface == phy_interface)
+			return mac_speed[i].sp_sel;
+	}
+	netdev = dev_get_drvdata(td->dev);
+	netdev_err(netdev, "%s/%d unsupported\n",
+		   phy_modes(phy_interface), speed);
+
+	return -EOPNOTSUPP;
+}
+
+static int tc956x_mac_configure(struct tc956x_data *td, int speed)
+{
+	void __iomem *emac_ctl = td->auxbus_data->emac_ctl;
+	int sp_sel;
+	u32 val;
+
+	sp_sel = tc956x_mac_speed_select(td, speed);
+	if (sp_sel < 0)
+		return sp_sel;
+
+	val = readl(emac_ctl);
+	val |= EMAC_LPIHWCLKEN;
+	val &= ~EMAC_INV_SGM_SIG_DET;
+	val = u32_replace_bits(val, PCS_CLK_PHY, EMAC_PHY_INF_SEL_MASK);
+	val = u32_replace_bits(val, sp_sel, EMAC_SP_SEL_MASK);
+	writel(val, emac_ctl);
+
+	return 0;
+}
+
+static int tc956x_mac_enable(struct tc956x_data *td)
+{
+	const struct tc956x_chip *chip = td->auxbus_data->chip;
+	struct plat_stmmacenet_data *plat = td->plat;
+	u32 id = td->auxbus_data->mac_id;
+	int ret;
+
+	tc956x_clock_enable(chip, id, MAC_CLOCK_TX);
+	tc956x_clock_enable(chip, id, MAC_CLOCK_RX);
+	tc956x_clock_enable(chip, id, MAC_CLOCK_ALL);
+	if (id)
+		tc956x_clock_enable(chip, id, MAC_CLOCK_RMII);
+
+	/* Set the speed related registers */
+	ret = tc956x_mac_configure(td, plat->max_speed);
+	if (ret)
+		return ret;
+
+	tc956x_reset_deassert(chip, id, MAC_RESET_MAC);
+	tc956x_pma_init(td);
+	tc956x_reset_deassert(chip, id, MAC_RESET_XPCS);
+
+	return 0;
+}
+
+static void tc956x_mac_disable(struct tc956x_data *td)
+{
+	const struct tc956x_chip *chip = td->auxbus_data->chip;
+	u32 id = td->auxbus_data->mac_id;
+
+	tc956x_reset_assert(chip, id, MAC_RESET_MAC);
+	tc956x_reset_assert(chip, id, MAC_RESET_PMA);
+	tc956x_reset_assert(chip, id, MAC_RESET_XPCS);
+
+	tc956x_clock_disable(chip, id, MAC_CLOCK_ALL);
+	tc956x_clock_disable(chip, id, MAC_CLOCK_RX);
+	tc956x_clock_disable(chip, id, MAC_CLOCK_TX);
+	if (id)
+		tc956x_clock_disable(chip, id, MAC_CLOCK_RMII);
+}
+
+static void tc956x_mac_init_state(struct tc956x_data *td)
+{
+	const struct tc956x_chip *chip = td->auxbus_data->chip;
+	u32 id = td->auxbus_data->mac_id;
+
+	tc956x_clock_disable(chip, id, MAC_CLOCK_125M);
+	tc956x_clock_disable(chip, id, MAC_CLOCK_312_5M);
+
+	tc956x_mac_disable(td);
+}
+
+/*
+ * Override method for dwxgmac301_dma_ops->init_rx_chan
+ *
+ * This differs from the dwxgmac301_dma_ops->init_rx_chan by translating the DMA
+ * address for TC956x internal bus. The window that provides DMA access to PCI
+ * is linearly mapped at 0x10_0000_0000.
+ */
+static void tc956x_dma_init_rx_chan(struct stmmac_priv *priv,
+				    void __iomem *ioaddr,
+				    struct stmmac_dma_cfg *dma_cfg,
+				    dma_addr_t phy, u32 chan)
+{
+	dma_addr_t translated = phy + TC956X_SLV00_SRC_ADDR;
+
+	dwxgmac2_dma_init_rx_chan(priv, ioaddr, dma_cfg, phy, chan);
+
+	writel(upper_32_bits(translated),
+	       ioaddr + XGMAC_DMA_CH_RxDESC_HADDR(chan));
+	writel(lower_32_bits(translated),
+	       ioaddr + XGMAC_DMA_CH_RxDESC_LADDR(chan));
+}
+
+/* Override method for dwxgmac301_dma_ops->init_tx_chan */
+static void tc956x_dma_init_tx_chan(struct stmmac_priv *priv,
+				    void __iomem *ioaddr,
+				    struct stmmac_dma_cfg *dma_cfg,
+				    dma_addr_t phy, u32 chan)
+{
+	dma_addr_t translated = phy + TC956X_SLV00_SRC_ADDR;
+
+	dwxgmac2_dma_init_tx_chan(priv, ioaddr, dma_cfg, phy, chan);
+
+	writel(upper_32_bits(translated),
+	       ioaddr + XGMAC_DMA_CH_TxDESC_HADDR(chan));
+	writel(lower_32_bits(translated),
+	       ioaddr + XGMAC_DMA_CH_TxDESC_LADDR(chan));
+}
+
+/* Override method for dwxgmac210_desc_ops->set_addr */
+static void tc956x_desc_set_addr(struct dma_desc *p, dma_addr_t addr)
+{
+	dma_addr_t translated = addr + TC956X_SLV00_SRC_ADDR;
+
+	p->des0 = cpu_to_le32(lower_32_bits(translated));
+	p->des1 = cpu_to_le32(upper_32_bits(translated));
+}
+
+/* Override method for dwxgmac210_desc_ops->set_sec_addr */
+static void tc956x_desc_set_sec_addr(struct dma_desc *p, dma_addr_t addr,
+				     bool is_valid)
+{
+	dma_addr_t translated = addr + TC956X_SLV00_SRC_ADDR;
+
+	p->des2 = cpu_to_le32(lower_32_bits(translated));
+	p->des3 = cpu_to_le32(upper_32_bits(translated));
+}
+
+/*
+ * Use mac_setup to apply the override methods above.
+ *
+ * The memory for the modified ops structures is pre-allocated as part of
+ * struct tc956x_data.
+ */
+static int tc956x_mac_setup(void *apriv, struct mac_device_info *mac)
+{
+	struct stmmac_priv *priv = apriv;
+	struct stmmac_desc_ops *desc;
+	struct stmmac_dma_ops *dma;
+	struct tc956x_data *td;
+
+	td = priv->plat->bsp_priv;
+
+	/* dwxgmac301_dma_ops needs extending to provide DMA address translation */
+	dma = &td->dma;
+	*dma = dwxgmac301_dma_ops;
+	dma->init_rx_chan = tc956x_dma_init_rx_chan;
+	dma->init_tx_chan = tc956x_dma_init_tx_chan;
+	mac->dma = dma;
+
+	/* dwxgmac210_desc_ops also needs extending for the same reason */
+	desc = &td->desc;
+	*desc = dwxgmac210_desc_ops;
+	desc->set_addr = tc956x_desc_set_addr;
+	desc->set_sec_addr = tc956x_desc_set_sec_addr;
+	mac->desc = desc;
+
+	priv->hw = mac;
+
+	return dwxgmac2_setup(priv);
+}
+
+static int tc956x_pcs_init(struct stmmac_priv *priv)
+{
+	struct xpcs_regmap_config xpcs_regmap_cfg;
+	void __iomem *emac = priv->ioaddr;
+	struct regmap *xpcs_regmap;
+	void __iomem *xpcs_addr;
+	struct dw_xpcs *xpcs;
+
+	xpcs_addr = emac + DWMAC_XPCS_OFFSET;
+	xpcs_regmap = devm_regmap_init_mmio(priv->device, xpcs_addr,
+					    &xpcs_regmap_config);
+	if (IS_ERR(xpcs_regmap))
+		return PTR_ERR(xpcs_regmap);
+
+	xpcs_regmap_cfg.regmap = xpcs_regmap;
+	xpcs_regmap_cfg.reg_indir = true;
+
+	xpcs = devm_xpcs_regmap_register(priv->device, &xpcs_regmap_cfg);
+	if (IS_ERR(xpcs))
+		return PTR_ERR(xpcs);
+
+	xpcs_config_eee_mult_fact(xpcs, priv->plat->mult_fact_100ns);
+	priv->hw->phylink_pcs = xpcs_to_phylink_pcs(xpcs);
+
+	return 0;
+}
+
+static struct phylink_pcs *tc956x_select_pcs(struct stmmac_priv *priv,
+					     phy_interface_t interface)
+{
+	return priv->hw->phylink_pcs;
+}
+
+static void tc956x_fix_mac_speed(void *bsp_priv, phy_interface_t interface,
+				 int speed, unsigned int mode)
+{
+	struct tc956x_data *td = bsp_priv;
+
+	tc956x_mac_configure(td, speed);
+	tc956x_pma_init(td);
+}
+
+static int tc956x_dwmac_suspend(struct device *dev, void *bsp_priv)
+{
+	struct tc956x_data *td = bsp_priv;
+
+	tc956x_mac_disable(td);
+
+	return 0;
+}
+
+static int tc956x_dwmac_resume(struct device *dev, void *bsp_priv)
+{
+	struct tc956x_data *td = bsp_priv;
+
+	return tc956x_mac_enable(td);
+}
+
+/* Called by tc956x_dwmac_probe(); return errors with dev_err_probe() */
+static int tc956x_dwmac_parse_dt(struct tc956x_data *td)
+{
+	struct device_node *mdio_node;
+	struct device *dev = td->dev;
+	struct device_node *np;
+
+	np = dev_of_node(dev);
+	if (!np)
+		return dev_err_probe(dev, -EINVAL, "no devicetree node\n");
+
+	/* Find the MDIO bus */
+	for_each_child_of_node(np, mdio_node) {
+		if (of_device_is_compatible(mdio_node,
+					    "snps,dwmac-mdio"))
+			break;
+	}
+
+	/* Pass the MDIO bus (if there is one) to the core driver */
+	if (mdio_node) {
+		td->plat->mdio_node = mdio_node;
+		td->plat->mdio_bus_data->needs_reset = true;
+	}
+
+	return 0;
+}
+
+static int tc956x_lookup_max_speed(phy_interface_t phy_interface)
+{
+	switch (phy_interface) {
+	case PHY_INTERFACE_MODE_SGMII:
+	case PHY_INTERFACE_MODE_2500BASEX:
+		return SPEED_2500;
+
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+/* Called by tc956x_dwmac_probe(); return errors with dev_err_probe() */
+static int tc956x_plat_dat_init(struct tc956x_data *td)
+{
+	struct plat_stmmacenet_data *plat;
+	phy_interface_t phy_interface;
+	struct device *dev = td->dev;
+	struct stmmac_axi *axi;
+	u32 speed;
+	int ret;
+	u32 i;
+
+	phy_interface = device_get_phy_mode(dev);
+	if (phy_interface < 0)
+		return -ENODEV;
+
+	/* The platform structure is allocated with devm_kzalloc() */
+	plat = stmmac_plat_dat_alloc(dev);
+	if (!plat)
+		return -ENOMEM;
+
+	ret = tc956x_lookup_max_speed(phy_interface);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "unsupported phy speed\n");
+	speed = ret;
+
+	plat->core_type = DWMAC_CORE_XGMAC;
+	plat->bus_id = td->auxbus_data->mac_id;
+	plat->phy_interface = phy_interface;
+	plat->mdio_bus_data = &td->mdio_bus_data;
+	/* Parent PCI device is used for DMA */
+	plat->dma_device = dev->parent;
+	plat->dma_cfg = &td->dma_cfg;
+	plat->dma_cfg->pbl = 32;
+	plat->dma_cfg->pblx8 = true;
+
+	/*
+	 * Our MAC clock rate is fixed at 125 MHz.  For XGMAC, clk_csr 0
+	 * represents "divide by 62" and gets the best rate under 2.5 MHz.
+	 */
+	plat->clk_csr = 0;	/* MDC clock = clk_csr_i / 62 */
+	plat->force_sf_dma_mode = 1;
+	plat->max_speed = speed;
+	plat->unicast_filter_entries = 32;
+
+	/*
+	 * TC956x has 8 RX queues but we observe significantly reduced RX
+	 * bandwidth if we don't have at least 8k FIFO space per queue, so
+	 * by default we avoid using all the queues.
+	 */
+	plat->rx_queues_to_use = 4;
+
+	/*
+	 * TX956x has 8 TX queues but only #0 to #3 work for general IP traffic.
+	 * For now we will limit the driver to only these queues.
+	 */
+	plat->tx_queues_to_use = 4;
+
+	/*
+	 * Oversized FIFOs result in reduced performance in bandwidth tests.
+	 * Limit them to 8KiB per queue, or the total available.
+	 */
+	plat->tx_fifo_size =
+		min(TC956X_TX_FIFO_KB, 8 * plat->tx_queues_to_use) * SZ_1K;
+	plat->rx_fifo_size =
+		min(TC956X_RX_FIFO_KB, 8 * plat->rx_queues_to_use) * SZ_1K;
+	plat->host_dma_width = 36;
+
+	plat->rx_sched_algorithm = MTL_RX_ALGORITHM_SP;
+	plat->tx_sched_algorithm = MTL_TX_ALGORITHM_WRR;
+
+	/* Default RX chan is set to queue index (0..rx_queues_to_use-1) */
+	for (i = 0; i < plat->rx_queues_to_use; i++)
+		plat->rx_queues_cfg[i].mode_to_use = MTL_QUEUE_DCB;
+
+	for (i = 0; i < plat->tx_queues_to_use; i++) {
+		plat->tx_queues_cfg[i].weight = 12;
+		plat->tx_queues_cfg[i].mode_to_use = MTL_QUEUE_DCB;
+
+		/* Only queues 5-8 support time-based scheduling on TC956X */
+		if (i >= 5)
+			plat->tx_queues_cfg[i].tbs_en = 1;
+	}
+
+	plat->fix_mac_speed = tc956x_fix_mac_speed;
+	plat->suspend = tc956x_dwmac_suspend;
+	plat->resume = tc956x_dwmac_resume;
+	plat->mac_setup = tc956x_mac_setup;
+	plat->pcs_init = tc956x_pcs_init;
+	plat->select_pcs = tc956x_select_pcs;
+
+	plat->bsp_priv = td;
+	plat->clk_ptp_rate = TC956X_PTP_CLOCK_RATE;
+
+	/* AXI Configuration */
+	axi = &td->axi;
+	axi->axi_lpi_en = 1;
+	axi->axi_wr_osr_lmt = 31;
+	axi->axi_rd_osr_lmt = 31;
+	/* All sizes (2^2..2^8) are supported */
+	axi->axi_blen_regval = DMA_AXI_BLEN_MASK;
+	plat->axi = axi;
+
+	plat->mac_port_sel_speed = speed;
+	plat->flags = STMMAC_FLAG_MULTI_MSI_EN | STMMAC_FLAG_TSO_EN;
+
+	td->plat = plat;
+
+	return 0;
+}
+
+/*
+ * The domain was created with IRQ_DOMAIN_FLAG_DESTROY_GC, so any mapped IRQs
+ * will be disposed when the domain is removed (when the device is destroyed).
+ */
+static int tc956x_stmmac_resources_init(struct tc956x_data *td,
+					struct stmmac_resources *res)
+{
+	struct irq_domain *irq_domain = td->irq_domain;
+	u32 i;
+
+	res->irq = irq_create_mapping(irq_domain, HWIRQ_EVENT);
+	if (!res->irq)
+		return -EINVAL;
+
+	for (i = 0; i < td->plat->tx_queues_to_use; i++) {
+		res->tx_irq[i] = irq_create_mapping(irq_domain, HWIRQ_TX0 + i);
+		if (!res->tx_irq[i])
+			return -EINVAL;
+	}
+
+	for (i = 0; i < td->plat->rx_queues_to_use; i++) {
+		res->rx_irq[i] = irq_create_mapping(irq_domain, HWIRQ_RX0 + i);
+		if (!res->tx_irq[i])
+			return -EINVAL;
+	}
+
+	res->addr = td->auxbus_data->emac;
+
+	return 0;
+}
+
+static int tc956x_dwmac_probe(struct auxiliary_device *adev,
+			      const struct auxiliary_device_id *id)
+{
+	struct stmmac_resources res = { };
+	struct device *dev = &adev->dev;
+	struct tc956x_data *td;
+	int ret;
+
+	td = devm_kzalloc(dev, sizeof(*td), GFP_KERNEL);
+	if (!td)
+		return -ENOMEM;
+
+	td->dev = dev;
+	td->auxbus_data = dev_get_platdata(dev);
+	if (!td->auxbus_data)
+		return dev_err_probe(dev, -EINVAL, "no platform data\n");
+
+	ret = tc956x_plat_dat_init(td);
+	if (ret)
+		return ret;
+
+	ret = tc956x_dwmac_parse_dt(td);
+	if (ret)
+		return ret;
+
+	td->irq_domain = tc956x_msigen_irq_domain_instantiate(td);
+	if (IS_ERR(td->irq_domain))
+		return dev_err_probe(dev, PTR_ERR(td->irq_domain),
+				     "failed to instantiate IRQ domain\n");
+
+	/* Put the MAC in a known initial state */
+	tc956x_mac_init_state(td);
+
+	ret = tc956x_stmmac_resources_init(td, &res);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to initialize stmmac resources\n");
+
+	ret = tc956x_mac_enable(td);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable MAC\n");
+
+	ret = stmmac_dvr_probe(dev, td->plat, &res);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed stmmac probe\n");
+
+	return 0;
+}
+
+static void tc956x_dwmac_remove(struct auxiliary_device *adev)
+{
+	struct device *dev = &adev->dev;
+	struct net_device *ndev = dev_get_drvdata(dev);
+	struct stmmac_priv *priv = netdev_priv(ndev);
+	struct tc956x_data *td = priv->plat->bsp_priv;
+
+	stmmac_dvr_remove(dev);
+	tc956x_mac_disable(td);
+}
+
+static const struct auxiliary_device_id tc956x_dwmac_ids[] = {
+	{ .name = TC956X_PCIE_DRIVER_NAME "." TC956X_XGMAC_DEV_NAME, },
+	{ },
+};
+MODULE_DEVICE_TABLE(auxiliary, tc956x_dwmac_ids);
+
+static struct auxiliary_driver tc956x_dwmac_driver = {
+	.name		= DRIVER_NAME,
+	.probe		= tc956x_dwmac_probe,
+	.remove		= tc956x_dwmac_remove,
+	.id_table	= tc956x_dwmac_ids,
+	.driver = {
+		.name	= DRIVER_NAME,
+		.pm	= &stmmac_simple_pm_ops,
+		.owner	= THIS_MODULE,
+	},
+};
+module_auxiliary_driver(tc956x_dwmac_driver);
+
+MODULE_DESCRIPTION("Toshiba TC956x PCIe Ethernet Network Driver");
+MODULE_LICENSE("GPL");
diff --git a/include/soc/toshiba/tc956x-dwmac.h b/include/soc/toshiba/tc956x-dwmac.h
new file mode 100644
index 0000000000000..5ca39cf764be9
--- /dev/null
+++ b/include/soc/toshiba/tc956x-dwmac.h
@@ -0,0 +1,84 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/*
+ * Copyright (C) 2026 by RISCstar Solutions Corporation.  All rights reserved.
+ */
+
+#ifndef __TOSHIBA_TC956X_DWMAC_H__
+#define __TOSHIBA_TC956X_DWMAC_H__
+
+#include <linux/compiler_types.h>
+#include <linux/types.h>
+
+#define TC956X_PCIE_DRIVER_NAME	"tc956x_pci"
+
+#define TC956X_XGMAC_DEV_NAME	"dwmac-tc956x"
+
+/* Starting address of the space translated by the PCIe endpoint bridge */
+#define TC956X_SLV00_SRC_ADDR	0x0000001000000000ULL
+
+enum tc956x_reset_id {
+	MAC_RESET_MAC		= 7,
+	MAC_RESET_PMA		= 30,
+	MAC_RESET_XPCS		= 31,
+};
+
+enum tc956x_clock_id {
+	MAC_CLOCK_TX		= 7,
+	MAC_CLOCK_RX		= 14,
+	MAC_CLOCK_ALL		= 31,
+	MAC_CLOCK_125M		= 29,
+	MAC_CLOCK_312_5M	= 30,
+	MAC_CLOCK_RMII		= 15,	/* eMAC 1 only */
+};
+
+/**
+ * struct tc956x_dwmac_data - Structure passed to stmmac auxiliary devices.
+ * @chip:		Context pointer needed for reset and clock operations
+ * @emac:		I/O mapped address used by eMAC
+ * @emac_ctl:		I/O mapped address used for eMAC control
+ * @msigen:		I/O mapped address used by MSIGEN
+ * @msigen_irq:		IRQ number used by MSIGEN
+ * @rev_id:		Chip revision ID (for quirks)
+ * @mac_id:		Unique device ID (0 or 1)
+ *
+ * This structure is passed via platform data to the stmmac auxiliary devices.
+ */
+struct tc956x_dwmac_data {
+	const struct tc956x_chip *chip;
+	void __iomem *emac;
+	void __iomem *emac_ctl;
+	void __iomem *msigen;
+	unsigned int msigen_irq;
+	u8 rev_id;
+	u8 mac_id;
+};
+
+extern void tc956x_reset_clock_set(const struct tc956x_chip *chip, bool reset,
+				   bool reg0, bool set, u8 bit);
+
+static inline void tc956x_reset_assert(const struct tc956x_chip *chip,
+				       u8 mac_id, enum tc956x_reset_id id)
+{
+	tc956x_reset_clock_set(chip, true, !mac_id, true, (u8)id);
+}
+
+static inline void tc956x_reset_deassert(const struct tc956x_chip *chip,
+					 u8 mac_id, enum tc956x_reset_id id)
+{
+	tc956x_reset_clock_set(chip, true, !mac_id, false, (u8)id);
+}
+
+static inline void tc956x_clock_enable(const struct tc956x_chip *chip,
+				       u8 mac_id, enum tc956x_clock_id id)
+{
+	tc956x_reset_clock_set(chip, false, !mac_id, true, (u8)id);
+}
+
+static inline void tc956x_clock_disable(const struct tc956x_chip *chip,
+					u8 mac_id, enum tc956x_clock_id id)
+{
+	tc956x_reset_clock_set(chip, false, !mac_id, false, (u8)id);
+}
+
+#endif /* __TOSHIBA_TC956X_DWMAC_H__*/
-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

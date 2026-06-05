Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id y87+JdIfImoNSwEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 05 Jun 2026 03:01:06 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD8D64435B
	for <lists+linux-stm32@lfdr.de>; Fri, 05 Jun 2026 03:01:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=riscstar-com.20251104.gappssmtp.com header.s=20251104 header.b=PqP3sHgM;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=riscstar.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C643CC8F273;
	Fri,  5 Jun 2026 01:01:05 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 31C2CC8F284
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jun 2026 01:01:04 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id
 5614622812f47-4865b9e2719so769877b6e.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 04 Jun 2026 18:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1780621263; x=1781226063;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VyP4bGzsJtjaWXxhoSrnojShl21NcNcWQsL4rRu4OI4=;
 b=PqP3sHgMeZ1AUfOdQk+GrmMvmPy8B2fCBoyNUq5IEkOhCEIcOejUVhv8K06ezcJQOM
 kTq+J4Rm8VDOWm06nB7P+oamsxLw6JC6lYWlVy0XJ0bHaoEiAFGEXTDgiE2M39XX6H4V
 Jwddm1qwJlUigFIveulJA7/JBKogVj46wCTPvueeTYSCVp902pgca23WLeqvI17PbSHt
 CEJFgbF/dGDK4tZNa5BOWVzhvndR739vyzzl9+MAmAbnbLpL7cr+Y5qbaVo1/aSIqa4K
 Tcpvm/GtBPq8doHvLtAdYGGUEa9fJrsi2QXKlgYbifZGdDN6iUF0uVYs7GuZNfn2oilc
 sJMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780621263; x=1781226063;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=VyP4bGzsJtjaWXxhoSrnojShl21NcNcWQsL4rRu4OI4=;
 b=Mbgk5oazW7dXtnRXkdwbMo+C3ibPVvCPEd291zTvIPD11UlS1U18z0B0ZuR70M2H67
 s9JnrR8kNx3/mqkDDNTOrNkFK7RbiliEHeD6ZoTxh80iviFkJakv4G2Y6h6Rs+k2/SGk
 jrlcCtRgkuDLfl9x3k53V/9aTHZSVSYIWl2otr/IJmELLKrTZbkeIdkBiLOUFk3Tii1f
 slPV/IyJPwsx7scwCZ+DPHl0wagKBSwV7JKA9qFnJAqx+qQ7U4IdOe84G3KEH4571tD4
 5ctNYNh3B3H+er0uBf0VqI6Vdd4Kgm+qMf/L2lcU/qQNa8OLL95yRIdkaOWk0R83CGKB
 AvtA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9qWqhPOKOw9HP9z+utacoaFNmbpwn9kQHOKAEzrEXdfwAfXraeYc2e9m1VXh50Pf6Qtx9ZTb5ws5lvCw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx5RcaW/QPZXh/XIbud+MLxfLRChMNQoOuvMVim8EDhzGHRunYG
 KLt8gLlp2dsulj5HWTcpMcFFyugy+yktme0KoRrXhXoIfgSTbd0jqtWOr7lDfEGzZAU=
X-Gm-Gg: Acq92OGoCT0mmLtdYTzi0sF/ey8xoJ7Nq9gBhX7N82MeKKwV6IVE5HkwiK/tmLDrcvw
 k0OLSsqGozWb7hYYTnUD/FoJDW7+V89fIw/BoHnbRxjYcokojDBrlz0SYSIm+AaBGRjsyvJpijb
 z6jQb25IDMMWPUI/W4Uoi1ISWr8xKWVgu062K0U8ilOlB6qh3yPfKtjjiMULeVgpUCESqW25v9w
 WVDGS8ELu8KLiQ37jkeXRFRPAbQ4KLtNaLXHlUdVYUfRc68ZwTeUAxL2joR1HCTMN9VgYpb1ngL
 a5OykwqDX6asSmxvcmgvaenLAy6FEAyma2ll86SzTeCGYykWhQ8bdGFALG9PmLtv8g1zb2+T7MR
 KE5mqRlnZB41OopIVveTBsbNuSOOqq1EaOD4qSnUQIlcNW8SDibAOXQeIuLZL0/owtShvwSL+Xu
 phBhRCfWdVzNNN+oJ+2w8ItIW492BMTMn/yNC/NA==
X-Received: by 2002:a05:6808:1310:b0:479:ac7d:6d94 with SMTP id
 5614622812f47-4868de5a7fcmr773609b6e.24.1780621262648; 
 Thu, 04 Jun 2026 18:01:02 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-4865b6ec694sm5544631b6e.5.2026.06.04.18.00.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2026 18:01:02 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com,
 rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linusw@kernel.org, brgl@kernel.org, arnd@arndb.de,
 gregkh@linuxfoundation.org
Date: Thu,  4 Jun 2026 20:00:18 -0500
Message-ID: <20260605010022.968612-12-elder@riscstar.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260605010022.968612-1-elder@riscstar.com>
References: <20260605010022.968612-1-elder@riscstar.com>
MIME-Version: 1.0
Cc: me@ziyao.cc, linux-kernel@vger.kernel.org, daniel@riscstar.com,
 chenchuangyu@xiaomi.com, linux-stm32@st-md-mailman.stormreply.com,
 mohd.anwar@oss.qualcomm.com, weishangjuan@eswincomputing.com,
 daniel@iogearbox.net, chenhuacai@kernel.org, john.fastabend@gmail.com,
 siyanteng@cqsoftware.com.cn, sdf@fomichev.me, devicetree@vger.kernel.org,
 hawk@kernel.org, elder@riscstar.com, linux-arm-msm@vger.kernel.org,
 richardcochran@gmail.com, rohan.g.thomas@altera.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, livelycarpet87@gmail.com,
 ast@kernel.org, linux-gpio@vger.kernel.org, wens@kernel.org,
 linux-arm-kernel@lists.infradead.org, inochiama@gmail.com,
 a0987203069@gmail.com, boon.khai.ng@altera.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, bpf@vger.kernel.org, julianbraha@gmail.com,
 hkallweit1@gmail.com
Subject: [Linux-stm32] [PATCH net-next v2 11/14] misc: tc956x_pci: add
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
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:maxime.chevallier@bootlin.com,m:rmk+kernel@armlinux.org.uk,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:me@ziyao.cc,m:linux-kernel@vger.kernel.org,m:daniel@riscstar.com,m:chenchuangyu@xiaomi.com,m:linux-stm32@st-md-mailman.stormreply.com,m:mohd.anwar@oss.qualcomm.com,m:weishangjuan@eswincomputing.com,m:daniel@iogearbox.net,m:chenhuacai@kernel.org,m:john.fastabend@gmail.com,m:siyanteng@cqsoftware.com.cn,m:sdf@fomichev.me,m:devicetree@vger.kernel.org,m:hawk@kernel.org,m:elder@riscstar.com,m:linux-arm-msm@vger.kernel.org,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:livelycarpet87@gmail.com,m:ast@kernel.org,m:linux-gpio@vger.kernel.org,m:wens@kernel.org,m:li
 nux-arm-kernel@lists.infradead.org,m:inochiama@gmail.com,m:a0987203069@gmail.com,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:bpf@vger.kernel.org,m:julianbraha@gmail.com,m:hkallweit1@gmail.com,m:andrew@lunn.ch,m:rmk@armlinux.org.uk,m:krzk@kernel.org,m:conor@kernel.org,m:johnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[elder@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[48];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[ziyao.cc,vger.kernel.org,riscstar.com,xiaomi.com,st-md-mailman.stormreply.com,oss.qualcomm.com,eswincomputing.com,iogearbox.net,kernel.org,gmail.com,cqsoftware.com.cn,fomichev.me,altera.com,bp.renesas.com,lists.infradead.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns,riscstar.com:mid,riscstar.com:from_mime,riscstar.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3FD8D64435B

The Toshiba TC956x is an Ethernet AVB/TSN bridge, and is
essentially a small and highly-specialized SoC.  It implements
a number of internal functions, including a GPIO controller,
registers that manage internal reset and clock control
signals, a PCIe switch, an internal PCIe endpoint, and mapping
hardware that translates between PCIe and internal addressing.

The internal PCIe endpoint implements two PCIe functions, each of
which has an attached eMAC.  Two devices represent each of these:
a PCIe function; and the eMAC.  The PCIe function driver serves
as the primary driver, creating other associated devices using
the auxiliary bus.

PCIe function 0 is responsible for managing common features on
the TC956x chip.  It initializes a "chip" data structure that
keeps track of common information, and makes that available via
its platform_data pointer to its PCIe function 1 peer.  It also
configures the address mapping hardware, and if a "gpio" devicetree
sub-node is found, it creates an auxiliary device to represent the
GPIO controller embedded in the TC956x.

For both PCIe function 0 and function 1, an "ethernet" devicetree
sub-node indicates that the attached XGMAC Ethernet controller
should be active.  In this case, an auxiliary device is created
to represent that hardware.  A block of information is set up to
be shared with the auxiliary device.  It provides the IRQ to be
used by the MAC device, as well as a some memory-mapped I/O pointers
and a few other bits of information about the chip.  This information
is supplied via the auxiliary device's platform_data pointer.

Co-developed-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 MAINTAINERS                        |   1 +
 drivers/misc/Kconfig               |  12 +
 drivers/misc/Makefile              |   1 +
 drivers/misc/tc956x_pci.c          | 741 +++++++++++++++++++++++++++++
 include/soc/toshiba/tc956x-dwmac.h |  84 ++++
 5 files changed, 839 insertions(+)
 create mode 100644 drivers/misc/tc956x_pci.c
 create mode 100644 include/soc/toshiba/tc956x-dwmac.h

diff --git a/MAINTAINERS b/MAINTAINERS
index f976c9fa9d9c0..0924f7ec43cb0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27057,6 +27057,7 @@ M:	Alex Elder <elder@kernel.org>
 M:	Daniel Thompson <danielt@kernel.org>
 S:	Maintained
 F:	Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml
+F:	drivers/misc/tc956x_pci.c
 
 TOSHIBA WMI HOTKEYS DRIVER
 M:	Azael Avalos <coproscefalo@gmail.com>
diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 00683bf06258f..e7152c641278d 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -644,6 +644,18 @@ config MCHP_LAN966X_PCI
 	    - lan966x-miim (MDIO_MSCC_MIIM)
 	    - lan966x-switch (LAN966X_SWITCH)
 
+config TOSHIBA_TC956X_PCI
+	tristate "Toshiba TC956X PCI function support"
+	depends on PCI
+	select AUXILIARY_BUS
+	select REGMAP
+	select REGMAP_MMIO
+	help
+	  This enables support for the two PCI functions implemented by
+	  the embedded PCIe endpoint in the Toshiba TC956X.  This driver
+	  creates auxiliary devices and requires drivers for these devices
+	  to function.
+
 source "drivers/misc/c2port/Kconfig"
 source "drivers/misc/eeprom/Kconfig"
 source "drivers/misc/cb710/Kconfig"
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index b32a2597d2467..644d508338382 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -75,3 +75,4 @@ obj-$(CONFIG_MCHP_LAN966X_PCI)	+= lan966x-pci.o
 obj-y				+= keba/
 obj-y				+= amd-sbi/
 obj-$(CONFIG_MISC_RP1)		+= rp1/
+obj-$(CONFIG_TOSHIBA_TC956X_PCI) += tc956x_pci.o
diff --git a/drivers/misc/tc956x_pci.c b/drivers/misc/tc956x_pci.c
new file mode 100644
index 0000000000000..88865712f00de
--- /dev/null
+++ b/drivers/misc/tc956x_pci.c
@@ -0,0 +1,741 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * Copyright (C) 2026 by RISCstar Solutions Corporation.  All rights reserved.
+ */
+
+/*
+ * The Toshiba TC956X implements a PCIe Gen 3 switch that connects an
+ * upstream x4 port to three downstream PCIe ports--two external ones
+ * and an internal one which implements an internal PCIe endpoint.  The
+ * endpoint implements two PCIe functions, each having a Synopsys XGMAC
+ * Ethernet interface.
+ *
+ * The TC956X implements other functionality, including an embedded
+ * MCU, a UART, a GPIO controller, internal resets and clocks, and
+ * interrupt handling.  These features are separate from (and in some
+ * cases used by) both Ethernet XGMACs.  Each Ethernet MAC must be
+ * attached to a working PHY for it to be functional, and for this
+ * reason either of them (or both!) might not be usable/used.
+ *
+ * To support the non-XGMAC functionality on the TC956X regardless of
+ * the presence of either Ethernet PHY, the Ethernet functions are
+ * treated as two parts:  a PCIe function; and a Synopsys XGMAC component.
+ * The PCIe function has access to the BARs used by the XGMAC, and maps
+ * them for use.  Each XGMAP is treated as an auxiliary sub-device of
+ * its (parent) PCIe function, and is probed and bound separate from it.
+ *
+ * This PCI driver binds to the Toshiba TC956X (physical) PCI function
+ * (VID 0x1179, DID 0x0220).  There are two of these present on the
+ * TC956X SoC.  This driver maps the PCI BARs and performs other initial
+ * setup, then creates auxiliary devices.
+ *
+ * Embedded PCI function 0 manages non-MAC functionality.  This includes
+ * creating and registering the GPIO auxiliary device (if necessary), as
+ * well as asserting and deasserting internal reset signals and enabling
+ * and disabling internal clocks.
+ *
+ * Both PCI functions create auxiliary devices to implement an Ethernet
+ * XGMAC.  A block of data (struct tc956x_dwmac_data) is shared using
+ * the auxiliary device's platform data with the stmmac driver that
+ * binds to the XGMAC auxiliary device.  This includes a number of
+ * pointers to memory regions used by the stmmac driver.
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/bitfield.h>
+#include <linux/compiler_types.h>
+#include <linux/device.h>
+#include <linux/dev_printk.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/pci.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+#include <linux/types.h>
+
+#include <soc/toshiba/tc956x-dwmac.h>
+
+#define DRIVER_NAME			TC956X_PCIE_DRIVER_NAME
+
+#define GPIO_DEVICE_NAME		"tc9564-gpio"
+
+#define PCI_DEVICE_ID_TOSHIBA_TC956X	0x0220
+
+/* PCI BAR assignments */
+#define PCI_BAR_BRIDGE_CONFIG		0	/* For TAMAP */
+#define PCI_BAR_SFR			4	/* For all other features */
+
+/* Chip and revision ID register */
+#define NCID_OFFSET			0x0000
+#define NCID_REV_ID_MASK		GENMASK(7, 0)
+
+/* Reset and clock register offsets.  MAC resets and clocks are controlled
+ * by bits in register 0 for MAC0, register 1 for MAC1.  Other non-MAC
+ * resets and clocks (whose IDs are defined here) are controlled by bits
+ * in register 0.
+ *
+ * These are relative to the base of the clock/reset regmap.
+ */
+#define RSTCTRL0_OFFSET			0x0008
+#define RSTCTRL1_OFFSET			0x0010
+#define CLKCTRL0_OFFSET			0x0004
+#define CLKCTRL1_OFFSET			0x000c
+
+/* Resets (asserted or deasserted) */
+enum reset_id {
+	RESET_MCU		= 0,
+	RESET_MCU1		= 1,
+	RESET_MSIGEN		= 18,
+	RESET_INTC		= 4,
+	RESET_UART0		= 16,
+};
+
+/* Clocks (enabled or disabled) */
+enum clock_id {
+	CLOCK_MCU		= 0,
+	CLOCK_SRAM		= 13,
+	CLOCK_MSIGEN		= 18,
+	CLOCK_PLL		= 24,
+	CLOCK_SGMII		= 25,
+	CLOCK_REFCLKO		= 26,	/* 25 MHz clock output signal */
+	CLOCK_INTC		= 4,
+	CLOCK_UART0		= 16,
+};
+
+/*
+ * The TAMAP function has four AXI translation tables each with eight
+ * 4-byte registers.  The Ethernet MAC accesses PCI resources through
+ * addressses based at TC956X_SLV00_SRC_ADDR, and the first translation
+ * table converts those to PCIe address space starting based at 0x0.
+ * We don't use the other three available TAMAC tables.
+ */
+#define ATR_AXI4_SLV0_OFFSET		0x0800
+#define AXI4_TABLE_ENTRY_COUNT		4
+#define AXI4_ENTRY_BASE(id)		((id) * AXI4_TABLE_STRIDE)
+#define AXI4_TABLE_STRIDE               0x20
+
+/* Address translation space parameters used for entry 0 */
+#define SLV00_ATR_SIZE			35	/* 2^36 (64 gigabytes) */
+/* TC956X_SLV00_SRC_ADDR is the source address, defined in the common header */
+#define SLV00_TRSL_ADDR			0x0000000000000000ULL
+
+/* Translation entry registers, fields, and values used */
+#define SRC_ADDR_LO_OFFSET		0x0000
+#define ATR_IMPL			BIT(0)		/* 1 = enabled */
+#define ATR_SIZE_MASK			GENMASK(6, 1)	/* size 2^(ATR + 1) */
+#define SRC_ADDR_HI_OFFSET		0x0004
+#define TRSL_ADDR_LO_OFFSET		0x0008
+#define TRSL_ADDR_HI_OFFSET		0x000c
+#define TRSL_PARAM_OFFSET		0x0010
+#define TRSL_ID_MASK			GENMASK(3, 0)
+#define TRSL_ID_PCIE_TX_RX		0
+#define TRSL_PARAM_MASK			GENMASK(27, 16)
+
+/*
+ * The TC956X implements an "SFR" address space, which provides access
+ * to *all* internal IP block registers, both MAC and non-MAC.  This
+ * space is also accessible via an I2C interface used by the PCI pwrctl
+ * driver (in "pci-pwrctrl-tc9563.c"), though that driver accesses the
+ * range in a very limited way.  For the MAC functions we divide up the
+ * range, providing specific addresses needed by the stmmac driver.
+ */
+#define EMAC_CTL_OFFSET(_mac_id)	((_mac_id) ? 0x1074 : 0x1070)
+#define MSIGEN_OFFSET(_mac_id)		((_mac_id) ? 0xf100 : 0xf000)
+#define DWMAC_OFFSET(_mac_id)		((_mac_id) ? 0x48000 : 0x40000)
+
+/*
+ * struct tc956x_chip - Common information related to the TC956X chip
+ * @dev:		Device structure for function 0
+ * @sfr:		Mapped SFR regions (BAR 4, one per PCI function)
+ * @bridge_config:	Regmap used for bridge configuration (BAR 0)
+ * @reset_clock_regmap:	Regmap used for resets and clocks
+ * @rev_id:		Chip revision ID (for quirks)
+ */
+struct tc956x_chip {
+	struct device *dev;
+	void __iomem *sfr[2];
+	void __iomem *bridge_config;
+	struct regmap *reset_clock_regmap;
+	u8 rev_id;
+};
+
+static const struct regmap_config gpio_regmap_config = {
+	.name		= "tc956x-gpio",
+	.reg_bits	= 32,
+	.reg_stride	= 4,
+	.reg_base	= 0x1200,	/* Register GPIOI0 */
+	.val_bits	= 32,
+	.max_register	= 0x1214,	/* Register GPIOO1 */
+};
+
+static const struct regmap_config reset_clock_regmap_config = {
+	.name		= "tc956x-clk-reset",
+	.reg_bits	= 32,
+	.reg_stride	= 4,
+	.reg_base	= 0x1000,	/* Register NCTLSTS */
+	.val_bits	= 32,
+	.max_register	= 0x1010,	/* Register NRSTCTRL1 */
+};
+
+/* Common clock/reset register update function (also used for MACs) */
+void tc956x_reset_clock_set(const struct tc956x_chip *chip, bool reset,
+			    bool reg0, bool set, u8 bit)
+{
+	u32 mask = BIT(bit);
+	u32 offset;
+
+	if (reset)
+		offset = reg0 ? RSTCTRL0_OFFSET : RSTCTRL1_OFFSET;
+	else
+		offset = reg0 ? CLKCTRL0_OFFSET : CLKCTRL1_OFFSET;
+
+	/* Note: no need to check for errors on read/write for MMIO regmap */
+	(void)regmap_update_bits(chip->reset_clock_regmap, offset, mask,
+				 set ? mask : 0);
+}
+EXPORT_SYMBOL_GPL(tc956x_reset_clock_set);
+
+static void chip_reset_assert(const struct tc956x_chip *chip, enum reset_id id)
+{
+	tc956x_reset_clock_set(chip, true, true, true, (u8)id);
+}
+
+static void chip_reset_deassert(const struct tc956x_chip *chip,
+				enum reset_id id)
+{
+	tc956x_reset_clock_set(chip, true, true, false, (u8)id);
+}
+
+static void chip_clock_enable(const struct tc956x_chip *chip, enum clock_id id)
+{
+	tc956x_reset_clock_set(chip, false, true, true, (u8)id);
+}
+
+static void chip_clock_disable(const struct tc956x_chip *chip,
+			       enum clock_id id)
+{
+	tc956x_reset_clock_set(chip, false, true, false, (u8)id);
+}
+
+static void adev_release(struct device *dev)
+{
+	struct auxiliary_device *adev = to_auxiliary_dev(dev);
+
+	of_node_put(adev->dev.of_node);
+	kfree(adev);
+}
+
+static void adev_remove(void *data)
+{
+	struct auxiliary_device *adev = data;
+
+	auxiliary_device_delete(adev);
+	auxiliary_device_uninit(adev);
+}
+
+/* The of_node reference is always be dropped (success or not) */
+static int adev_device_add(struct device *dev, const char *name, u32 id,
+			   struct device_node *of_node, void *platform_data)
+{
+	struct auxiliary_device *adev;
+	int ret;
+
+	adev = kzalloc_obj(*adev);
+	if (!adev) {
+		of_node_put(of_node);
+		return -ENOMEM;
+	}
+
+	adev->id = id;
+	adev->name = name;
+	adev->dev.parent = dev;
+	adev->dev.platform_data = platform_data;
+	adev->dev.release = adev_release;
+	adev->dev.of_node = of_node;
+
+	ret = auxiliary_device_init(adev);
+	if (ret) {
+		of_node_put(of_node);
+		kfree(adev);
+		return ret;
+	}
+
+	ret = auxiliary_device_add(adev);
+	if (ret) {
+		auxiliary_device_uninit(adev);
+		return ret;
+	}
+
+	return devm_add_action_or_reset(dev, adev_remove, adev);
+}
+
+/* Returns a reference to the GPIO's DT sub-node, or a null pointer */
+static struct device_node *dev_node_child_gpio(struct device *dev)
+{
+	struct device_node *np;
+
+	/* The GPIO sub-node is not required (platform might not need it) */
+	for_each_child_of_node(dev->of_node, np)
+		if (!strcmp(np->name, "gpio"))
+			break;
+	if (!np)
+		return NULL;
+
+	/* If it's there, make sure it contains its required properties */
+	if (!of_property_present(np, "gpio-controllerX"))
+		dev_err(dev, "gpio node contains no gpio-contrller property\n");
+	else if (!of_property_present(np, "#gpio-cellsX"))
+		dev_err(dev, "gpio node contains no #gpio-cells property\n");
+	else
+		return np;	/* Found a GPIO sub-node */
+
+	/* If we reported a problem, pretend there was no gpio node */
+	of_node_put(np);
+
+	return NULL;
+}
+
+/* The embedded GPIO controller has an auxiliary device driver */
+static int chip_gpio_adev_add(struct tc956x_chip *chip)
+{
+	struct device *dev = chip->dev;
+	struct device_node *np;
+	struct regmap *regmap;
+
+	np = dev_node_child_gpio(dev);
+	if (!np)
+		return 0;
+
+	regmap = devm_regmap_init_mmio(dev, chip->sfr[0], &gpio_regmap_config);
+	if (IS_ERR(regmap)) {
+		of_node_put(np);
+		return PTR_ERR(regmap);
+	}
+
+	return adev_device_add(dev, GPIO_DEVICE_NAME, 0, np, regmap);
+}
+
+/* The two embedded XGMAC controllers have an auxiliary device driver */
+static int function_xgmac_adev_add(struct pci_dev *pdev,
+				   struct tc956x_chip *chip,
+				   unsigned int msigen_irq)
+{
+	u8 mac_id = PCI_FUNC(pdev->devfn);
+	struct device *dev = &pdev->dev;
+	struct tc956x_dwmac_data *data;
+	struct device_node *np;
+	void __iomem *sfr;
+	int ret;
+
+	if (mac_id > 1)
+		return -EINVAL;
+
+	/* If there's no ethernet subnode, there's nothing to do */
+	for_each_child_of_node(dev->of_node, np)
+		if (!strcmp(np->name, "ethernet"))
+			break;
+	if (!np)
+		return 0;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data) {
+		of_node_put(np);
+		return -ENOMEM;
+	}
+
+	sfr = chip->sfr[mac_id];
+
+	data->chip = chip;
+	data->msigen = sfr + MSIGEN_OFFSET(mac_id);
+	data->msigen_irq = msigen_irq;
+	data->emac = sfr + DWMAC_OFFSET(mac_id);
+	data->emac_ctl = sfr + EMAC_CTL_OFFSET(mac_id);
+	data->rev_id = chip->rev_id;
+	data->mac_id = mac_id;
+
+	ret = adev_device_add(dev, TC956X_XGMAC_DEV_NAME, mac_id, np, data);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int chip_reset_clock_init(struct tc956x_chip *chip)
+{
+	void __iomem *base = chip->sfr[0];
+	struct device *dev = chip->dev;
+	struct regmap *regmap;
+
+	regmap = devm_regmap_init_mmio(dev, base, &reset_clock_regmap_config);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+	chip->reset_clock_regmap = regmap;
+
+	return 0;
+}
+
+static int chip_tamap_init(struct tc956x_chip *chip, struct pci_dev *pdev)
+{
+	void __iomem *base;
+
+	base = pcim_iomap_region(pdev, PCI_BAR_BRIDGE_CONFIG, DRIVER_NAME);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	chip->bridge_config = base + ATR_AXI4_SLV0_OFFSET;
+
+	return 0;
+}
+
+/**
+ * chip_tamap_config() - Configure the table address map registers
+ * @chip:	The TC956X chip pointer
+ *
+ * Populate the registers used to translate AXI bus accesses to PCI TLPs.
+ * TC956X_SLV00_SRC_ADDR defines the base address of the AXI address range.
+ * AXI addresses are translated to the PCIe address range, whose base address
+ * is defined by SLV00_TRSL_ADDR (which is 0x0).
+ */
+static void chip_tamap_config(struct tc956x_chip *chip)
+{
+	void __iomem *table_base = chip->bridge_config;
+	void __iomem *entry_base;
+	u32 trsl_param_val;
+	u32 atr_size_val;
+	u32 val;
+	u32 i;
+
+	/*
+	 * The lower bits of the source address must be zero, because the
+	 * SRC_ADDR_LO register encodes the address translation space size
+	 * and "implmented" bit there.  The size field defines the size of
+	 * the translation space (2^(ATR_SIZE + 1)).  The minimum size is
+	 * 4096 bytes, so ATR_SIZE value must be 11 or more.
+	 */
+	BUILD_BUG_ON(!!u32_get_bits(lower_32_bits(TC956X_SLV00_SRC_ADDR),
+						  ATR_SIZE_MASK));
+	BUILD_BUG_ON(TC956X_SLV00_SRC_ADDR & ATR_IMPL);
+	BUILD_BUG_ON(SLV00_ATR_SIZE < 11);
+
+	/*
+	 * We only use the first AXI4 slave TAMAC table:
+	 *	EDMA address region:	0x10 0000 0000 - 0x1f ffff ffff
+	 *	is translated to:	0x00 0000 0000 - 0x0f ffff ffff
+	 */
+	entry_base = table_base + AXI4_ENTRY_BASE(0);
+
+	atr_size_val = u32_encode_bits(SLV00_ATR_SIZE, ATR_SIZE_MASK);
+	atr_size_val |= ATR_IMPL;
+	val = lower_32_bits(TC956X_SLV00_SRC_ADDR) | atr_size_val;
+	writel(val, entry_base + SRC_ADDR_LO_OFFSET);
+
+	val = upper_32_bits(TC956X_SLV00_SRC_ADDR);
+	writel(val, entry_base + SRC_ADDR_HI_OFFSET);
+
+	val = lower_32_bits(SLV00_TRSL_ADDR);
+	writel(val, entry_base + TRSL_ADDR_LO_OFFSET);
+
+	val = upper_32_bits(SLV00_TRSL_ADDR);
+	writel(val, entry_base + TRSL_ADDR_HI_OFFSET);
+
+	/* This TRSL_PARAM value is assigned for all four TAMAC tables */
+	trsl_param_val = u32_encode_bits(TRSL_ID_PCIE_TX_RX, TRSL_ID_MASK);
+
+	writel(trsl_param_val, entry_base + TRSL_PARAM_OFFSET);
+
+	/* Set all other unused entries to default values (no translation) */
+	for (i = 1; i < AXI4_TABLE_ENTRY_COUNT; i++) {
+		entry_base = table_base + AXI4_ENTRY_BASE(i);
+
+		writel(0x0, entry_base + SRC_ADDR_LO_OFFSET);
+		writel(0x0, entry_base + SRC_ADDR_HI_OFFSET);
+		writel(0x0, entry_base + TRSL_ADDR_LO_OFFSET);
+		writel(0x0, entry_base + TRSL_ADDR_HI_OFFSET);
+		writel(trsl_param_val, entry_base + TRSL_PARAM_OFFSET);
+	}
+}
+
+static void chip_msigen_enable(struct tc956x_chip *chip)
+{
+	chip_clock_enable(chip, CLOCK_MSIGEN);
+	chip_reset_deassert(chip, RESET_MSIGEN);
+}
+
+static void chip_msigen_disable(struct tc956x_chip *chip)
+{
+	chip_reset_assert(chip, RESET_MSIGEN);
+	chip_clock_disable(chip, CLOCK_MSIGEN);
+}
+
+static void chip_init_state(struct tc956x_chip *chip)
+{
+	/* The only IP block we currently use is MSIGEN */
+	chip_reset_assert(chip, RESET_MCU);
+	chip_reset_assert(chip, RESET_MCU1);
+	chip_reset_assert(chip, RESET_INTC);
+	chip_reset_assert(chip, RESET_UART0);
+	chip_clock_disable(chip, CLOCK_MCU);
+	chip_clock_disable(chip, CLOCK_SRAM);
+	chip_clock_disable(chip, CLOCK_PLL);
+	chip_clock_disable(chip, CLOCK_SGMII);
+	chip_clock_disable(chip, CLOCK_REFCLKO);
+	chip_clock_disable(chip, CLOCK_INTC);
+	chip_clock_disable(chip, CLOCK_UART0);
+
+	/* Start with MSIGEN in reset with its clock disabled */
+	chip_msigen_disable(chip);
+}
+
+static void chip_link_del(void *data)
+{
+	struct device_link *link = data;
+
+	device_link_del(link);
+}
+
+/*
+ * Function 0 will allocate the chip structure that is shared by both
+ * functions.  Once it has allocated the structure it assigns it as
+ * the PCI device platform data.  Function 1 can access the shared
+ * chip structure by looking up the function 0 device to use its
+ * platform data..
+ *
+ * Returns a chip structure pointer, or a pointer-coded error.
+ */
+static struct tc956x_chip *chip_get(struct pci_dev *pdev)
+{
+	unsigned int devfn = pdev->devfn;
+	struct device *dev = &pdev->dev;
+	struct tc956x_chip *chip;
+	struct device_link *link;
+	struct pci_dev *slot0;
+	int ret;
+
+	/* Function 0 just allocates the chip structure */
+	if (!PCI_FUNC(devfn)) {
+		chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
+		if (!chip)
+			return ERR_PTR(-ENOMEM);
+
+		/*
+		 * The function whose device pointer matches the chip's
+		 * device pointer manages common resources (like MSIGEN).
+		 */
+		chip->dev = dev;
+
+		return chip;
+	}
+
+	/* Function 1 has to get the chip structure from function 0 */
+	slot0 = pci_get_slot(pdev->bus, PCI_DEVFN(PCI_SLOT(devfn), 0));
+	if (!slot0)
+		return ERR_PTR(-ENXIO);
+
+	/* If function 0 hasn't set up the chip yet, try again later */
+	chip = dev_get_platdata(&slot0->dev);
+	if (!chip) {
+		ret = -EPROBE_DEFER;
+		goto err_put_slot;
+	}
+
+	/* Mark function 1's device as dependent on function 0 */
+	link = device_link_add(dev, &slot0->dev, DL_FLAG_STATELESS);
+	if (!link) {
+		ret = -ENODEV;
+		goto err_put_slot;
+	}
+
+	ret = devm_add_action_or_reset(dev, chip_link_del, link);
+	if (ret)
+		goto err_put_slot;
+
+	return chip;
+
+err_put_slot:
+	pci_dev_put(slot0);
+
+	return ERR_PTR(ret);
+}
+
+static int chip_init(struct tc956x_chip *chip, struct pci_dev *pdev)
+{
+	u32 id = PCI_FUNC(pdev->devfn) ? 1 : 0;
+	u32 val;
+	int ret;
+
+	/* Both chips need to map their SFR region */
+	chip->sfr[id] = pcim_iomap_region(pdev, PCI_BAR_SFR, DRIVER_NAME);
+	if (IS_ERR(chip->sfr[id]))
+		return PTR_ERR(chip->sfr[id]);
+
+	/* Function 0 handles common initialization */
+	if (id)
+		return 0;
+
+	ret = chip_tamap_init(chip, pdev);
+	if (ret)
+		return ret;
+
+	ret = chip_reset_clock_init(chip);
+	if (ret)
+		return ret;
+
+	chip_init_state(chip);
+
+	ret = chip_gpio_adev_add(chip);
+	if (ret)
+		return ret;
+
+	/* Get the revision ID */
+	val = readl(chip->sfr[0] + NCID_OFFSET);
+	chip->rev_id = u32_get_bits(val, NCID_REV_ID_MASK);
+
+	chip_tamap_config(chip);
+	chip_msigen_enable(chip);
+
+	return 0;
+}
+
+static void pcim_free_irq_vectors(void *data)
+{
+	struct pci_dev *pdev = data;
+
+	pci_free_irq_vectors(pdev);
+}
+
+static int pcim_alloc_irq_vectors(struct pci_dev *pdev, unsigned int min_vecs,
+				  unsigned int max_vecs, unsigned int flags)
+{
+	int ret;
+
+	ret = pci_alloc_irq_vectors(pdev, min_vecs, max_vecs, flags);
+	if (ret)
+		return ret;
+
+	return devm_add_action_or_reset(&pdev->dev, pcim_free_irq_vectors, pdev);
+}
+
+static int
+tc956x_function_probe(struct pci_dev *pdev, const struct pci_device_id *id)
+{
+	struct device *dev = &pdev->dev;
+	struct tc956x_chip *chip;
+	unsigned int msigen_irq;
+	int ret;
+
+	/* Despite being a PCI device, we require devicetree */
+	if (!dev->of_node)
+		return dev_err_probe(dev, -EINVAL, "no devicetree node\n");
+
+	ret = pcim_enable_device(pdev);
+	if (ret)
+		return ret;
+
+	pci_set_master(pdev);
+
+	/* Function 1 gets -EPROBE_DEFER until function 0 sets platform data */
+	chip = chip_get(pdev);
+	if (IS_ERR(chip))
+		return dev_err_probe(dev, PTR_ERR(chip), "failed to get chip\n");
+
+	/* We called pcim_enable_device() so this will be freed automatically */
+	ret = pcim_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSI);
+	if (ret < 1)
+		return dev_err_probe(dev, ret ? : -EIO,
+				     "failed to allocate IRQ vectors\n");
+
+	ret = pci_irq_vector(pdev, 0);
+	if (ret < 1)
+		return dev_err_probe(dev, ret ? : -EIO, "failed to get IRQ\n");
+	msigen_irq = ret;
+
+	ret = chip_init(chip, pdev);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to initialize chip\n");
+
+	ret = function_xgmac_adev_add(pdev, chip, msigen_irq);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to add xgmap device\n");
+
+	/* We're ready; the other function can now probe */
+	dev->platform_data = chip;
+
+	return 0;
+}
+
+static void tc956x_function_remove(struct pci_dev *pdev)
+{
+	struct tc956x_chip *chip = dev_get_platdata(&pdev->dev);
+
+	if (&pdev->dev == chip->dev)
+		chip_msigen_disable(chip);
+
+	pci_free_irq_vectors(pdev);
+
+	pci_clear_master(pdev);
+}
+
+static const struct pci_device_id tc956x_function_id_table[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_TOSHIBA, PCI_DEVICE_ID_TOSHIBA_TC956X), },
+	{ },
+};
+MODULE_DEVICE_TABLE(pci, tc956x_function_id_table);
+
+static int tc956x_chip_suspend_noirq(struct device *dev)
+{
+	struct tc956x_chip *chip = dev_get_platdata(dev);
+	struct pci_dev *pdev = to_pci_dev(dev);
+
+	if (dev == chip->dev)
+		chip_msigen_disable(chip);
+
+	/* It seems most callers ignore the return value here */
+	pci_save_state(pdev);
+	pci_wake_from_d3(pdev, true);
+
+	return 0;
+}
+
+static int tc956x_chip_resume_noirq(struct device *dev)
+{
+	struct tc956x_chip *chip = dev_get_platdata(dev);
+	struct pci_dev *pdev = to_pci_dev(dev);
+
+	pci_wake_from_d3(pdev, false);
+	pci_set_power_state(pdev, PCI_D0);
+	pci_restore_state(pdev);
+
+	if (dev != chip->dev)
+		return 0;
+
+	/* Reconfigure tamap tables following suspend */
+	chip_tamap_config(chip);
+
+	chip_msigen_enable(chip);
+
+	return 0;
+}
+
+static DEFINE_NOIRQ_DEV_PM_OPS(tc956x_chip_pm_ops,
+			       tc956x_chip_suspend_noirq,
+			       tc956x_chip_resume_noirq);
+
+static struct pci_driver tc956x_function_driver = {
+	.name		= DRIVER_NAME,
+	.id_table	= tc956x_function_id_table,
+	.probe		= tc956x_function_probe,
+	.remove		= tc956x_function_remove,
+	.driver		= {
+		.name		= DRIVER_NAME,
+		.owner		= THIS_MODULE,
+		.pm		= pm_sleep_ptr(&tc956x_chip_pm_ops),
+	},
+};
+
+module_pci_driver(tc956x_function_driver);
+
+MODULE_DESCRIPTION("Toshiba TC956X PCIe Embedded Function Driver");
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

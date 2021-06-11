Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9BB3A49CD
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Jun 2021 22:05:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 92351C58D79;
	Fri, 11 Jun 2021 20:05:54 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 68BCAC58D79
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Jun 2021 20:05:52 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id g20so6330807ejt.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Jun 2021 13:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7rf5mkLuUypq0h7ZqDlXOvS/OCZFflVmrxJpR4TU2eA=;
 b=t4VE3vgG7a2dNm2KQ0jY/pcL4ZpcfnsnP4N/bYaYo4FxU/60OdMpn50QlQ6ZAXmCj6
 XmCx+MTq1LRK5dkoa2bCbaJMf42xXIrpkgfiLa8YOVaV5HTZf2WCHiACEjVHOJZLBsv1
 bQ+r/8vr0fpTSH67pE1HQqaFEof+Um/FBu+ts6mg2LQf2FySDvnQTOqi3FPrtfQqiatV
 4IG2muGBxmF5XVF94iiFrTXWojIN0YjW41f0DRDUVnrCu15xqxldzqAVfONHZ6rJmNux
 vUIfNzw3HFN4L9gWOPNjP3PZ7IizwVY6QcC8bp3iA8Luz7DVWGDLBL78yk8X/cdOiPKx
 YsJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7rf5mkLuUypq0h7ZqDlXOvS/OCZFflVmrxJpR4TU2eA=;
 b=MlWiNhRkWbrkZK95UjEEiUfNTPrNTYGVljlQECDnuXsVOUdAm9DXHHiZ0l04K3VxjR
 02cBbFlIPNPowOhxfU8c+B8iWxGVPqy5P+LTKTrAaW1oDyJ4/DZkk02Ch0EqVWh5uAcp
 r997eYzx+Ip1Ankx5fkc8Zn3TRl6ixQXWUYPEJvDAGM2kMICf6AMTbKbm0PMJ/+ovNRw
 xFSWBB5V3eIaHNfTSulCR4yz/ojq4RjyIkeq2jXOBFLKjbKBZEsw6lveADJZCANb9JYJ
 8e1Dmj5z4+PernXrYvjS9mQ377b4+9N6lxJlgBwWdwkaIr5uQwe46ztIirzAomJwPJex
 MItw==
X-Gm-Message-State: AOAM531yzD5mkny3I0cNzxh8FxoSWsO+JLWS/cGZML9Re8az+Sna/MVt
 5s0LTXoW7dlXsxRZUczAN+8=
X-Google-Smtp-Source: ABdhPJyX2aRStoWQOKLr6waovMSjYq08hLi0hGba4pRj00UF0JHkCfoaNzggn9/VQj4eUEeI80iUgg==
X-Received: by 2002:a17:906:d297:: with SMTP id
 ay23mr5137857ejb.418.1623441951940; 
 Fri, 11 Jun 2021 13:05:51 -0700 (PDT)
Received: from localhost.localdomain ([188.26.52.84])
 by smtp.gmail.com with ESMTPSA id w2sm2392084ejn.118.2021.06.11.13.05.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 13:05:51 -0700 (PDT)
From: Vladimir Oltean <olteanv@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 netdev@vger.kernel.org
Date: Fri, 11 Jun 2021 23:05:22 +0300
Message-Id: <20210611200531.2384819-5-olteanv@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210611200531.2384819-1-olteanv@gmail.com>
References: <20210611200531.2384819-1-olteanv@gmail.com>
MIME-Version: 1.0
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 Wong Vee Khee <vee.khee.wong@linux.intel.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: [Linux-stm32] [PATCH v3 net-next 04/13] net: pcs: xpcs: move
	register bit descriptions to a header file
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

From: Vladimir Oltean <vladimir.oltean@nxp.com>

Vendors which integrate the Designware XPCS might modify a few things
here and there, and to support those, it's best to create separate C
files in order to not clutter up the main pcs-xpcs.c.

Because the vendor files might want to access the common xpcs registers
too, let's move them in a header file which is local to this driver and
can be included by vendor files as appropriate.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
v2->v3: none
v1->v2: none

 MAINTAINERS                |   1 +
 drivers/net/pcs/pcs-xpcs.c |  97 +---------------------------------
 drivers/net/pcs/pcs-xpcs.h | 103 +++++++++++++++++++++++++++++++++++++
 3 files changed, 105 insertions(+), 96 deletions(-)
 create mode 100644 drivers/net/pcs/pcs-xpcs.h

diff --git a/MAINTAINERS b/MAINTAINERS
index e69c1991ec3b..a9509f1b1d9e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17674,6 +17674,7 @@ M:	Jose Abreu <Jose.Abreu@synopsys.com>
 L:	netdev@vger.kernel.org
 S:	Supported
 F:	drivers/net/pcs/pcs-xpcs.c
+F:	drivers/net/pcs/pcs-xpcs.h
 F:	include/linux/pcs/pcs-xpcs.h
 
 SYNOPSYS DESIGNWARE I2C DRIVER
diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index a2cbb2d926b7..8ca7592b02ec 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -11,102 +11,7 @@
 #include <linux/mdio.h>
 #include <linux/phylink.h>
 #include <linux/workqueue.h>
-
-#define SYNOPSYS_XPCS_ID		0x7996ced0
-#define SYNOPSYS_XPCS_MASK		0xffffffff
-
-/* Vendor regs access */
-#define DW_VENDOR			BIT(15)
-
-/* VR_XS_PCS */
-#define DW_USXGMII_RST			BIT(10)
-#define DW_USXGMII_EN			BIT(9)
-#define DW_VR_XS_PCS_DIG_STS		0x0010
-#define DW_RXFIFO_ERR			GENMASK(6, 5)
-
-/* SR_MII */
-#define DW_USXGMII_FULL			BIT(8)
-#define DW_USXGMII_SS_MASK		(BIT(13) | BIT(6) | BIT(5))
-#define DW_USXGMII_10000		(BIT(13) | BIT(6))
-#define DW_USXGMII_5000			(BIT(13) | BIT(5))
-#define DW_USXGMII_2500			(BIT(5))
-#define DW_USXGMII_1000			(BIT(6))
-#define DW_USXGMII_100			(BIT(13))
-#define DW_USXGMII_10			(0)
-
-/* SR_AN */
-#define DW_SR_AN_ADV1			0x10
-#define DW_SR_AN_ADV2			0x11
-#define DW_SR_AN_ADV3			0x12
-#define DW_SR_AN_LP_ABL1		0x13
-#define DW_SR_AN_LP_ABL2		0x14
-#define DW_SR_AN_LP_ABL3		0x15
-
-/* Clause 73 Defines */
-/* AN_LP_ABL1 */
-#define DW_C73_PAUSE			BIT(10)
-#define DW_C73_ASYM_PAUSE		BIT(11)
-#define DW_C73_AN_ADV_SF		0x1
-/* AN_LP_ABL2 */
-#define DW_C73_1000KX			BIT(5)
-#define DW_C73_10000KX4			BIT(6)
-#define DW_C73_10000KR			BIT(7)
-/* AN_LP_ABL3 */
-#define DW_C73_2500KX			BIT(0)
-#define DW_C73_5000KR			BIT(1)
-
-/* Clause 37 Defines */
-/* VR MII MMD registers offsets */
-#define DW_VR_MII_MMD_CTRL		0x0000
-#define DW_VR_MII_DIG_CTRL1		0x8000
-#define DW_VR_MII_AN_CTRL		0x8001
-#define DW_VR_MII_AN_INTR_STS		0x8002
-/* Enable 2.5G Mode */
-#define DW_VR_MII_DIG_CTRL1_2G5_EN	BIT(2)
-/* EEE Mode Control Register */
-#define DW_VR_MII_EEE_MCTRL0		0x8006
-#define DW_VR_MII_EEE_MCTRL1		0x800b
-
-/* VR_MII_DIG_CTRL1 */
-#define DW_VR_MII_DIG_CTRL1_MAC_AUTO_SW		BIT(9)
-
-/* VR_MII_AN_CTRL */
-#define DW_VR_MII_AN_CTRL_TX_CONFIG_SHIFT	3
-#define DW_VR_MII_TX_CONFIG_MASK		BIT(3)
-#define DW_VR_MII_TX_CONFIG_PHY_SIDE_SGMII	0x1
-#define DW_VR_MII_TX_CONFIG_MAC_SIDE_SGMII	0x0
-#define DW_VR_MII_AN_CTRL_PCS_MODE_SHIFT	1
-#define DW_VR_MII_PCS_MODE_MASK			GENMASK(2, 1)
-#define DW_VR_MII_PCS_MODE_C37_1000BASEX	0x0
-#define DW_VR_MII_PCS_MODE_C37_SGMII		0x2
-
-/* VR_MII_AN_INTR_STS */
-#define DW_VR_MII_AN_STS_C37_ANSGM_FD		BIT(1)
-#define DW_VR_MII_AN_STS_C37_ANSGM_SP_SHIFT	2
-#define DW_VR_MII_AN_STS_C37_ANSGM_SP		GENMASK(3, 2)
-#define DW_VR_MII_C37_ANSGM_SP_10		0x0
-#define DW_VR_MII_C37_ANSGM_SP_100		0x1
-#define DW_VR_MII_C37_ANSGM_SP_1000		0x2
-#define DW_VR_MII_C37_ANSGM_SP_LNKSTS		BIT(4)
-
-/* SR MII MMD Control defines */
-#define AN_CL37_EN		BIT(12)	/* Enable Clause 37 auto-nego */
-#define SGMII_SPEED_SS13	BIT(13)	/* SGMII speed along with SS6 */
-#define SGMII_SPEED_SS6		BIT(6)	/* SGMII speed along with SS13 */
-
-/* VR MII EEE Control 0 defines */
-#define DW_VR_MII_EEE_LTX_EN		BIT(0)  /* LPI Tx Enable */
-#define DW_VR_MII_EEE_LRX_EN		BIT(1)  /* LPI Rx Enable */
-#define DW_VR_MII_EEE_TX_QUIET_EN		BIT(2)  /* Tx Quiet Enable */
-#define DW_VR_MII_EEE_RX_QUIET_EN		BIT(3)  /* Rx Quiet Enable */
-#define DW_VR_MII_EEE_TX_EN_CTRL		BIT(4)  /* Tx Control Enable */
-#define DW_VR_MII_EEE_RX_EN_CTRL		BIT(7)  /* Rx Control Enable */
-
-#define DW_VR_MII_EEE_MULT_FACT_100NS_SHIFT	8
-#define DW_VR_MII_EEE_MULT_FACT_100NS		GENMASK(11, 8)
-
-/* VR MII EEE Control 1 defines */
-#define DW_VR_MII_EEE_TRN_LPI		BIT(0)	/* Transparent Mode Enable */
+#include "pcs-xpcs.h"
 
 #define phylink_pcs_to_xpcs(pl_pcs) \
 	container_of((pl_pcs), struct dw_xpcs, pcs)
diff --git a/drivers/net/pcs/pcs-xpcs.h b/drivers/net/pcs/pcs-xpcs.h
new file mode 100644
index 000000000000..867537a68c63
--- /dev/null
+++ b/drivers/net/pcs/pcs-xpcs.h
@@ -0,0 +1,103 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2020 Synopsys, Inc. and/or its affiliates.
+ * Synopsys DesignWare XPCS helpers
+ *
+ * Author: Jose Abreu <Jose.Abreu@synopsys.com>
+ */
+
+#define SYNOPSYS_XPCS_ID		0x7996ced0
+#define SYNOPSYS_XPCS_MASK		0xffffffff
+
+/* Vendor regs access */
+#define DW_VENDOR			BIT(15)
+
+/* VR_XS_PCS */
+#define DW_USXGMII_RST			BIT(10)
+#define DW_USXGMII_EN			BIT(9)
+#define DW_VR_XS_PCS_DIG_STS		0x0010
+#define DW_RXFIFO_ERR			GENMASK(6, 5)
+
+/* SR_MII */
+#define DW_USXGMII_FULL			BIT(8)
+#define DW_USXGMII_SS_MASK		(BIT(13) | BIT(6) | BIT(5))
+#define DW_USXGMII_10000		(BIT(13) | BIT(6))
+#define DW_USXGMII_5000			(BIT(13) | BIT(5))
+#define DW_USXGMII_2500			(BIT(5))
+#define DW_USXGMII_1000			(BIT(6))
+#define DW_USXGMII_100			(BIT(13))
+#define DW_USXGMII_10			(0)
+
+/* SR_AN */
+#define DW_SR_AN_ADV1			0x10
+#define DW_SR_AN_ADV2			0x11
+#define DW_SR_AN_ADV3			0x12
+#define DW_SR_AN_LP_ABL1		0x13
+#define DW_SR_AN_LP_ABL2		0x14
+#define DW_SR_AN_LP_ABL3		0x15
+
+/* Clause 73 Defines */
+/* AN_LP_ABL1 */
+#define DW_C73_PAUSE			BIT(10)
+#define DW_C73_ASYM_PAUSE		BIT(11)
+#define DW_C73_AN_ADV_SF		0x1
+/* AN_LP_ABL2 */
+#define DW_C73_1000KX			BIT(5)
+#define DW_C73_10000KX4			BIT(6)
+#define DW_C73_10000KR			BIT(7)
+/* AN_LP_ABL3 */
+#define DW_C73_2500KX			BIT(0)
+#define DW_C73_5000KR			BIT(1)
+
+/* Clause 37 Defines */
+/* VR MII MMD registers offsets */
+#define DW_VR_MII_MMD_CTRL		0x0000
+#define DW_VR_MII_DIG_CTRL1		0x8000
+#define DW_VR_MII_AN_CTRL		0x8001
+#define DW_VR_MII_AN_INTR_STS		0x8002
+/* Enable 2.5G Mode */
+#define DW_VR_MII_DIG_CTRL1_2G5_EN	BIT(2)
+/* EEE Mode Control Register */
+#define DW_VR_MII_EEE_MCTRL0		0x8006
+#define DW_VR_MII_EEE_MCTRL1		0x800b
+
+/* VR_MII_DIG_CTRL1 */
+#define DW_VR_MII_DIG_CTRL1_MAC_AUTO_SW		BIT(9)
+
+/* VR_MII_AN_CTRL */
+#define DW_VR_MII_AN_CTRL_TX_CONFIG_SHIFT	3
+#define DW_VR_MII_TX_CONFIG_MASK		BIT(3)
+#define DW_VR_MII_TX_CONFIG_PHY_SIDE_SGMII	0x1
+#define DW_VR_MII_TX_CONFIG_MAC_SIDE_SGMII	0x0
+#define DW_VR_MII_AN_CTRL_PCS_MODE_SHIFT	1
+#define DW_VR_MII_PCS_MODE_MASK			GENMASK(2, 1)
+#define DW_VR_MII_PCS_MODE_C37_1000BASEX	0x0
+#define DW_VR_MII_PCS_MODE_C37_SGMII		0x2
+
+/* VR_MII_AN_INTR_STS */
+#define DW_VR_MII_AN_STS_C37_ANSGM_FD		BIT(1)
+#define DW_VR_MII_AN_STS_C37_ANSGM_SP_SHIFT	2
+#define DW_VR_MII_AN_STS_C37_ANSGM_SP		GENMASK(3, 2)
+#define DW_VR_MII_C37_ANSGM_SP_10		0x0
+#define DW_VR_MII_C37_ANSGM_SP_100		0x1
+#define DW_VR_MII_C37_ANSGM_SP_1000		0x2
+#define DW_VR_MII_C37_ANSGM_SP_LNKSTS		BIT(4)
+
+/* SR MII MMD Control defines */
+#define AN_CL37_EN			BIT(12)	/* Enable Clause 37 auto-nego */
+#define SGMII_SPEED_SS13		BIT(13)	/* SGMII speed along with SS6 */
+#define SGMII_SPEED_SS6			BIT(6)	/* SGMII speed along with SS13 */
+
+/* VR MII EEE Control 0 defines */
+#define DW_VR_MII_EEE_LTX_EN			BIT(0)  /* LPI Tx Enable */
+#define DW_VR_MII_EEE_LRX_EN			BIT(1)  /* LPI Rx Enable */
+#define DW_VR_MII_EEE_TX_QUIET_EN		BIT(2)  /* Tx Quiet Enable */
+#define DW_VR_MII_EEE_RX_QUIET_EN		BIT(3)  /* Rx Quiet Enable */
+#define DW_VR_MII_EEE_TX_EN_CTRL		BIT(4)  /* Tx Control Enable */
+#define DW_VR_MII_EEE_RX_EN_CTRL		BIT(7)  /* Rx Control Enable */
+
+#define DW_VR_MII_EEE_MULT_FACT_100NS_SHIFT	8
+#define DW_VR_MII_EEE_MULT_FACT_100NS		GENMASK(11, 8)
+
+/* VR MII EEE Control 1 defines */
+#define DW_VR_MII_EEE_TRN_LPI		BIT(0)	/* Transparent Mode Enable */
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

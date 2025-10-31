Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C8973C2654E
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Oct 2025 18:27:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9917BC62ECB;
	Fri, 31 Oct 2025 17:27:18 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 71EFFC62EC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Oct 2025 17:27:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4F7BB44248;
 Fri, 31 Oct 2025 17:27:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2BF65C116C6;
 Fri, 31 Oct 2025 17:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761931636;
 bh=5A/kLq8po/AIfsNGO6cLTZ+fIVCQT5AElgJFBCeehsg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=Vyi6NX87iJN6ZbeYYAXbf63YVcp/ADMBFRvE1zXks28mK87vEUU6cQd/3z/uLcIHG
 aJbbmy+g7ZLdH0W7wm6sJgIEbMjNm0m1ZtC0KgxNjvylyPcC3rlZOza6J7Ay7uWH7l
 UwFV9D8XGq61zQ5vK55swVToo0gUX0ICWhykzmT4DBYnmnmlCVjSE97/EQl5KakL3U
 VAnwV/j4s5KgbTVAukt09NwqSpb4STcRGbTXtPm2B2mv/3gLOaqqjvm6PAsQcdXJui
 UsYz0Qw+KgDKyh8FFJCkXhoRAMAyz4uJg1Ss7zUERlImmPy/MMw/MGmyAtD3tLBshF
 kPpp6Alu9hn0A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 22808CCFA03;
 Fri, 31 Oct 2025 17:27:16 +0000 (UTC)
From: Rohan G Thomas via B4 Relay
 <devnull+rohan.g.thomas.altera.com@kernel.org>
Date: Sat, 01 Nov 2025 01:27:10 +0800
MIME-Version: 1.0
Message-Id: <20251101-agilex5_ext-v2-4-a6b51b4dca4d@altera.com>
References: <20251101-agilex5_ext-v2-0-a6b51b4dca4d@altera.com>
In-Reply-To: <20251101-agilex5_ext-v2-0-a6b51b4dca4d@altera.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761931634; l=7078;
 i=rohan.g.thomas@altera.com; s=20250815; h=from:subject:message-id;
 bh=9EkvKknTEFMhFgiG4guzPV0b/EvK3DNx3dlBmCIhiac=;
 b=uOn4rWvTDMcdAQ1HyyZkaYCxtJBnVLAs8rfsa590bz7r8rgMCrSuY56YVXV7Ee82E4rG1yhuk
 3ix7Ne28jO4Do5xeB7MLMu5HdpyewAFibr4FJBycKZ5nKY1qKwg/Dji
X-Developer-Key: i=rohan.g.thomas@altera.com; a=ed25519;
 pk=5yZXkXswhfUILKAQwoIn7m6uSblwgV5oppxqde4g4TY=
X-Endpoint-Received: by B4 Relay for rohan.g.thomas@altera.com/20250815
 with auth_id=494
X-Original-From: Rohan G Thomas <rohan.g.thomas@altera.com>
Cc: netdev@vger.kernel.org, Rohan G Thomas <rohan.g.thomas@altera.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next v2 4/4] net: stmmac: socfpga: Add
 hardware supported cross-timestamp
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
Reply-To: rohan.g.thomas@altera.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: Rohan G Thomas <rohan.g.thomas@altera.com>

Cross timestamping is supported on Agilex5 platform with Synchronized
Multidrop Timestamp Gathering(SMTG) IP. The hardware cross-timestamp
result is made available the applications through the ioctl call
PTP_SYS_OFFSET_PRECISE, which inturn calls stmmac_getcrosststamp().

Device time is stored in the MAC Auxiliary register. The 64-bit System
time (ARM_ARCH_COUNTER) is stored in SMTG IP. SMTG IP is an MDIO device
with 0xC - 0xF MDIO register space holds 64-bit system time.

This commit is similar to following commit for Intel platforms:
Commit 341f67e424e5 ("net: stmmac: Add hardware supported cross-timestamp")

Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-socfpga.c    | 120 +++++++++++++++++++++
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h     |   5 +
 2 files changed, 125 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index 1837346ca2d438018ae161a233f415fe0181c78d..49d651948e2bd41faeecaebb37121aef757a66a7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/mfd/altera-sysmgr.h>
+#include <linux/clocksource_ids.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_net.h>
@@ -15,8 +16,10 @@
 #include <linux/reset.h>
 #include <linux/stmmac.h>
 
+#include "dwxgmac2.h"
 #include "stmmac.h"
 #include "stmmac_platform.h"
+#include "stmmac_ptp.h"
 
 #define SYSMGR_EMACGRP_CTRL_PHYSEL_ENUM_GMII_MII 0x0
 #define SYSMGR_EMACGRP_CTRL_PHYSEL_ENUM_RGMII 0x1
@@ -41,6 +44,13 @@
 #define SGMII_ADAPTER_ENABLE		0x0000
 #define SGMII_ADAPTER_DISABLE		0x0001
 
+#define SMTG_MDIO_ADDR		0x15
+#define SMTG_TSC_WORD0		0xC
+#define SMTG_TSC_WORD1		0xD
+#define SMTG_TSC_WORD2		0xE
+#define SMTG_TSC_WORD3		0xF
+#define SMTG_TSC_SHIFT		16
+
 struct socfpga_dwmac;
 struct socfpga_dwmac_ops {
 	int (*set_phy_mode)(struct socfpga_dwmac *dwmac_priv);
@@ -269,6 +279,112 @@ static int socfpga_set_phy_mode_common(int phymode, u32 *val)
 	return 0;
 }
 
+static void get_smtgtime(struct mii_bus *mii, int smtg_addr, u64 *smtg_time)
+{
+	u64 ns;
+
+	ns = mdiobus_read(mii, smtg_addr, SMTG_TSC_WORD3);
+	ns <<= SMTG_TSC_SHIFT;
+	ns |= mdiobus_read(mii, smtg_addr, SMTG_TSC_WORD2);
+	ns <<= SMTG_TSC_SHIFT;
+	ns |= mdiobus_read(mii, smtg_addr, SMTG_TSC_WORD1);
+	ns <<= SMTG_TSC_SHIFT;
+	ns |= mdiobus_read(mii, smtg_addr, SMTG_TSC_WORD0);
+
+	*smtg_time = ns;
+}
+
+static int smtg_crosststamp(ktime_t *device, struct system_counterval_t *system,
+			    void *ctx)
+{
+	struct stmmac_priv *priv = (struct stmmac_priv *)ctx;
+	u32 num_snapshot, gpio_value, acr_value;
+	void __iomem *ptpaddr = priv->ptpaddr;
+	void __iomem *ioaddr = priv->hw->pcsr;
+	unsigned long flags;
+	u64 smtg_time = 0;
+	u64 ptp_time = 0;
+	int i, ret;
+	u32 v;
+
+	/* Both internal crosstimestamping and external triggered event
+	 * timestamping cannot be run concurrently.
+	 */
+	if (priv->plat->flags & STMMAC_FLAG_EXT_SNAPSHOT_EN)
+		return -EBUSY;
+
+	mutex_lock(&priv->aux_ts_lock);
+	/* Enable Internal snapshot trigger */
+	acr_value = readl(ptpaddr + PTP_ACR);
+	acr_value &= ~PTP_ACR_MASK;
+	switch (priv->plat->int_snapshot_num) {
+	case AUX_SNAPSHOT0:
+		acr_value |= PTP_ACR_ATSEN0;
+		break;
+	case AUX_SNAPSHOT1:
+		acr_value |= PTP_ACR_ATSEN1;
+		break;
+	case AUX_SNAPSHOT2:
+		acr_value |= PTP_ACR_ATSEN2;
+		break;
+	case AUX_SNAPSHOT3:
+		acr_value |= PTP_ACR_ATSEN3;
+		break;
+	default:
+		mutex_unlock(&priv->aux_ts_lock);
+		return -EINVAL;
+	}
+	writel(acr_value, ptpaddr + PTP_ACR);
+
+	/* Clear FIFO */
+	acr_value = readl(ptpaddr + PTP_ACR);
+	acr_value |= PTP_ACR_ATSFC;
+	writel(acr_value, ptpaddr + PTP_ACR);
+	/* Release the mutex */
+	mutex_unlock(&priv->aux_ts_lock);
+
+	/* Trigger Internal snapshot signal. Create a rising edge by just toggle
+	 * the GPO0 to low and back to high.
+	 */
+	gpio_value = readl(ioaddr + XGMAC_GPIO_STATUS);
+	gpio_value &= ~XGMAC_GPIO_GPO0;
+	writel(gpio_value, ioaddr + XGMAC_GPIO_STATUS);
+	gpio_value |= XGMAC_GPIO_GPO0;
+	writel(gpio_value, ioaddr + XGMAC_GPIO_STATUS);
+
+	/* Poll for time sync operation done */
+	ret = readl_poll_timeout(priv->ioaddr + XGMAC_INT_STATUS, v,
+				 (v & XGMAC_INT_TSIS), 100, 10000);
+	if (ret) {
+		netdev_err(priv->dev, "%s: Wait for time sync operation timeout\n",
+			   __func__);
+		return ret;
+	}
+
+	*system = (struct system_counterval_t) {
+		.cycles = 0,
+		.cs_id = CSID_ARM_ARCH_COUNTER,
+		.use_nsecs = false,
+	};
+
+	num_snapshot = (readl(ioaddr + XGMAC_TIMESTAMP_STATUS) &
+			XGMAC_TIMESTAMP_ATSNS_MASK) >>
+			XGMAC_TIMESTAMP_ATSNS_SHIFT;
+
+	/* Repeat until the timestamps are from the FIFO last segment */
+	for (i = 0; i < num_snapshot; i++) {
+		read_lock_irqsave(&priv->ptp_lock, flags);
+		stmmac_get_ptptime(priv, ptpaddr, &ptp_time);
+		*device = ns_to_ktime(ptp_time);
+		read_unlock_irqrestore(&priv->ptp_lock, flags);
+	}
+
+	get_smtgtime(priv->mii, SMTG_MDIO_ADDR, &smtg_time);
+	system->cycles = smtg_time;
+
+	return 0;
+}
+
 static int socfpga_gen5_set_phy_mode(struct socfpga_dwmac *dwmac)
 {
 	struct regmap *sys_mgr_base_addr = dwmac->sys_mgr_base_addr;
@@ -473,6 +589,10 @@ static void socfpga_agilex5_setup_plat_dat(struct socfpga_dwmac *dwmac)
 		/* Tx Queues 0 - 5 doesn't support TBS on Agilex5 */
 		break;
 	}
+
+	/* Hw supported cross-timestamp */
+	plat_dat->int_snapshot_num = AUX_SNAPSHOT0;
+	plat_dat->crosststamp = smtg_crosststamp;
 }
 
 static int socfpga_dwmac_probe(struct platform_device *pdev)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index 0d408ee17f337851502cbcba8e82d2b839b9db02..e48cfa05000c07ed9194de786efa530a61a9dbfa 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -79,6 +79,7 @@
 #define XGMAC_PSRQ(x)			GENMASK((x) * 8 + 7, (x) * 8)
 #define XGMAC_PSRQ_SHIFT(x)		((x) * 8)
 #define XGMAC_INT_STATUS		0x000000b0
+#define XGMAC_INT_TSIS			BIT(12)
 #define XGMAC_LPIIS			BIT(5)
 #define XGMAC_PMTIS			BIT(4)
 #define XGMAC_INT_EN			0x000000b4
@@ -173,6 +174,8 @@
 #define XGMAC_MDIO_ADDR			0x00000200
 #define XGMAC_MDIO_DATA			0x00000204
 #define XGMAC_MDIO_C22P			0x00000220
+#define XGMAC_GPIO_STATUS		0x0000027c
+#define XGMAC_GPIO_GPO0			BIT(16)
 #define XGMAC_ADDRx_HIGH(x)		(0x00000300 + (x) * 0x8)
 #define XGMAC_ADDR_MAX			32
 #define XGMAC_AE			BIT(31)
@@ -220,6 +223,8 @@
 #define XGMAC_OB			BIT(0)
 #define XGMAC_RSS_DATA			0x00000c8c
 #define XGMAC_TIMESTAMP_STATUS		0x00000d20
+#define XGMAC_TIMESTAMP_ATSNS_MASK	GENMASK(29, 25)
+#define XGMAC_TIMESTAMP_ATSNS_SHIFT	25
 #define XGMAC_TXTSC			BIT(15)
 #define XGMAC_TXTIMESTAMP_NSEC		0x00000d30
 #define XGMAC_TXTSSTSLO			GENMASK(30, 0)

-- 
2.43.7


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

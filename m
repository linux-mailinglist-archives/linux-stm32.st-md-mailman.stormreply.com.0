Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EB59E0E5A
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Dec 2024 23:03:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 305F0C7801F;
	Mon,  2 Dec 2024 22:03:53 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8ABEAC7129D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Dec 2024 22:03:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D225CA41308;
 Mon,  2 Dec 2024 22:01:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6C781C4CEDF;
 Mon,  2 Dec 2024 22:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733177024;
 bh=prEv+e0GG/OD65Qb7TwYdsqNMCpYICnodlwVYKCW350=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=HAA55EDgQdQSAII8K3ryO/QZyuQQvAwtRad8/HB+5yIJvVYIcV/b/Et3Xz3A/6Kr+
 N817RqqHKX5PUFCH1WxC0JJVtZgoDcIl6vaWD6Q3DZBfJawzFFqXiTyGQjGhvUZCAY
 TxLNKbMiW+WTfcRAPCboFnAG+6YCnjS/5NeC4EpOvf0B/Bkr+OF2X3Nkv7pJVUgZt0
 xctDWUWvSi3FlqeIw4B1LjWRKggjQJvZ/kD5Vf2nYFFc/ZQmSPRFQwlGAjYb8+lyL5
 pkCc0aCIBwywUvaw/qnTxb4v/nmPB8DBC5IGK5oVLUlcHNJ8McsrB2DGh+0Wa1K9Ef
 4l57w1rYxt+iA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 5B736E69E99;
 Mon,  2 Dec 2024 22:03:44 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Mon, 02 Dec 2024 23:03:42 +0100
MIME-Version: 1.0
Message-Id: <20241202-upstream_s32cc_gmac-v7-3-bc3e1f9f656e@oss.nxp.com>
References: <20241202-upstream_s32cc_gmac-v7-0-bc3e1f9f656e@oss.nxp.com>
In-Reply-To: <20241202-upstream_s32cc_gmac-v7-0-bc3e1f9f656e@oss.nxp.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Minda Chen <minda.chen@starfivetech.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Iyappan Subramanian <iyappan@os.amperecomputing.com>, 
 Keyur Chudgar <keyur@os.amperecomputing.com>, 
 Quan Nguyen <quan@os.amperecomputing.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733177021; l=4080;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=MBmDp2CoF+dbqWlxm3bedxlXiboLWf0OxlOUmswN3oE=;
 b=xPM1kLA0a7C8k9sWfaaNwGXl0nk36OKozjLEGl9VosrsGgYuzn63q8UcGOZXdeKdIW06DGLK8
 pvpyJRKVtBZA5TocIFHZ1gTJu89+wLjEjuTwL5NcO6f+U01B0kv65nK
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
Cc: imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 "Jan Petrous \(OSS\)" <jan.petrous@oss.nxp.com>, linux-kernel@vger.kernel.org,
 fancer.lancer@gmail.com, 0x1207@gmail.com,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v7 03/15] net: stmmac: Fix clock rate
 variables size
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
Reply-To: jan.petrous@oss.nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>

The clock API clk_get_rate() returns unsigned long value.
Expand affected members of stmmac platform data and
convert the stmmac_clk_csr_set() and dwmac4_core_init() methods
to defining the unsigned long clk_rate local variables.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c       | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c       | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c   | 2 +-
 include/linux/stmmac.h                                  | 6 +++---
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 901a3c1959fa..2a5b38723635 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -777,7 +777,7 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 		netdev_err(priv->dev, "Failed to max out clk_ptp_ref: %d\n", err);
 	plat_dat->clk_ptp_rate = clk_get_rate(plat_dat->clk_ptp_ref);
 
-	netdev_dbg(priv->dev, "PTP rate %d\n", plat_dat->clk_ptp_rate);
+	netdev_dbg(priv->dev, "PTP rate %lu\n", plat_dat->clk_ptp_rate);
 }
 
 static int qcom_ethqos_probe(struct platform_device *pdev)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index c25781874aa7..c36f90a782c5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -27,7 +27,7 @@ static void dwmac4_core_init(struct mac_device_info *hw,
 	struct stmmac_priv *priv = netdev_priv(dev);
 	void __iomem *ioaddr = hw->pcsr;
 	u32 value = readl(ioaddr + GMAC_CONFIG);
-	u32 clk_rate;
+	unsigned long clk_rate;
 
 	value |= GMAC_CORE_INIT;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 3cb7ad6ccc4e..d45fd7a3acd5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -301,7 +301,7 @@ static void stmmac_global_err(struct stmmac_priv *priv)
  */
 static void stmmac_clk_csr_set(struct stmmac_priv *priv)
 {
-	u32 clk_rate;
+	unsigned long clk_rate;
 
 	clk_rate = clk_get_rate(priv->plat->stmmac_clk);
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 3ac32444e492..06e07e6e180b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -640,7 +640,7 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 		dev_info(&pdev->dev, "PTP uses main clock\n");
 	} else {
 		plat->clk_ptp_rate = clk_get_rate(plat->clk_ptp_ref);
-		dev_dbg(&pdev->dev, "PTP rate %d\n", plat->clk_ptp_rate);
+		dev_dbg(&pdev->dev, "PTP rate %lu\n", plat->clk_ptp_rate);
 	}
 
 	plat->stmmac_rst = devm_reset_control_get_optional(&pdev->dev,
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 865d0fe26f98..c9878a612e53 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -252,8 +252,8 @@ struct plat_stmmacenet_data {
 	struct clk *stmmac_clk;
 	struct clk *pclk;
 	struct clk *clk_ptp_ref;
-	unsigned int clk_ptp_rate;
-	unsigned int clk_ref_rate;
+	unsigned long clk_ptp_rate;
+	unsigned long clk_ref_rate;
 	unsigned int mult_fact_100ns;
 	s32 ptp_max_adj;
 	u32 cdc_error_adj;
@@ -265,7 +265,7 @@ struct plat_stmmacenet_data {
 	int mac_port_sel_speed;
 	int has_xgmac;
 	u8 vlan_fail_q;
-	unsigned int eee_usecs_rate;
+	unsigned long eee_usecs_rate;
 	struct pci_dev *pdev;
 	int int_snapshot_num;
 	int msi_mac_vec;

-- 
2.47.0


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

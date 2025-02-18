Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B81A39A39
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Feb 2025 12:15:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D527C78F87;
	Tue, 18 Feb 2025 11:15:21 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B3A75C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Feb 2025 11:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vPlXwS6bwi6w+vRP933M/T7ahD6ipBLPikuDfzRoElc=; b=loBZYLCa3ATIB0J1Ay8OXdA17/
 WaJYIGRaBTqollSN3EF4/yXLmehmdH6Qi5hb33Ld+VBR4vR6SKCWXzRt0iYmVNPTkjP6JttMd6QNZ
 lFN27VCT447LNURYA55fh+DldXF0fuGjaxoL8aqb9v2b5VpG/2AQ80X3/txdwVekXcRX2VXx5dQce
 3IEqDdzR5NmmOKWZoZ/67sqQs8UNfbmNOPmqyQo8DG6jHaOHHm+Et4Wt7AsaH43xrT4Xh+xSjOjwB
 oJq31c97Kx/wYHq2Z521ciWlX8M5yNuLhhByGrfUTI/SDqy/FtwylNmMANaOuD4z5tMZ3sWWnk864
 IU2RJivw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42738 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tkLZB-0001i3-2u;
 Tue, 18 Feb 2025 11:15:06 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tkLYq-004RZ1-Kw; Tue, 18 Feb 2025 11:14:44 +0000
In-Reply-To: <Z7RrnyER5ewy0f3T@shell.armlinux.org.uk>
References: <Z7RrnyER5ewy0f3T@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tkLYq-004RZ1-Kw@rmk-PC.armlinux.org.uk>
Date: Tue, 18 Feb 2025 11:14:44 +0000
Cc: imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jon Hunter <jonathanh@nvidia.com>, Jakub Kicinski <kuba@kernel.org>,
 Thierry Reding <treding@nvidia.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Jan Petrous <jan.petrous@oss.nxp.com>,
 Minda Chen <minda.chen@starfivetech.com>, linux-arm-kernel@lists.infradead.org,
 Paolo Abeni <pabeni@redhat.com>, Inochi Amaoto <inochiama@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, netdev@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH RFC net-next 2/7] net: stmmac: provide generic
 implementation for set_clk_tx_rate method
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

Provide a generic implementation for the set_clk_tx_rate method
introduced by the previous patch, which is capable of configuring the
MAC transmit clock for 10M, 100M and 1000M speeds for at least MII,
GMII, RGMII and RMII interface modes.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  2 ++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 32 +++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 3395188c198a..0934b30e6c72 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -406,6 +406,8 @@ int stmmac_dvr_probe(struct device *device,
 int stmmac_reinit_queues(struct net_device *dev, u32 rx_cnt, u32 tx_cnt);
 int stmmac_reinit_ringparam(struct net_device *dev, u32 rx_size, u32 tx_size);
 int stmmac_bus_clks_config(struct stmmac_priv *priv, bool enabled);
+int stmmac_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
+			 phy_interface_t interface, int speed);
 
 static inline bool stmmac_xdp_is_enabled(struct stmmac_priv *priv)
 {
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index f7ff94a09da2..43ff26166e74 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -177,6 +177,38 @@ int stmmac_bus_clks_config(struct stmmac_priv *priv, bool enabled)
 }
 EXPORT_SYMBOL_GPL(stmmac_bus_clks_config);
 
+/**
+ * stmmac_set_clk_tx_rate() - set the clock rate for the MAC transmit clock
+ * @bsp_priv: BSP private data structure (unused)
+ * @clk_tx_i: the transmit clock
+ * @interface: the selected interface mode
+ * @speed: the speed that the MAC will be operating at
+ *
+ * Set the transmit clock rate for the MAC, normally 2.5MHz for 10Mbps,
+ * 25MHz for 100Mbps and 125MHz for 1Gbps. This is suitable for at least
+ * MII, GMII, RGMII and RMII interface modes. Platforms can hook this into
+ * the plat_data->set_clk_tx_rate method directly, call it via their own
+ * implementation, or implement their own method should they have more
+ * complex requirements. It is intended to only be used in this method.
+ *
+ * plat_data->clk_tx_i must be filled in.
+ */
+int stmmac_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
+			    phy_interface_t interface, int speed)
+{
+	long rate = rgmii_clock(speed);
+
+	/* Silently ignore unsupported speeds as rgmii_clock() only
+	 * supports 10, 100 and 1000Mbps. We do not want to spit
+	 * errors for 2500 and higher speeds here.
+	 */
+	if (rate < 0)
+		return 0;
+
+	return clk_set_rate(clk_tx_i, rate);
+}
+EXPORT_SYMBOL_GPL(stmmac_set_clk_tx_rate);
+
 /**
  * stmmac_verify_args - verify the driver parameters.
  * Description: it checks the driver parameters and set a default in case of
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

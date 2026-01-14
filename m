Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F2ED20994
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jan 2026 18:45:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8F55C8F273;
	Wed, 14 Jan 2026 17:45:30 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D8ADC8F261
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jan 2026 17:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Cuem9DrHcMzx7kurQPxyVrqAdGnuyKkldgZxfhbywFA=; b=jIfM7MBbqkbwdaJ9Q0Ujkol4bK
 mPN3n0wuEyKO0GklZvghYfD9ct6CWN04ZWa2rBt45CgjViCmNr+PcOhDZbM5ziTTx6+AAk59diUGE
 4h4AQ5MswpsAn9dEOCgDgSHlsvasnPMX/bWxXJI0z9GyhWchm9cXfsVww6dU6Y5aLq8/j5kFUMiHB
 Rg+XXVLxTezgv/o4ONXo3j7oHtrtPE8O91ycZIzumNI3FDIYFtcZtn4L6I9zlj6Rv3YvWgbTaCPkk
 9upu7e9r2PnB1hNuP7GDvKjEdInhmoU9obBKpOszazfX0KscqFbFr0RSP7DCiA/c6zEW+DUvQ+nBM
 4SQOHn3w==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42016 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vg4vo-000000000TD-0WvH;
 Wed, 14 Jan 2026 17:45:20 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vg4vn-00000003SFn-0kBD; Wed, 14 Jan 2026 17:45:19 +0000
In-Reply-To: <aWfWDsCoBc3YRKKo@shell.armlinux.org.uk>
References: <aWfWDsCoBc3YRKKo@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vg4vn-00000003SFn-0kBD@rmk-PC.armlinux.org.uk>
Date: Wed, 14 Jan 2026 17:45:19 +0000
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-phy@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 02/14] net: stmmac: qcom-ethqos:
 convert to set_clk_tx_rate() method
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

Set the RGMII link clock using the set_clk_tx_rate() method rather than
coding it into the .fix_mac_speed() method. This simplifies ethqos's
ethqos_fix_mac_speed().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 21 ++++++++++---------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 869f924f3cde..80ea69fc8ee5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -102,7 +102,6 @@ struct qcom_ethqos {
 	void __iomem *rgmii_base;
 	int (*configure_func)(struct qcom_ethqos *ethqos, int speed);
 
-	unsigned int link_clk_rate;
 	struct clk *link_clk;
 	struct phy *serdes_phy;
 	int serdes_speed;
@@ -174,19 +173,20 @@ static void rgmii_dump(void *priv)
 		rgmii_readl(ethqos, EMAC_SYSTEM_LOW_POWER_DEBUG));
 }
 
-static void
-ethqos_update_link_clk(struct qcom_ethqos *ethqos, int speed)
+static int ethqos_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
+				  phy_interface_t interface, int speed)
 {
+	struct qcom_ethqos *ethqos = bsp_priv;
 	long rate;
 
-	if (!phy_interface_mode_is_rgmii(ethqos->phy_mode))
-		return;
+	if (!phy_interface_mode_is_rgmii(interface))
+		return 0;
 
 	rate = rgmii_clock(speed);
-	if (rate > 0)
-		ethqos->link_clk_rate = rate * 2;
+	if (rate < 0)
+		return rate;
 
-	clk_set_rate(ethqos->link_clk, ethqos->link_clk_rate);
+	return clk_set_rate(ethqos->link_clk, rate * 2);
 }
 
 static void
@@ -645,7 +645,6 @@ static void ethqos_fix_mac_speed(void *priv, int speed, unsigned int mode)
 	struct qcom_ethqos *ethqos = priv;
 
 	qcom_ethqos_set_sgmii_loopback(ethqos, false);
-	ethqos_update_link_clk(ethqos, speed);
 	ethqos_configure(ethqos, speed);
 }
 
@@ -797,10 +796,12 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 				     "Failed to get serdes phy\n");
 
 	ethqos->serdes_speed = SPEED_1000;
-	ethqos_update_link_clk(ethqos, SPEED_1000);
+	ethqos_set_clk_tx_rate(ethqos, NULL, plat_dat->phy_interface,
+			       SPEED_1000);
 	ethqos_set_func_clk_en(ethqos);
 
 	plat_dat->bsp_priv = ethqos;
+	plat_dat->set_clk_tx_rate = ethqos_set_clk_tx_rate;
 	plat_dat->fix_mac_speed = ethqos_fix_mac_speed;
 	plat_dat->dump_debug_regs = rgmii_dump;
 	plat_dat->ptp_clk_freq_config = ethqos_ptp_clk_freq_config;
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1467849A0
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Aug 2023 20:50:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CAE02C6B44C;
	Tue, 22 Aug 2023 18:50:42 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6F952C6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Aug 2023 18:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hVOCuc5IYYSeGY5UU7ESNANeOTu+gCFR0FT1EEk+RqY=; b=OsfL23fKVLXUJo+ZsF5lvgJKSO
 pBZhMDBfgFyIjIqVsv4peZBbORaaZUKKqcfdndD9tAkMtg5GRKeL2PGHOE8Nqo/VIh8wnVahTd+w8
 IvUqgsL/KqUpCuQyZBCky+FFhlcYgCLcIlYtj5kBVbLF21cVGcn7Ls0+j+4Mu19ZWMg0v9T+kRIzb
 tGoQrTatHpz9ddVDi5q7TyrvNmZ1Y25oqPg5gCrle3G6zlar1x6sZFvTx8Xm+vnKJBcN0j9e+tG+C
 I9Qa5WZZrEKseIJF1H5mxGnF2oRQmYoITm3q2vNhjNbbJRMAhDeyzYUksbSqfyPfOISzrl9POh3Kh
 VGYoZOPA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:46866 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1qYWSY-0001si-0d;
 Tue, 22 Aug 2023 19:50:34 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1qYWSY-005fY9-Gm; Tue, 22 Aug 2023 19:50:34 +0100
In-Reply-To: <ZOUDRkBXzY884SJ1@shell.armlinux.org.uk>
References: <ZOUDRkBXzY884SJ1@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1qYWSY-005fY9-Gm@rmk-PC.armlinux.org.uk>
Date: Tue, 22 Aug 2023 19:50:34 +0100
Cc: Andrew Lunn <andrew@lunn.ch>, Feiyang Chen <chenfeiyang@loongson.cn>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: [Linux-stm32] [PATCH net-next 7/9] net: stmmac: move gmac4 specific
 phylink capabilities to gmac4
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

Move the setup of gmac4 speicifc phylink capabilities into gmac4 code.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c | 8 ++++++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 +---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index 03b1c5a97826..c6ff1fa0e04d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -68,6 +68,11 @@ static void dwmac4_core_init(struct mac_device_info *hw,
 		init_waitqueue_head(&priv->tstamp_busy_wait);
 }
 
+static void dwmac4_phylink_get_caps(struct stmmac_priv *priv)
+{
+	priv->phylink_config.mac_capabilities |= MAC_2500FD;
+}
+
 static void dwmac4_rx_queue_enable(struct mac_device_info *hw,
 				   u8 mode, u32 queue)
 {
@@ -1131,6 +1136,7 @@ static int dwmac4_config_l4_filter(struct mac_device_info *hw, u32 filter_no,
 
 const struct stmmac_ops dwmac4_ops = {
 	.core_init = dwmac4_core_init,
+	.phylink_get_caps = dwmac4_phylink_get_caps,
 	.set_mac = stmmac_set_mac,
 	.rx_ipc = dwmac4_rx_ipc_enable,
 	.rx_queue_enable = dwmac4_rx_queue_enable,
@@ -1173,6 +1179,7 @@ const struct stmmac_ops dwmac4_ops = {
 
 const struct stmmac_ops dwmac410_ops = {
 	.core_init = dwmac4_core_init,
+	.phylink_get_caps = dwmac4_phylink_get_caps,
 	.set_mac = stmmac_dwmac4_set_mac,
 	.rx_ipc = dwmac4_rx_ipc_enable,
 	.rx_queue_enable = dwmac4_rx_queue_enable,
@@ -1221,6 +1228,7 @@ const struct stmmac_ops dwmac410_ops = {
 
 const struct stmmac_ops dwmac510_ops = {
 	.core_init = dwmac4_core_init,
+	.phylink_get_caps = dwmac4_phylink_get_caps,
 	.set_mac = stmmac_dwmac4_set_mac,
 	.rx_ipc = dwmac4_rx_ipc_enable,
 	.rx_queue_enable = dwmac4_rx_queue_enable,
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index a9cf6aecdddf..0b02845e7e9d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1227,9 +1227,7 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
 	/* Get the MAC specific capabilities */
 	stmmac_mac_phylink_get_caps(priv);
 
-	if (priv->plat->has_gmac4) {
-		priv->phylink_config.mac_capabilities |= MAC_2500FD;
-	} else if (priv->plat->has_xgmac) {
+	if (priv->plat->has_xgmac) {
 		priv->phylink_config.mac_capabilities |= MAC_2500FD;
 		priv->phylink_config.mac_capabilities |= MAC_5000FD;
 		priv->phylink_config.mac_capabilities |= MAC_10000FD;
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED642635A88
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Nov 2022 11:52:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 85FF5C6506F;
	Wed, 23 Nov 2022 10:52:02 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E8B2C5F1ED
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Nov 2022 10:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669200720; x=1700736720;
 h=from:to:cc:subject:date:message-id;
 bh=6iGjfHGImnQA/ryUfPU7pulSh2j0yD9AxLZ5NGkr2kQ=;
 b=hO8sKvoR4w0Zqd+XcIti8mpug1ugBqCSVs66W3Cc6tPpD8xzYYxZ2kQR
 xpPf6b/zNtKqE9u9v1dXeAYk/46T+jTSfP47+tw071LcQci9NCNZ7k9zU
 G+yANjqidTyUJYwO8/X9wKb3RQU4ReevfX5VZillaUJrpN9usaBQmCT5H
 Fk1mh2wXzJ2UNRmRzcM8v8qFRhRD0Lecf/6eaVkBXdlG+g/g+zwkz5otW
 DOyAuzxrExLbGtctY2wLLank9F4u2FGI433ooMvyui8HIk4bVekbeHWaU
 sbGbQmU9deQb2qW7QDdwGEv+A1JTdehDkbSxQBSduFXs78miWls+aC0My g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="400332540"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; d="scan'208";a="400332540"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2022 02:51:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="672837333"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; d="scan'208";a="672837333"
Received: from p12ill01gohweish.png.intel.com ([10.88.229.16])
 by orsmga008.jf.intel.com with ESMTP; 23 Nov 2022 02:51:53 -0800
From: "Goh, Wei Sheng" <wei.sheng.goh@intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Wed, 23 Nov 2022 18:51:10 +0800
Message-Id: <20221123105110.23617-1-wei.sheng.goh@intel.com>
X-Mailer: git-send-email 2.17.1
Cc: Voon Wei Feng <weifeng.voon@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Looi Hong Aun <hong.aun.looi@intel.com>,
 Goh Wei Sheng <wei.sheng.goh@intel.com>, Tan Tee Min <tee.min.tan@intel.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Ahmad Tarmizi Noor Azura <noor.azura.ahmad.tarmizi@intel.com>
Subject: [Linux-stm32] [PATCH net v4] net: stmmac: Set MAC's flow control
	register to reflect current settings
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Currently, pause frame register GMAC_RX_FLOW_CTRL_RFE is not updated
correctly when 'ethtool -A <IFACE> autoneg off rx off tx off' command
is issued. This fix ensures the flow control change is reflected directly
in the GMAC_RX_FLOW_CTRL_RFE register.

Fixes: 46f69ded988d ("net: stmmac: Use resolved link config in mac_link_up()")
Cc: <stable@vger.kernel.org> # 5.10.x
Signed-off-by: Goh, Wei Sheng <wei.sheng.goh@intel.com>
Signed-off-by: Noor Azura Ahmad Tarmizi <noor.azura.ahmad.tarmizi@intel.com>
---
V3 -> V4: Fix commit message and incorrect insertions(+) value
V2 -> V3: Removed value assign for 'flow' in else statement based on review comments
V1 -> V2: Removed needless condition based on review comments

 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c |  2 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 12 ++++++++++--
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index c25bfecb4a2d..369db308b1dd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -748,6 +748,8 @@ static void dwmac4_flow_ctrl(struct mac_device_info *hw, unsigned int duplex,
 	if (fc & FLOW_RX) {
 		pr_debug("\tReceive Flow-Control ON\n");
 		flow |= GMAC_RX_FLOW_CTRL_RFE;
+	} else {
+		pr_debug("\tReceive Flow-Control OFF\n");
 	}
 	writel(flow, ioaddr + GMAC_RX_FLOW_CTRL);
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 8273e6a175c8..ab7f48f32f5b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1061,8 +1061,16 @@ static void stmmac_mac_link_up(struct phylink_config *config,
 		ctrl |= priv->hw->link.duplex;
 
 	/* Flow Control operation */
-	if (tx_pause && rx_pause)
-		stmmac_mac_flow_ctrl(priv, duplex);
+	if (rx_pause && tx_pause)
+		priv->flow_ctrl = FLOW_AUTO;
+	else if (rx_pause && !tx_pause)
+		priv->flow_ctrl = FLOW_RX;
+	else if (!rx_pause && tx_pause)
+		priv->flow_ctrl = FLOW_TX;
+	else
+		priv->flow_ctrl = FLOW_OFF;
+
+	stmmac_mac_flow_ctrl(priv, duplex);
 
 	if (ctrl != old_ctrl)
 		writel(ctrl, priv->ioaddr + MAC_CTRL_REG);
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E04CA398B4
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Feb 2025 11:25:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 043D7C78F87;
	Tue, 18 Feb 2025 10:25:15 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A8DEC7128F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Feb 2025 10:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I4wncVCdpUIHsrrtox57fBEO9pBWU5bq8UDc/s2ney4=; b=WBqusEcR6NZxomOppQmLAEpv5K
 WZlvsfcwwwu56hIo93ZGFL9SvT+e/BW8SGr9kdCftwn+G1RO4g+8KfxyLAjOB3nA0rl7OoYEEk5hA
 CYegSDVVFr8cjooaVirWP6JltkfMKWbtrwEN1IwJ00yToCrPml0CFjFpqZOygt7LF4zmObaCa1PE+
 MAMAaMYOANiXYVpCaLKtb2+EbMWgewqwHzVIDBYP8H1NjOalBWoIDhgKceb/7p7Rbu9Ek77FjU56H
 ElNngQ7f6abzrcmtwaVMfsAcSOc06z6A3fDhl+X1gCZ4MdrJYZG7wjKyyzbD+YGcxRRJWVJV9uZS/
 y8fAO8vw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:37784 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tkKmX-0001V5-0Y;
 Tue, 18 Feb 2025 10:24:49 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tkKmD-004ObA-9K; Tue, 18 Feb 2025 10:24:29 +0000
In-Reply-To: <Z7Rf2daOaf778TOg@shell.armlinux.org.uk>
References: <Z7Rf2daOaf778TOg@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: netdev@vger.kernel.org
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tkKmD-004ObA-9K@rmk-PC.armlinux.org.uk>
Date: Tue, 18 Feb 2025 10:24:29 +0000
Cc: imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>,
 Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jerome Brunet <jbrunet@baylibre.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Drew Fustini <drew@pdp7.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-sunxi@lists.linux.dev,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Jan Petrous <jan.petrous@oss.nxp.com>,
 Minda Chen <minda.chen@starfivetech.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Fu Wei <wefu@redhat.com>
Subject: [Linux-stm32] [PATCH net-next 1/3] net: stmmac: clarify priv->pause
 and pause module parameter
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

priv->pause corresponds with "pause_time" in the 802.3 specification,
and is also called "pause_time" in the various MAC backends. For
consistency, use the same name in the core stmmac code.

Clarify the units of the "pause" module parameter which sets up this
struct member to indicate that it's in units of the pause_quanta
defined by 802.3, which is 512 bit times.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index f05cae103d83..c602ace572b2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -283,7 +283,7 @@ struct stmmac_priv {
 
 	int speed;
 	unsigned int flow_ctrl;
-	unsigned int pause;
+	unsigned int pause_time;
 	struct mii_bus *mii;
 
 	struct phylink_config phylink_config;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index fd8ca1524e43..c3a13bd8c9b3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -94,7 +94,7 @@ MODULE_PARM_DESC(flow_ctrl, "Flow control ability [on/off]");
 
 static int pause = PAUSE_TIME;
 module_param(pause, int, 0644);
-MODULE_PARM_DESC(pause, "Flow Control Pause Time");
+MODULE_PARM_DESC(pause, "Flow Control Pause Time (units of 512 bit times)");
 
 #define TC_DEFAULT 64
 static int tc = TC_DEFAULT;
@@ -865,7 +865,7 @@ static void stmmac_mac_flow_ctrl(struct stmmac_priv *priv, u32 duplex)
 	u32 tx_cnt = priv->plat->tx_queues_to_use;
 
 	stmmac_flow_ctrl(priv, priv->hw, duplex, priv->flow_ctrl,
-			priv->pause, tx_cnt);
+			 priv->pause_time, tx_cnt);
 }
 
 static unsigned long stmmac_mac_get_caps(struct phylink_config *config,
@@ -7404,7 +7404,7 @@ int stmmac_dvr_probe(struct device *device,
 		return -ENOMEM;
 
 	stmmac_set_ethtool_ops(ndev);
-	priv->pause = pause;
+	priv->pause_time = pause;
 	priv->plat = plat_dat;
 	priv->ioaddr = res->addr;
 	priv->dev->base_addr = (unsigned long)res->addr;
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

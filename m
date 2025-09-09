Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 36394B50327
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Sep 2025 18:48:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA806C3F93A;
	Tue,  9 Sep 2025 16:48:35 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 588B2C3FAC9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Sep 2025 16:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rz0hbAq7fEga5zRohMAv5O8tOvXUWgvThRUc5VepeC8=; b=fOGqQAiHccsvB7ENctq9tyL9Hy
 vGSFLvDRw+4U/XUQETE04K0cyRdoCpe8ELqAeyOth0cDv6pfiS9+aYDk1BVw2mqdapKuMTTUkbaEs
 8gR0XMZjLqCzNwxLiSnBbkAT0I6+uowSOJExq5lko/5u8TKQIqqjQed0GLyx/PFYAqDk9kWbIclBn
 s5MR6orvBn8GuW+h1Xm4OkmTbJlF4YLyIoiQvPJK7VRLs7oqXDs53W0l4jKUNnsBwHUMKoykQu0Ic
 SyQBLba2QqPsCkdGDq54mhgnvk+KKOWys9n3XeDVBnbwE2fmboR1puh4NJBNI/9ZpSQGsi6LZLXBJ
 r375amDg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:55444 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1uw1W2-0000000006H-0lfA;
 Tue, 09 Sep 2025 17:48:22 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1uw1W0-00000004MCp-0Iuc; Tue, 09 Sep 2025 17:48:20 +0100
In-Reply-To: <aMBaCga5UAXT03Bi@shell.armlinux.org.uk>
References: <aMBaCga5UAXT03Bi@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1uw1W0-00000004MCp-0Iuc@rmk-PC.armlinux.org.uk>
Date: Tue, 09 Sep 2025 17:48:20 +0100
Cc: Richard Cochran <richardcochran@gmail.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Stanislav Fomichev <sdf@fomichev.me>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 bpf@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 11/11] net: stmmac: move
 timestamping/ptp init to stmmac_hw_setup() caller
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

Move the call to stmmac_init_timestamping() or stmmac_setup_ptp() out
of stmmac_hw_setup() to its caller after stmmac_hw_setup() has
successfully completed. This slightly changes the ordering during
setup, but should be safe to do.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index ff12c4b34eb6..8c8ca5999bd8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3436,7 +3436,7 @@ static void stmmac_safety_feat_configuration(struct stmmac_priv *priv)
  *  0 on success and an appropriate (-)ve integer as defined in errno.h
  *  file on failure.
  */
-static int stmmac_hw_setup(struct net_device *dev, bool ptp_register)
+static int stmmac_hw_setup(struct net_device *dev)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
 	u32 rx_cnt = priv->plat->rx_queues_to_use;
@@ -3507,11 +3507,6 @@ static int stmmac_hw_setup(struct net_device *dev, bool ptp_register)
 
 	stmmac_mmc_setup(priv);
 
-	if (ptp_register)
-		stmmac_setup_ptp(priv);
-	else
-		stmmac_init_timestamping(priv);
-
 	if (priv->use_riwt) {
 		u32 queue;
 
@@ -4000,12 +3995,14 @@ static int __stmmac_open(struct net_device *dev,
 		}
 	}
 
-	ret = stmmac_hw_setup(dev, true);
+	ret = stmmac_hw_setup(dev);
 	if (ret < 0) {
 		netdev_err(priv->dev, "%s: Hw setup failed\n", __func__);
 		goto init_error;
 	}
 
+	stmmac_setup_ptp(priv);
+
 	stmmac_init_coalesce(priv);
 
 	phylink_start(priv->phylink);
@@ -7917,7 +7914,7 @@ int stmmac_resume(struct device *dev)
 	stmmac_free_tx_skbufs(priv);
 	stmmac_clear_descriptors(priv, &priv->dma_conf);
 
-	ret = stmmac_hw_setup(ndev, false);
+	ret = stmmac_hw_setup(ndev);
 	if (ret < 0) {
 		netdev_err(priv->dev, "%s: Hw setup failed\n", __func__);
 		mutex_unlock(&priv->lock);
@@ -7925,6 +7922,8 @@ int stmmac_resume(struct device *dev)
 		return ret;
 	}
 
+	stmmac_init_timestamping(priv);
+
 	stmmac_init_coalesce(priv);
 	phylink_rx_clk_stop_block(priv->phylink);
 	stmmac_set_rx_mode(ndev);
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

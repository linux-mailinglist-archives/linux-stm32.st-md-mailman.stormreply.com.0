Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA4445F149
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Nov 2021 17:07:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F4B0C5A4FD;
	Fri, 26 Nov 2021 16:07:22 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B067FC57189
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Nov 2021 15:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1637941902;
 x=1669477902;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZKY0ZUn6hBuF4L45SUjR2Of2kdJCM0Bs6BEONxhZqMk=;
 b=dGc/W9+A12sqq6jUQOUB7Jcuzy9U1Eoz68qWdJTnab6eCiKz6QofvB+S
 sWIWN+k5DSvYvkbAap0QW90iqaaDhhJxVlGyCsNtnWGgDKPJ+UzpOwSCR
 Ge46TULMcGLJhgbiByWJu/gcYXv+vV3TLVUBuOBp1y/eSMjPZUyVYeg8u
 7LII1NLsJ4VTmBo+8LhQXuyq6xROFUHoOrc/Iwx2I/0cTto12UUf32iNL
 RS0IcRIM3LUjrSSkAfAhqA13nYyiQvXlEXcd/2Ekvrpom7HlmOXc0xKN1
 kcwiI6xDNayxKR7Roy/hBB1vljvHPr1Di5ygGstF59+e5pXc9HKz35Wn+ Q==;
From: Vincent Whitchurch <vincent.whitchurch@axis.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, "David S.
 Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>
Date: Fri, 26 Nov 2021 16:51:15 +0100
Message-ID: <20211126155115.12394-1-vincent.whitchurch@axis.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 26 Nov 2021 16:07:21 +0000
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, netdev@vger.kernel.org,
 Vincent Whitchurch <vincent.whitchurch@axis.com>, linux-kernel@vger.kernel.org,
 kernel@axis.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net] net: stmmac: Avoid DMA_CHAN_CONTROL write
	if no Split Header support
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

The driver assumes that split headers can be enabled/disabled without
stopping/starting the device, so it writes DMA_CHAN_CONTROL from
stmmac_set_features().  However, on my system (IP v5.10a without Split
Header support), simply writing DMA_CHAN_CONTROL when DMA is running
(for example, with the commands below) leads to a TX watchdog timeout.

 host$ socat TCP-LISTEN:1024,fork,reuseaddr - &
 device$ ethtool -K eth0 tso off
 device$ ethtool -K eth0 tso on
 device$ dd if=/dev/zero bs=1M count=10 | socat - TCP4:host:1024
 <tx watchdog timeout>

Note that since my IP is configured without Split Header support, the
driver always just reads and writes the same value to the
DMA_CHAN_CONTROL register.

I don't have access to any platforms with Split Header support so I
don't know if these writes to the DMA_CHAN_CONTROL while DMA is running
actually work properly on such systems.  I could not find anything in
the databook that says that DMA_CHAN_CONTROL should not be written when
the DMA is running.

But on systems without Split Header support, there is in any case no
need to call enable_sph() in stmmac_set_features() at all since SPH can
never be toggled, so we can avoid the watchdog timeout there by skipping
this call.

Fixes: 8c6fc097a2f4acf ("net: stmmac: gmac4+: Add Split Header support")
Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 2eb284576336..0ee513f67677 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5504,8 +5504,6 @@ static int stmmac_set_features(struct net_device *netdev,
 			       netdev_features_t features)
 {
 	struct stmmac_priv *priv = netdev_priv(netdev);
-	bool sph_en;
-	u32 chan;
 
 	/* Keep the COE Type in case of csum is supporting */
 	if (features & NETIF_F_RXCSUM)
@@ -5517,10 +5515,13 @@ static int stmmac_set_features(struct net_device *netdev,
 	 */
 	stmmac_rx_ipc(priv, priv->hw);
 
-	sph_en = (priv->hw->rx_csum > 0) && priv->sph;
+	if (priv->sph_cap) {
+		bool sph_en = (priv->hw->rx_csum > 0) && priv->sph;
+		u32 chan;
 
-	for (chan = 0; chan < priv->plat->rx_queues_to_use; chan++)
-		stmmac_enable_sph(priv, priv->ioaddr, sph_en, chan);
+		for (chan = 0; chan < priv->plat->rx_queues_to_use; chan++)
+			stmmac_enable_sph(priv, priv->ioaddr, sph_en, chan);
+	}
 
 	return 0;
 }
-- 
2.33.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

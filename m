Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 252E2122A5F
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Dec 2019 12:42:57 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D347AC36B0E;
	Tue, 17 Dec 2019 11:42:56 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (us03-smtprelay2.synopsys.com
 [149.117.87.133])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BC07FC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Dec 2019 11:42:54 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 43846C00BD;
 Tue, 17 Dec 2019 11:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1576582973; bh=QGBt5iajXK05KEIAGjP4Yq1Ag2fr6PeaLdY7M7bfxDQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=dj55FjSsdexIenirs/O1vTgE47xvA9GStoqSsSopnT1dLf2iwW3cgQ5oZbljXjqS+
 XjlKyp/HN5CtzJK7K0LUoEiZ+aSgTTaJL3s81qtaL8w1IZVjvMMN1PG/wjFavzCu7i
 K7ncwYUthtrHN5SOB//ynUA+6vCt+hLvxqjVosg1TPeI04MK46loiMwUz+RLQr7bYo
 ZugYfnH89cF+pvIgGTKjVj32LLphgqqdUnY+MWjSM1ePg9k8BbSqMNx0JMO8Idnibw
 im9VLFTRCf3g9J39YdFeYOSzqZlKPJuEKmquNUaZCBVAI7fnXIwBNfWH1YxOjwcxiT
 kmdLLakGw0KZg==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id C7A3CA008D;
 Tue, 17 Dec 2019 11:42:50 +0000 (UTC)
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: netdev@vger.kernel.org
Date: Tue, 17 Dec 2019 12:42:32 +0100
Message-Id: <a060ccfbcb6a57f73af0d797fb6c829a4c37c5fb.1576581853.git.Jose.Abreu@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1576581853.git.Jose.Abreu@synopsys.com>
References: <cover.1576581853.git.Jose.Abreu@synopsys.com>
In-Reply-To: <cover.1576581853.git.Jose.Abreu@synopsys.com>
References: <cover.1576581853.git.Jose.Abreu@synopsys.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 Jakub Kicinski <jakub.kicinski@netronome.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net v2 2/8] net: stmmac: Determine earlier the
	size of RX buffer
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

Split Header feature needs to know the size of RX buffer but current
code is determining it too late. Fix this by moving the RX buffer
computation to earlier stage

Fixes: 67afd6d1cfdf ("net: stmmac: Add Split Header support and enable it in XGMAC cores")
Signed-off-by: Jose Abreu <Jose.Abreu@synopsys.com>

---
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Jose Abreu <joabreu@synopsys.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 24 +++++++++++------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index bbc65bd332a8..dfecced43f29 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1293,19 +1293,9 @@ static int init_dma_rx_desc_rings(struct net_device *dev, gfp_t flags)
 	struct stmmac_priv *priv = netdev_priv(dev);
 	u32 rx_count = priv->plat->rx_queues_to_use;
 	int ret = -ENOMEM;
-	int bfsize = 0;
 	int queue;
 	int i;
 
-	bfsize = stmmac_set_16kib_bfsize(priv, dev->mtu);
-	if (bfsize < 0)
-		bfsize = 0;
-
-	if (bfsize < BUF_SIZE_16KiB)
-		bfsize = stmmac_set_bfsize(dev->mtu, priv->dma_buf_sz);
-
-	priv->dma_buf_sz = bfsize;
-
 	/* RX INITIALIZATION */
 	netif_dbg(priv, probe, priv->dev,
 		  "SKB addresses:\nskb\t\tskb data\tdma data\n");
@@ -1347,8 +1337,6 @@ static int init_dma_rx_desc_rings(struct net_device *dev, gfp_t flags)
 		}
 	}
 
-	buf_sz = bfsize;
-
 	return 0;
 
 err_init_rx_buffers:
@@ -2658,6 +2646,7 @@ static void stmmac_hw_teardown(struct net_device *dev)
 static int stmmac_open(struct net_device *dev)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
+	int bfsize = 0;
 	u32 chan;
 	int ret;
 
@@ -2677,7 +2666,16 @@ static int stmmac_open(struct net_device *dev)
 	memset(&priv->xstats, 0, sizeof(struct stmmac_extra_stats));
 	priv->xstats.threshold = tc;
 
-	priv->dma_buf_sz = STMMAC_ALIGN(buf_sz);
+	bfsize = stmmac_set_16kib_bfsize(priv, dev->mtu);
+	if (bfsize < 0)
+		bfsize = 0;
+
+	if (bfsize < BUF_SIZE_16KiB)
+		bfsize = stmmac_set_bfsize(dev->mtu, priv->dma_buf_sz);
+
+	priv->dma_buf_sz = STMMAC_ALIGN(bfsize);
+	buf_sz = bfsize;
+
 	priv->rx_copybreak = STMMAC_RX_COPYBREAK;
 
 	ret = alloc_dma_desc_resources(priv);
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E696B84EE
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Mar 2023 23:42:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 074DBC6907C;
	Mon, 13 Mar 2023 22:42:48 +0000 (UTC)
Received: from post.baikalelectronics.com (post.baikalelectronics.com
 [213.79.110.86])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C9A8C69053
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Mar 2023 22:42:46 +0000 (UTC)
Received: from post.baikalelectronics.com (localhost.localdomain [127.0.0.1])
 by post.baikalelectronics.com (Proxmox) with ESMTP id 09F59E0EB4;
 Tue, 14 Mar 2023 01:42:46 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 baikalelectronics.ru; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:from:from:in-reply-to:message-id
 :mime-version:references:reply-to:subject:subject:to:to; s=post;
 bh=US31HouRoyMBnlLGMU7EgoCsBVjhU1OheQVzY6/fVjc=; b=miFDaKRQpVIE
 QXS/35hUcrjATBciOUcMXd5hlqMi7XiMFL3QiW0Kn+k2Y5i2rtWDhP3BVmZJL6/B
 aaAdNDNrULgVgDzFWpW1rAita5YpsJ30mbrRha5SqBbGZHHeIGgKRwmcHDF+rQwL
 K0OLdT+wZu6nGBq/+Db+pN4BOMQd8xA=
Received: from mail.baikal.int (mail.baikal.int [192.168.51.25])
 by post.baikalelectronics.com (Proxmox) with ESMTP id E0312E0E6A;
 Tue, 14 Mar 2023 01:42:45 +0300 (MSK)
Received: from localhost (10.8.30.10) by mail (192.168.51.25) with Microsoft
 SMTP Server (TLS) id 15.0.1395.4; Tue, 14 Mar 2023 01:42:45 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Russell King <linux@armlinux.org.uk>, Andrew
 Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Date: Tue, 14 Mar 2023 01:42:27 +0300
Message-ID: <20230313224237.28757-4-Sergey.Semin@baikalelectronics.ru>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313224237.28757-1-Sergey.Semin@baikalelectronics.ru>
References: <20230313224237.28757-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
X-Originating-IP: [10.8.30.10]
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Cc: Biao Huang <biao.huang@mediatek.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Yang Yingliang <yangyingliang@huawei.com>,
 Christian Marangi <ansuelsmth@gmail.com>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net 03/13] net: stmmac: Fix extended
	descriptors usage for jumbos in chain-mode
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

If a DW MAC NIC is synthesized to support the extended descriptors, then
the driver uses dma_etx pointer to keep an array of once in the Tx DMA
Queue structures. For some reason the specific to the chained-mode
jumbo_frm() referred to the dma_tx pointer of DMA Tx Queue descriptor in
any case, which of course was initialized with NULL for the DW MACs
expecting extended descriptors being specified. So any attempt to send a
Jumbo frame in chain-mode caused "Unable to handle kernel paging request
at virtual address" kernel crash. Fix that by selecting a proper
descriptor pointer depending on whether the NIC supports extended
descriptors or not.

Fixes: c24602ef8664 ("stmmac: support extend descriptors")
Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>

---

Yeah, that Normal/Enhanced access pattern really annoying. Food for
thoughts about a more thorough cleanup of the driver.
---
 drivers/net/ethernet/stmicro/stmmac/chain_mode.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/chain_mode.c b/drivers/net/ethernet/stmicro/stmmac/chain_mode.c
index 60e4fa5060ce..9a92f0c5e577 100644
--- a/drivers/net/ethernet/stmicro/stmmac/chain_mode.c
+++ b/drivers/net/ethernet/stmicro/stmmac/chain_mode.c
@@ -24,7 +24,10 @@ static int jumbo_frm(void *p, struct sk_buff *skb, int csum)
 	unsigned int i = 1, len;
 	struct dma_desc *desc;
 
-	desc = tx_q->dma_tx + entry;
+	if (priv->extend_desc)
+		desc = (struct dma_desc *)(tx_q->dma_etx + entry);
+	else
+		desc = tx_q->dma_tx + entry;
 
 	if (priv->plat->enh_desc)
 		bmax = BUF_SIZE_8KiB;
@@ -47,7 +50,11 @@ static int jumbo_frm(void *p, struct sk_buff *skb, int csum)
 	while (len != 0) {
 		tx_q->tx_skbuff[entry] = NULL;
 		entry = STMMAC_GET_ENTRY(entry, priv->dma_conf.dma_tx_size);
-		desc = tx_q->dma_tx + entry;
+
+		if (priv->extend_desc)
+			desc = (struct dma_desc *)(tx_q->dma_etx + entry);
+		else
+			desc = tx_q->dma_tx + entry;
 
 		if (len > bmax) {
 			des2 = dma_map_single(priv->device,
-- 
2.39.2


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 7JZiCnfaCmou8wQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 18 May 2026 11:23:03 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9A95699AC
	for <lists+linux-stm32@lfdr.de>; Mon, 18 May 2026 11:23:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C9883C5F1D4;
	Mon, 18 May 2026 09:22:59 +0000 (UTC)
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 083DBC01FB6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 May 2026 05:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=ii
 zYTJX5EmybqG8LJ5U61c42f+3Bl+gwgY9z3qf5SUk=; b=ZgvlwtMbvG5zdcwKM1
 bEcBP1pCGEoye4D0eALrnDkBR3EqjbXMyYhyXkdYrBLw4MInHo4EsX/rgGK0dfbS
 Fxy3xuBLGRgTn02mrX7dxRRJt7whzWIK8CT1oL8xXUFO1m0jg1gWKc5SL/7zEucT
 qwl7fSzVxeDaLnhWJibFu6vrU=
Received: from PC-YLX4CAEK.company.local (unknown [])
 by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id
 _____wD3n5GCsQZqBgrWBQ--.2418S2; 
 Fri, 15 May 2026 13:39:15 +0800 (CST)
From: Ding Hui <dinghui1111@163.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 netdev@vger.kernel.org (open list:STMMAC ETHERNET DRIVER),
 linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32
 ARCHITECTURE), 
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE), 
 linux-kernel@vger.kernel.org (open list)
Date: Fri, 15 May 2026 13:38:37 +0800
Message-Id: <20260515053856.2310369-1-dinghui1111@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: _____wD3n5GCsQZqBgrWBQ--.2418S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGw1Dtw47Ww4DGw4rCr1ftFb_yoW5Kr1rpa
 9Ik3y2yw1ktF4xJw43Jw48ZFy5XayrtF45G3s7Gws3ua1avF9Yvr13trWjva48CFn5AF1f
 tFW5Caykua1UArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jEsjbUUUUU=
X-Originating-IP: [220.248.55.69]
X-CM-SenderInfo: pglqwx1xlriiqr6rljoofrz/xtbC8wOo1GoGsYOaZwAA3v
X-Mailman-Approved-At: Mon, 18 May 2026 09:22:57 +0000
Cc: dinghui@lixiang.com, xiasanbo@lixiang.com, liuxuanjun@lixiang.com,
 yangchen11@lixiang.com
Subject: [Linux-stm32] [PATCH] net: stmmac: fix fatal bus error on resume by
	reinitializing RX buffers
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
X-Rspamd-Queue-Id: AD9A95699AC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	DATE_IN_PAST(1.00)[75];
	R_DKIM_REJECT(1.00)[163.com:s=s110527];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[163.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_FROM(0.00)[163.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:rmk+kernel@armlinux.org.uk,m:maxime.chevallier@bootlin.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:dinghui@lixiang.com,m:xiasanbo@lixiang.com,m:liuxuanjun@lixiang.com,m:yangchen11@lixiang.com,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[dinghui1111@163.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,armlinux.org.uk,bootlin.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[163.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[dinghui1111@163.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_SPAM(0.00)[0.997];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Action: no action

From: Ding Hui <dinghui@lixiang.com>

On suspend, stmmac_suspend() calls stmmac_disable_all_queues() which
stops the RX NAPI, but the RX DMA engine may still be running for a
short window before stmmac_stop_all_dma() takes effect. During that
window the hardware can write incoming frames into the buffers pointed
to by the RX descriptors and write back the descriptors (clearing the
OWN bit, updating length/status). Because NAPI is already disabled,
the driver never refills these descriptors, so the RX ring is left in
a "consumed but not refilled" state with HW-written content in the
descriptor buffer-address fields.

On resume, stmmac_clear_descriptors() only re-arms the OWN bit (rdes3)
and does not repopulate the RX buffer address fields. As a result the
descriptors still contain whatever the hardware wrote back during the
suspend race. When the DMA is restarted, it dereferences these stale
addresses and triggers a fatal bus error.

Fix this by treating the RX ring the same way as on close/open around
a PM transition:

 - In stmmac_suspend(), after stmmac_stop_all_dma(), walk every RX
   queue and free its buffers via dma_free_rx_xskbufs() when an XSK
   pool is attached or dma_free_rx_skbufs() otherwise, then reset
   rx_q->buf_alloc_num and clear rx_q->xsk_pool so the queue state
   matches a freshly closed queue.

 - In stmmac_resume(), call init_dma_rx_desc_rings() before
   stmmac_reset_queues_param() so RX buffers are re-allocated and
   the descriptor buffer-address fields are properly repopulated
   before the DMA is restarted.

After this change, post-resume RX descriptors always reference freshly
allocated, driver-owned buffers, and the bus error no longer occurs.

Signed-off-by: Ding Hui <dinghui@lixiang.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 3591755ea30b..8ed43187cf20 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -8176,6 +8176,9 @@ int stmmac_suspend(struct device *dev)
 {
 	struct net_device *ndev = dev_get_drvdata(dev);
 	struct stmmac_priv *priv = netdev_priv(ndev);
+	u32 rx_count = priv->plat->rx_queues_to_use;
+	struct stmmac_rx_queue *rx_q;
+	u32 queue;
 	u8 chan;
 
 	if (!ndev || !netif_running(ndev))
@@ -8198,6 +8201,19 @@ int stmmac_suspend(struct device *dev)
 	/* Stop TX/RX DMA */
 	stmmac_stop_all_dma(priv);
 
+	/* Free RX queue resources */
+	for (queue = 0; queue < rx_count; queue++) {
+		rx_q = &priv->dma_conf.rx_queue[queue];
+
+		/* Release the DMA RX socket buffers */
+		if (rx_q->xsk_pool)
+			dma_free_rx_xskbufs(priv, &priv->dma_conf, queue);
+		else
+			dma_free_rx_skbufs(priv, &priv->dma_conf, queue);
+		rx_q->buf_alloc_num = 0;
+		rx_q->xsk_pool = NULL;
+	}
+
 	stmmac_legacy_serdes_power_down(priv);
 
 	/* Enable Power down mode by programming the PMT regs */
@@ -8316,6 +8332,14 @@ int stmmac_resume(struct device *dev)
 
 	mutex_lock(&priv->lock);
 
+	ret = init_dma_rx_desc_rings(ndev, &priv->dma_conf, GFP_KERNEL);
+	if (ret < 0) {
+		netdev_err(priv->dev, "%s: rx dma desc rings init failed\n", __func__);
+		mutex_unlock(&priv->lock);
+		rtnl_unlock();
+		return ret;
+	}
+
 	stmmac_reset_queues_param(priv);
 
 	stmmac_free_tx_skbufs(priv);
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

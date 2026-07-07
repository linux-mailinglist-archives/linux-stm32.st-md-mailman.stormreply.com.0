Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id G9H8CFM6TWpzxAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 07 Jul 2026 19:41:39 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C172971E5A3
	for <lists+linux-stm32@lfdr.de>; Tue, 07 Jul 2026 19:41:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=samsung.com header.s=mail20170921 header.b=A1ckOZHH;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=samsung.com (policy=none);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64A38C8F294;
	Tue,  7 Jul 2026 17:41:38 +0000 (UTC)
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0DDCC7A837
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jul 2026 17:41:36 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20260707174136euoutp022224067d99e4385527e2b2f6be02a4f6~AEsahXJh82060220602euoutp02T
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jul 2026 17:41:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20260707174136euoutp022224067d99e4385527e2b2f6be02a4f6~AEsahXJh82060220602euoutp02T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1783446096;
 bh=AmE2NCWEGqRcLM+LMVgE5fFK2Ck+Oh+zbVbQcB5UN8M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=A1ckOZHHAaOQlEwizaRUBWQZ826ol2vwIi84r6ZunIlV4aRe/cMpMQ0vow1S+e0iw
 ZTM21HTC6blwxIbR/2+4lkkB5N50yOzQt9VJNtSG9j/6Pn8PTCDcTHxrTw7K0rgutG
 TcWlf9j9wWHFad7Ycjl72JVo6ar4bds5fLlg6FZ0=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20260707174136eucas1p2dca8fd11dc7642c913eb03bcdf5aa276~AEsaLXv5H2373123731eucas1p2o;
 Tue,  7 Jul 2026 17:41:36 +0000 (GMT)
Received: from AMDC4843.eu.corp.samsungelectronics.net (unknown
 [106.120.77.61]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20260707174135eusmtip1b520284028cd3af631ae6a0f945dd8d2~AEsZeKA-V1541815418eusmtip1M;
 Tue,  7 Jul 2026 17:41:35 +0000 (GMT)
From: Jakub Raczynski <j.raczynski@samsung.com>
To: netdev@vger.kernel.org
Date: Tue,  7 Jul 2026 19:41:15 +0200
Message-Id: <20260707174115.1264466-3-j.raczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260707174115.1264466-1-j.raczynski@samsung.com>
MIME-Version: 1.0
X-CMS-MailID: 20260707174136eucas1p2dca8fd11dc7642c913eb03bcdf5aa276
X-Msg-Generator: CA
X-RootMTR: 20260707174136eucas1p2dca8fd11dc7642c913eb03bcdf5aa276
X-EPHeader: CA
X-CMS-RootMailID: 20260707174136eucas1p2dca8fd11dc7642c913eb03bcdf5aa276
References: <20260707174115.1264466-1-j.raczynski@samsung.com>
 <CGME20260707174136eucas1p2dca8fd11dc7642c913eb03bcdf5aa276@eucas1p2.samsung.com>
Cc: Jakub Raczynski <j.raczynski@samsung.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, Sashiko AI <sashiko-bot@kernel.org>,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, k.domagalski@samsung.com,
 k.tegowski@samsung.com, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net 2/2] net/stmmac: Prevent dma queue NULL
 free on allocation failure
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[samsung.com:s=mail20170921];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[samsung.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	GREYLIST(0.00)[pass,meta];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[j.raczynski@samsung.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[samsung.com,vger.kernel.org,st-md-mailman.stormreply.com,lunn.ch,google.com,kernel.org,gmail.com,redhat.com,davemloft.net,lists.infradead.org];
	FORGED_RECIPIENTS(0.00)[m:netdev@vger.kernel.org,m:j.raczynski@samsung.com,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:sashiko-bot@kernel.org,m:mcoquelin.stm32@gmail.com,m:kuba@kernel.org,m:k.domagalski@samsung.com,m:k.tegowski@samsung.com,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[j.raczynski@samsung.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[samsung.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C172971E5A3

During allocation of RX/TX descriptor resources and its DMA,
there is verification of failed dma_alloc_coherent() due to lack of memory.
In case of that failure, all allocated resources are freed instantly after,
but there are no checks for dma_free_coherent() whether previous step has
failed.
This will generally result in panic due to freeing NULL address.

Fix it by adding NULL verification of memory that is to be freed.

Theoretically code should also set address of pointed memory to zero when
freeing, but currently the only path of invalid address is non intialized zero,
and there is no case possible of double-free of same memory.

Fixes: e73b19baa3b1c ("net: stmmac: simplify DMA descriptor allocation/init/freeing")
Reported-by: Sashiko AI <sashiko-bot@kernel.org>
Signed-off-by: Jakub Raczynski <j.raczynski@samsung.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c    | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 3098971e0b66..187d9bbc61d9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2146,7 +2146,6 @@ static void __free_dma_rx_desc_resources(struct stmmac_priv *priv,
 					 u32 queue)
 {
 	struct stmmac_rx_queue *rx_q = &dma_conf->rx_queue[queue];
-	size_t size;
 	void *addr;
 
 	/* Release the DMA RX socket buffers */
@@ -2164,9 +2163,12 @@ static void __free_dma_rx_desc_resources(struct stmmac_priv *priv,
 	else
 		addr = rx_q->dma_rx;
 
-	size = stmmac_get_rx_desc_size(priv) * dma_conf->dma_rx_size;
+	if (!IS_ERR_OR_NULL(addr)) {
+		size_t size;
+		size = stmmac_get_rx_desc_size(priv) * dma_conf->dma_rx_size;
 
-	dma_free_coherent(priv->device, size, addr, rx_q->dma_rx_phy);
+		dma_free_coherent(priv->device, size, addr, rx_q->dma_rx_phy);
+	}
 
 	if (xdp_rxq_info_is_reg(&rx_q->xdp_rxq))
 		xdp_rxq_info_unreg(&rx_q->xdp_rxq);
@@ -2198,7 +2200,6 @@ static void __free_dma_tx_desc_resources(struct stmmac_priv *priv,
 					 u32 queue)
 {
 	struct stmmac_tx_queue *tx_q = &dma_conf->tx_queue[queue];
-	size_t size;
 	void *addr;
 
 	/* Release the DMA TX socket buffers */
@@ -2212,9 +2213,12 @@ static void __free_dma_tx_desc_resources(struct stmmac_priv *priv,
 		addr = tx_q->dma_tx;
 	}
 
-	size = stmmac_get_tx_desc_size(priv, tx_q) * dma_conf->dma_tx_size;
+	if (!IS_ERR_OR_NULL(addr)) {
+		size_t size;
+		size = stmmac_get_tx_desc_size(priv, tx_q) * dma_conf->dma_tx_size;
 
-	dma_free_coherent(priv->device, size, addr, tx_q->dma_tx_phy);
+		dma_free_coherent(priv->device, size, addr, tx_q->dma_tx_phy);
+	}
 
 	kfree(tx_q->tx_skbuff_dma);
 	kfree(tx_q->tx_skbuff);
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
